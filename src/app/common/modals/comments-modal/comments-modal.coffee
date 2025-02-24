angular.module("doubtfire.common.modals.comments-modal", [])
#
# Modal to contain an image used in user comments.
#
.factory("CommentsModal", ($modal) ->
  CommentsModal = {}
  CommentsModal.show = (commentResourceUrl, commentType) ->
    $modal.open
      templateUrl: 'common/modals/comments-modal/comments-modal.tpl.html'
      controller: 'CommentsModalCtrl'
      size: 'lg'
      resolve:
        commentResourceUrl: -> commentResourceUrl
        commentType: -> commentType
  CommentsModal
)
.controller("CommentsModalCtrl", ($scope, $modalInstance, $sce, commentResourceUrl, commentType, alertService, fileDownloaderService) ->
  # $scope.commentResourceUrl = $sce.trustAsResourceUrl(commentResourceUrl)
  $scope.commentType = commentType
  $scope.close = ->
    fileDownloaderService.releaseBlob($scope.rawResourceUrl)
    $modalInstance.dismiss()

  fileDownloaderService.downloadBlob(
    commentResourceUrl,
    (url, response) ->
      $scope.rawResourceUrl = url
      $scope.commentResourceUrl = $sce.trustAsResourceUrl(url)
    (error) ->
      alertService.error( "Error downloading comment: #{error}")
  )
)

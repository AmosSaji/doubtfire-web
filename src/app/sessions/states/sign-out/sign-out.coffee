angular.module("doubtfire.sessions.states.sign-out", [])

#
# State for sign out
#
.config(($stateProvider) ->
  signOutStateData =
    url: "/sign_out"
    views:
      main:
        controller: "SignOutCtrl"
        templateUrl: "sessions/states/sign-out/sign-out.tpl.html"
    data:
      pageTitle: "_Sign Out_"
  $stateProvider.state "sign_out", signOutStateData
)
.controller("SignOutCtrl", ($state, $timeout, $http, DoubtfireConstants, GlobalStateService, authenticationService) ->
  authenticationService.signOut()
  GlobalStateService.hideHeader()
  GlobalStateService.setView("OTHER")
  GlobalStateService.clearUnitsAndProjects()

  if DoubtfireConstants.SignoutURL?
    window.location.assign(DoubtfireConstants.SignoutURL)
  else
    $timeout (-> $state.go "sign_in"), 500
)

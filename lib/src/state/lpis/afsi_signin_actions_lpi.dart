

import 'package:afib/afib_flutter.dart';

class AFSISigninActionsLPI extends AFLibraryProgrammingInterface {

  AFSISigninActionsLPI(AFLibraryProgrammingInterfaceID id, AFDispatcher dispatcher, AFPublicState state): super(id, dispatcher, state);

  factory AFSISigninActionsLPI.create(AFLibraryProgrammingInterfaceID id, AFDispatcher dispatcher, AFPublicState state) {
    return AFSISigninActionsLPI(id, dispatcher, state);
  }
  
  void onSignin(String email, String password, { required bool rememberMe }) {
    navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onSignin");
  }
  
  void onResetPassword(String email) {
    navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onResetPassword");
  }

  void onSignup(String email, String password) {
    navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onSignup");
  }
}


import 'package:afib/afib_flutter.dart';

class AFSISigninActionsLPI extends AFLibraryProgrammingInterface {

  AFSISigninActionsLPI(AFLibraryProgrammingInterfaceID id, AFLibraryProgrammingInterfaceContext context): super(id, context);

  factory AFSISigninActionsLPI.create(AFLibraryProgrammingInterfaceID id, AFLibraryProgrammingInterfaceContext context) {
    return AFSISigninActionsLPI(id, context);
  }
  
  void onSignin(String email, String password, { required bool rememberMe }) {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onSignin");
  }
  
  void onResetPassword(String email) {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onResetPassword");
  }

  void onSignup(String email, String password) {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onSignup");
  }

  void on2Fa(String token) {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.on2Fa");
  }
}
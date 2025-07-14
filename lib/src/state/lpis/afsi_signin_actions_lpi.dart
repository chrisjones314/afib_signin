

import 'package:afib/afib_command.dart';
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_flutter.dart';

class AFSISigninActionsLPI extends AFLibraryProgrammingInterface {

  AFSISigninActionsLPI(AFLibraryProgrammingInterfaceID id, AFLibraryProgrammingInterfaceContext context): super(id, context);

  factory AFSISigninActionsLPI.create(AFLibraryProgrammingInterfaceID id, AFLibraryProgrammingInterfaceContext context) {
    return AFSISigninActionsLPI(id, context);
  }

  void onPressedSigninRegister({ required String email }) {
    context.navigatePush(AFSIRegisterScreen.navigatePush(email: email));          
  }

  void onPressedSigninForgotPassword({ required String email }) {
    context.navigatePush(AFSIForgotPasswordScreen.navigatePush(email: email));    
  }
  
  void onSignin(String email, String password, { required bool rememberMe }) {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onSignin");
  }

  void onChangePassword(String currentPassword, String newPassword) {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onChangedPassword");
  }

  void onChangeEmail(String currentPassword, String newEmail) {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onChangeEmail");
  }

  void onResetPassword(String email) {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onResetPassword");
  }

  void onSignup(String email, String password) {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onSignup");
  }

  void onPressedGoogleSignin() {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onSignup");
  }

  void onPressedFacebookSignin() {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onSignup");
  }

  void onPressedAppleSignin() {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onSignup");
  }

  void onPressedEmailSignin() {
    context.navigatePush(AFSISigninScreen.navigatePushReady());
  }

  void on2Fa(String token) {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.on2Fa");
  }

  void onSignout() {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.on2Fa");
  }

   void onDeleteAccount(String confirmText) {
    context.navigateToUnimplementedScreen("You must override AFSISigninActionsLPI.onDeleteAccount");
  }

  void onReturnToSigninAfterDelete() {
    context.navigateReplaceAll(SocialSigninChoiceScreen.navigateAfterSignout().castToReplaceAll());
  }
 
  
  bool isPasswordConfirmMatch(String password, String confirm) {
    return password.compareTo(confirm) == 0;
  }

}
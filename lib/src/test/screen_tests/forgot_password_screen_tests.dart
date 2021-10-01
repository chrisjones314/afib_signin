import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:flutter_test/flutter_test.dart' as ft;

void initForgotPasswordScreenTests(AFSingleScreenTestDefinitionContext definitions) {
  final testAdapter = AFSITestActionConfiguration();
  // the welcome screen with login choice.
  var prototype = definitions.definePrototype(
      id: AFSIPrototypeID.forgotPassword,
      navigate: ForgotPasswordScreen.navigatePush(testAdapter),
      stateViews: AFStateView.unused()
    );

   // a test to be sure the correct widgets are present.
  definitions.defineReusableTest1(
    id: AFSIScreenTestID.forgotPasswordSubmit, 
    prototype: prototype,
    param1: "testuser@test.com",
    body: (e, email) async {
      await e.setValue(AFSIWidgetID.editEmail, email);
      await e.applyTap(AFSIWidgetID.buttonResetPassword);
      e.expect(testAdapter.email, ft.equals(email));
  });

}


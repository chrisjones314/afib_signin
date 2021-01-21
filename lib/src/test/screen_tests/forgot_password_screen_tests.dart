import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:flutter_test/flutter_test.dart' as ft;

void initForgotPasswordScreenTests(AFSingleScreenTestDefinitionContext definitions) {
  final testAdapter = AFSITestActionConfiguration();
  // the welcome screen with login choice.
  var prototype = definitions.definePrototype(
      id: AFSIScreenTestID.forgotPassword,
      navigate: ForgotPasswordScreen.navigatePush(testAdapter),
      stateViews: AFStateView()
    );

   // a test to be sure the correct widgets are present.
  definitions.defineReusableTest1(
    id: AFSIReusableTestID.forgotPasswordSubmit, 
    prototype: prototype,
    param1: "testuser@test.com",
    describeParam1: "Email",
    body: (e, email) async {
      await e.setValue(AFSIWidgetID.editEmail, email);
      await e.tap(AFSIWidgetID.buttonResetPassword);
      e.expect(testAdapter.email, ft.equals(email));
  });

}


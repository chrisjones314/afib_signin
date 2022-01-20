import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:flutter_test/flutter_test.dart' as ft;

void initForgotPasswordScreenTests(AFSingleScreenTestDefinitionContext definitions) {
  final testAdapter = AFSITestActionConfiguration();
  // the welcome screen with login choice.
  var prototype = definitions.definePrototype(
      id: AFSIPrototypeID.forgotPassword,
      navigate: ForgotPasswordScreen.navigatePush(testAdapter),
      models: null
    );

   // a test to be sure the correct widgets are present.
  definitions.defineReusableTest(
    id: AFSIScreenTestID.forgotPasswordSubmit, 
    prototype: prototype,
    params: ["testuser@test.com"],
    body: (e, params) async {
      final email = params.getParam<String>(0); 

      await e.setValue(AFSIWidgetID.editEmail, email);
      await e.applyTap(AFSIWidgetID.buttonResetPassword);
      e.expect(testAdapter.email, ft.equals(email));
  });

}


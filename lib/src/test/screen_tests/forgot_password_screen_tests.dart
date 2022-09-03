import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';

void initForgotPasswordScreenTests(AFUIPrototypeDefinitionContext definitions) {
  // the welcome screen with login choice.
  var prototype = definitions.defineScreenPrototype(
      id: AFSIPrototypeID.forgotPassword,
      navigate: AFSIForgotPasswordScreen.navigatePush(),
      stateView: null
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
  });

}


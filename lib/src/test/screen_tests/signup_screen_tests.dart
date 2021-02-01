import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/screens/signup_screen.dart';
import 'package:flutter_test/flutter_test.dart' as ft;

void initSignupScreenTests(AFSingleScreenTestDefinitionContext definitions) {
  final testAdapter = AFSITestActionConfiguration();
  // the welcome screen with login choice.
  var prototype = definitions.definePrototype(
      id: AFSIScreenTestID.signup,
      navigate: SignupScreen.navigatePush(testAdapter),
      stateViews: AFStateView()
    );

   // a test to be sure the correct widgets are present.
  definitions.defineReusableTest2(
    id: AFSIReusableTestID.signupScreen, 
    prototype: prototype,
    param1: "testuser@test.com",
    param2: "testpass",
    describeParam1: "Email",
    describeParam2: "Password",
    body: (e, email, pass) async {
      await e.setValue(AFSIWidgetID.editEmail, email);
      await e.setValue(AFSIWidgetID.editPassword, pass);
      
      await e.matchTextEquals(AFSIWidgetID.editEmail, email);
      await e.matchTextEquals(AFSIWidgetID.editPassword, pass);
      await e.applyTap(AFSIWidgetID.buttonRegister);
      e.expect(testAdapter.email, ft.equals(email));
      e.expect(testAdapter.password, ft.equals(pass));
  });

}


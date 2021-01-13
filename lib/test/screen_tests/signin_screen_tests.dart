import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/ui/screens/signin_screen.dart';
import 'package:flutter_test/flutter_test.dart' as ft;

void initSigninScreenTests(AFSingleScreenTestDefinitionContext definitions) {
  final testAdapter = AFSITestActionConfiguration();
  // the welcome screen with login choice.
  var prototype = definitions.definePrototype(
      id: AFSIScreenTestID.signin,
      navigate: SigninScreen.navigatePush(testAdapter),
      viewState: AFStateView()
    );

   // a test to be sure the correct widgets are present.
  definitions.defineReusableTest2(
    id: AFSIReusableTestID.signinScreenLogin, 
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
      await e.tap(AFSIWidgetID.buttonLogin);
      e.expect(testAdapter.email, ft.equals(email));
      e.expect(testAdapter.password, ft.equals(pass));
  });

}


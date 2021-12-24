import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:flutter_test/flutter_test.dart' as ft;

void initSigninScreenTests(AFSingleScreenTestDefinitionContext definitions) {
  _initStandardSigninScreen(definitions);
  _initErrorSigninScreen(definitions);

}

void _initStandardSigninScreen(AFSingleScreenTestDefinitionContext definitions) {
  final testAdapter = AFSITestActionConfiguration();
  // the welcome screen with login choice.
  var prototype = definitions.definePrototype(
      id: AFSIPrototypeID.signin,
      navigate: SigninScreen.navigatePushReady(testAdapter),
      models: null,
    );

   // a test to be sure the correct widgets are present.
  definitions.defineReusableTest(
    id: AFSIScreenTestID.signinScreenLogin, 
    prototype: prototype,
    params: ["testuser@test.com", "testpass"],
    body: (e, params) async {
      final email = params.getParam<String>(0);
      final pass = params.getParam<String>(1);
      
      await e.setValue(AFSIWidgetID.editEmail, email);
      await e.setValue(AFSIWidgetID.editPassword, pass);
      
      await e.matchTextEquals(AFSIWidgetID.editEmail, email);
      await e.matchTextEquals(AFSIWidgetID.editPassword, pass);
      await e.applyTap(AFSIWidgetID.buttonLogin);
      if(testAdapter.visited) {
        e.expect(testAdapter.email, ft.equals(email));
        e.expect(testAdapter.password, ft.equals(pass));
      }
  });
}

void _initErrorSigninScreen(AFSingleScreenTestDefinitionContext definitions) {
  final testAdapter = AFSITestActionConfiguration();
  // the welcome screen with login choice.
  final initialParam = SigninScreenRouteParam.createReadyOncePerScreen(screenId: AFSIScreenID.signin, config: testAdapter);
  final errorParam = initialParam.reviseStatus(status: AFSISigninStatus.error, message: "For example: Your username or password did not match our records.");

  definitions.definePrototype(
      id: AFSIPrototypeID.signinWithError,
      navigate: AFNavigatePushAction(routeParam: errorParam),
      models: null,
  );
}

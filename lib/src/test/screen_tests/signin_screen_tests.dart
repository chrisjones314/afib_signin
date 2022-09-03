import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';

void initSigninScreenTests(AFUIPrototypeDefinitionContext definitions) {
  _initStandardSigninScreen(definitions);
  _initErrorSigninScreen(definitions);

}

void _initStandardSigninScreen(AFUIPrototypeDefinitionContext definitions) {
  // the welcome screen with login choice.
  var prototype = definitions.defineScreenPrototype(
      id: AFSIPrototypeID.signin,
      navigate: AFSISigninScreen.navigatePushReady(),
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
  });
}

void _initErrorSigninScreen(AFUIPrototypeDefinitionContext definitions) {
  // the welcome screen with login choice.
  final initialParam = SigninScreenRouteParam.createReadyOncePerScreen(screenId: AFSIScreenID.signin);
  final errorParam = initialParam.reviseStatus(status: AFSISigninStatus.error, message: "For example: Your username or password did not match our records.");

  definitions.defineScreenPrototype(
      id: AFSIPrototypeID.signinWithError,
      navigate: AFNavigatePushAction(launchParam: errorParam),
      models: null,
  );
}

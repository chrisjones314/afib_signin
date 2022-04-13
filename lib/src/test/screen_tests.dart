
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/src/test/screen_tests/forgot_password_screen_tests.dart';
import 'package:afib_signin/src/test/screen_tests/signin_screen_tests.dart';
import 'package:afib_signin/src/test/screen_tests/signup_screen_tests.dart';

void initScreenTests(AFUIPrototypeDefinitionContext definitions) {
  initSigninScreenTests(definitions);
  initForgotPasswordScreenTests(definitions);
  initSignupScreenTests(definitions);
}


import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/screens/signup_screen.dart';

void initScreenMap(AFScreenMap screens) {
  screens.screen(AFSIScreenID.signin,           (_) => SigninScreen());
  screens.screen(AFSIScreenID.forgotPassword, (_) => ForgotPasswordScreen());
  screens.screen(AFSIScreenID.signup, (_) => SignupScreen());
}
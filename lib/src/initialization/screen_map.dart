import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/screens/register_screen.dart';

void initScreenMap(AFScreenMap screens) {
  screens.registerScreen(AFSIScreenID.signin,           (_) => AFSISigninScreen());
  screens.registerScreen(AFSIScreenID.forgotPassword, (_) => ForgotPasswordScreen());
  screens.registerScreen(AFSIScreenID.signup, (_) => AFSIRegisterScreen());
  
}
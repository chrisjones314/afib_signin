
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/register_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';

class AFSIStateTestShortcuts {
  final AFSpecificStateTestDefinitionContext testContext;
  AFSIStateTestShortcuts(this.testContext);

  AFStateTestScreenShortcut<AFSISigninScreenSPI> createSigninScreen() {
    return testContext.createScreenShortcut<AFSISigninScreenSPI>(AFSIScreenID.signin);
  }

  AFStateTestScreenShortcut<AFSIRegisterScreenSPI> createRegisterScreen() {
    return testContext.createScreenShortcut<AFSIRegisterScreenSPI>(AFSIScreenID.register);
  }

  AFStateTestScreenShortcut<AFSIForgotPasswordScreenSPI> createForgotPasswordScreen() {
    return testContext.createScreenShortcut<AFSIForgotPasswordScreenSPI>(AFSIScreenID.forgotPassword);
  }
}

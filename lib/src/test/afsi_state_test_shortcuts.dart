import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/screens/account_settings_screen.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/process_account_deletion_screen.dart';
import 'package:afib_signin/src/ui/screens/register_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/screens/start_delete_account_screen.dart';

class AFSIStateTestShortcuts {
  AFStateTestScreenShortcut<AccountSettingsScreenSPI> createAccountSettingsScreen() {
    return testContext.createScreenShortcut<AccountSettingsScreenSPI>(AFSIScreenID.accountSettings);
  }
  AFStateTestScreenShortcut<ProcessAccountDeletionScreenSPI> createProcessAccountDeletionScreen() {
    return testContext.createScreenShortcut<ProcessAccountDeletionScreenSPI>(AFSIScreenID.processAccountDeletion);
  }
  AFStateTestScreenShortcut<StartDeleteAccountScreenSPI> createStartDeleteAccountScreen() {
    return testContext.createScreenShortcut<StartDeleteAccountScreenSPI>(AFSIScreenID.startDeleteAccount);
  }
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
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/src/test/screen_tests/forgot_password_screen_tests.dart';
import 'package:afib_signin/src/test/screen_tests/signin_screen_tests.dart';
import 'package:afib_signin/src/test/screen_tests/signup_screen_tests.dart';
import 'package:afib_signin/src/test/ui_prototypes/screens/account_settings_screen_tests.dart';
import 'package:afib_signin/src/test/ui_prototypes/screens/process_account_deletion_screen_tests.dart';
import 'package:afib_signin/src/test/ui_prototypes/screens/social_signin_choice_screen_tests.dart';
import 'package:afib_signin/src/test/ui_prototypes/screens/start_delete_account_screen_tests.dart';


void defineUIPrototypes(AFUIPrototypeDefinitionContext context) {
    defineSocialSigninChoiceScreenPrototypes(context);
    defineAccountSettingsScreenPrototypes(context);
    defineProcessAccountDeletionScreenPrototypes(context);
    defineStartDeleteAccountScreenPrototypes(context);
  defineSigninScreenTests(context);
  defineForgotPasswordScreenTests(context);
  defineSignupScreenTests(context);
}
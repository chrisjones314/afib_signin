import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/state/lpis/afsi_manipulate_state_lpi.dart';
import 'package:afib_signin/src/state/lpis/afsi_signin_actions_lpi.dart';
import 'package:afib_signin/src/ui/screens/account_settings_screen.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/process_account_deletion_screen.dart';
import 'package:afib_signin/src/ui/screens/register_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/screens/social_signin_choice_screen.dart';
import 'package:afib_signin/src/ui/screens/start_delete_account_screen.dart';
import 'package:afib_signin/src/ui/themes/afsi_default_theme.dart';


void defineCore(AFCoreDefinitionContext context) {
  defineFunctionalThemes(context);
  defineLibraryProgrammingInterfaces(context);
  defineScreens(context);
  defineSPIOverrides(context);
}

void defineFunctionalThemes(AFCoreDefinitionContext context) {
  context.defineTheme(AFSIThemeID.defaultTheme, createTheme: AFSIDefaultTheme.create);
}

void defineLibraryProgrammingInterfaces(AFCoreDefinitionContext context) {
  context.defineLPI(AFSILibraryProgrammingInterfaceID.manipulateState, createLPI: AFSIManipulateStateLPI.create);
  context.defineLPI(AFSILibraryProgrammingInterfaceID.signinActions, createLPI: AFSISigninActionsLPI.create);
}

void defineSPIOverrides(AFCoreDefinitionContext context) {

}

void defineScreens(AFCoreDefinitionContext context) {
  context.defineScreen(AFSIScreenID.socialSigninChoice, (_) => SocialSigninChoiceScreen(), SocialSigninChoiceScreen.config);
  context.defineScreen(AFSIScreenID.accountSettings, (_) => AccountSettingsScreen(), AccountSettingsScreen.config);
  context.defineScreen(AFSIScreenID.processAccountDeletion, (_) => ProcessAccountDeletionScreen(), ProcessAccountDeletionScreen.config);
  context.defineScreen(AFSIScreenID.startDeleteAccount, (_) => StartDeleteAccountScreen(), StartDeleteAccountScreen.config);
  context.defineScreen(AFSIScreenID.signin,           (_) => AFSISigninScreen(), AFSISigninScreen.config);
  context.defineScreen(AFSIScreenID.forgotPassword, (_) => AFSIForgotPasswordScreen(), AFSIForgotPasswordScreen.config);
  context.defineScreen(AFSIScreenID.register, (_) => AFSIRegisterScreen(), AFSIRegisterScreen.config);
}  

void defineFundamentalTheme(AFFundamentalDeviceTheme device, AFComponentStates appState, AFUILibraryFundamentalThemeAreaBuilder primary) {
 
  primary.setTranslations(AFUILocaleID.englishUS, {
    AFSIWidgetID.buttonForgotPassword: "Forgot Password",
    AFSIWidgetID.buttonLogin: "Sign In",
    AFSIWidgetID.buttonSignup: "Sign Up",
    AFSIWidgetID.editEmail: "Email",
    AFSIWidgetID.editPassword: "Password",
    AFSIWidgetID.editPasswordConfirm: "Confirm Password",
    AFSIWidgetID.buttonResetPassword: "RESET PASSWORD",
    AFSITranslationID.backToSignin: "Back to Sign In",
    AFSITranslationID.titleSignup: "Signup",
    AFSITranslationID.titleForgotPassword: "Forgot Password",
    AFSIWidgetID.buttonRegister: "SIGN UP NOW",
    AFSIWidgetID.showPasswordCheck: "Show Password",
    AFSITranslationID.messageSigningIn: "Signing in...",
    AFSITranslationID.messageResettingPassword: "Resetting password...",
    AFSITranslationID.messageSigningUp: "Signing up...",
    AFSITranslationID.editConfirmText: "Enter Your Account Password",
    AFSIWidgetID.buttonDeleteAccountNow: "DELETE YOUR ACCOUNT NOW",
    AFSITranslationID.titleAccountDeletionWarning: "Account Deletion Warning",
    AFSITranslationID.messageAccountDeletionWarning: "We cannot recover your account after you delete it.  It is gone forever.",
    AFSIWidgetID.buttonCancelDeleteAccount: "Cancel and Return to App",
    AFSITranslationID.titleDeletingAccount: "Deleting Account",
    AFSITranslationID.titleDeletedAccount: "Account Deletion Complete",
    AFSITranslationID.messageDeletingAccount: "We are deleting your account, please wait...",
    AFSITranslationID.messageDeletedAccount: "We successfully deleted your account, please click the button below to return to the signin screen.",
    AFSIWidgetID.buttonCancelCompleteReturnToSignin: "Return to Signin Screen",
    AFSIWidgetID.editCurrentPassword: "Current Password",
    AFSIWidgetID.editNewPassword: "New Password",
    AFSIWidgetID.editNewPasswordConfirm: "Confirm New Password",
    AFSIWidgetID.buttonChangePassword: "Change Password",
    AFSIWidgetID.editCurrentPasswordForEmail: "Current Password",
    AFSIWidgetID.editNewEmail: "New Email",
    AFSIWidgetID.buttonChangeEmail: "Change Email",
    AFSITranslationID.titleAccountSettings: "Account Settings",
    AFSITranslationID.titleChangePasswordSection: "Change Password",
    AFSITranslationID.titleChangeEmailSection: "Change Email",
    AFSITranslationID.titleStartDeleteAccount: "Delete Account",
    AFSIWidgetID.buttonStartDeleteAccount: "Consider Deleting Your Account"
  });

  primary.setTranslations(AFUILocaleID.spanish, {
    AFSIWidgetID.buttonForgotPassword: "Olvidó tu contraseña",
    AFSIWidgetID.buttonLogin: "Registrarse",
    AFSIWidgetID.buttonSignup: "Regístrate",
    AFSIWidgetID.editEmail: "Email",
    AFSIWidgetID.editPassword: "Contraseña",
    AFSIWidgetID.buttonResetPassword: "RESTABLECER LA CONTRASEÑA",
    AFSITranslationID.backToSignin: "Volver a Registrarse",
    AFSITranslationID.titleSignup: "Regístrate ",
    AFSITranslationID.titleForgotPassword: "Olvidó tu contraseña",
    AFSIWidgetID.buttonRegister: "REGÍSTRATE AHORA",
    AFSIWidgetID.showPasswordCheck: "Mostrar contraseña",    
    AFSITranslationID.messageSigningIn: "Iniciando sesión...",
    AFSITranslationID.messageResettingPassword: "Restableciendo contraseña...",
    AFSITranslationID.messageSigningUp: "Registrarse...",
  });
}
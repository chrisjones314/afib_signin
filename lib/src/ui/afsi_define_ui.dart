
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/state/lpis/afsi_signin_actions_lpi.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/register_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/themes/afsi_default_theme.dart';

import 'package:afib_signin/src/state/lpis/afsi_manipulate_state_lpi.dart';

void defineUI(AFUIDefinitionContext context) {
  defineFunctionalThemes(context);
  defineLibraryProgrammingInterfaces(context);
  defineScreens(context);
  defineSPIOverrides(context);
}

void defineFunctionalThemes(AFUIDefinitionContext context) {
  context.defineTheme(AFSIThemeID.defaultTheme, createTheme: AFSIDefaultTheme.create);
}

void defineLibraryProgrammingInterfaces(AFUIDefinitionContext context) {
  context.defineLPI(AFSILibraryProgrammingInterfaceID.manipulateState, createLPI: AFSIManipulateStateLPI.create);
  context.defineLPI(AFSILibraryProgrammingInterfaceID.signinActions, createLPI: AFSISigninActionsLPI.create);
}

void defineSPIOverrides(AFUIDefinitionContext context) {

}

void defineScreens(AFUIDefinitionContext context) {
  context.defineScreen(AFSIScreenID.signin,           (_) => AFSISigninScreen());
  context.defineScreen(AFSIScreenID.forgotPassword, (_) => AFSIForgotPasswordScreen());
  context.defineScreen(AFSIScreenID.signup, (_) => AFSIRegisterScreen());
}  

void defineFundamentalThemeArea(AFFundamentalDeviceTheme device, AFComponentStates appState, AFUILibraryFundamentalThemeAreaBuilder primary) {
 
  primary.setTranslations(AFUILocaleID.englishUS, {
    AFSIWidgetID.buttonForgotPassword: "Forgot Password",
    AFSIWidgetID.buttonLogin: "Sign In",
    AFSIWidgetID.buttonSignup: "Sign Up",
    AFSIWidgetID.editEmail: "Email",
    AFSIWidgetID.editPassword: "Password",
    AFSIWidgetID.buttonResetPassword: "RESET PASSWORD",
    AFSITranslationID.backToSignin: "Back to Sign In",
    AFSITranslationID.titleSignup: "Signup",
    AFSITranslationID.titleForgotPassword: "Forgot Password",
    AFSIWidgetID.buttonRegister: "SIGN UP NOW",
    AFSIWidgetID.showPasswordCheck: "Show Password",
    AFSITranslationID.messageSigningIn: "Signing in...",
    AFSITranslationID.messageResettingPassword: "Resetting password...",
    AFSITranslationID.messageSigningUp: "Signing up...",

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
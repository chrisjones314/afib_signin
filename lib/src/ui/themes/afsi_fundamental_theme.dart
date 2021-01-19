

import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';

void initFundamentalThemeArea(AFFundamentalDeviceTheme device, AFAppStateAreas appState, AFPluginFundamentalThemeAreaBuilder primary) {
 
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

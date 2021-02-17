import 'package:afib/afib_flutter.dart';

class AFSILibraryID {
  static const id = AFLibraryID(code: "afsi", name: "AFib Signin");
}

class AFSIScreenID {
  static const signup = AFScreenID("signup", AFSILibraryID.id);
  static const forgotPassword = AFScreenID("forgot_password", AFSILibraryID.id);
  static const signin = AFScreenID("signin", AFSILibraryID.id);
}

class AFSIWidgetID {
  static const showPasswordCheck = AFWidgetID("show_password_check", AFSILibraryID.id);
  static const buttonRegister = AFWidgetID("button_register", AFSILibraryID.id);
  static const buttonResetPassword = AFWidgetID("button_reset_password", AFSILibraryID.id);
  static const buttonLogin = AFWidgetID("button_login", AFSILibraryID.id);
  static const buttonForgotPassword = AFWidgetID("button_forgot_password", AFSILibraryID.id);
  static const buttonSignup = AFWidgetID("button_signup", AFSILibraryID.id);
  static const editEmail = AFWidgetID("edit_email", AFSILibraryID.id);
  static const editPassword = AFWidgetID("edit_password", AFSILibraryID.id);
  static const loginErrorText = AFWidgetID("login_error_text", AFSILibraryID.id);
}

const signinTag = ["signin"];

class AFSIStateTestID {
}


class AFSITranslationID {
  static const titleForgotPassword = AFTranslationID("title_forgot_password", AFSILibraryID.id);
  static const titleSignup = AFTranslationID("title_signup", AFSILibraryID.id);
  static const backToSignin = AFTranslationID("back_to_signin", AFSILibraryID.id);
  static const messageSigningIn = AFTranslationID("message_signing_in", AFSILibraryID.id);
  static const messageResettingPassword = AFTranslationID("message_resetting_password", AFSILibraryID.id);
  static const messageSigningUp = AFTranslationID("message_signing_up", AFSILibraryID.id);
}

class AFSIScreenTestID {
  /// Fills in the username and password, and clicks "Sign In"
  /// 
  /// The username and password should be supplied as param1 and param2 to 
  /// [AFWorkflowTestExecute.runScreenTest].
  static const signupScreen = AFScreenTestID("signup_screen", AFSILibraryID.id);
  static const forgotPasswordSubmit = AFScreenTestID("forgot_password_submit", AFSILibraryID.id);
  static const signinScreenLogin = AFScreenTestID("signin_screen_login", AFSILibraryID.id);
}

class AFSIPrototypeID {
  static const signinWithError = AFPrototypeID("signin_with_error", AFSILibraryID.id, tags: signinTag);
  static const signup = AFPrototypeID("signup", AFSILibraryID.id, tags: signinTag);
  static const signin = AFPrototypeID("signin", AFSILibraryID.id, tags: signinTag);
  static const forgotPassword = AFPrototypeID("forgot_password", AFSILibraryID.id, tags: signinTag);
}

class AFSITestDataID {  
}

class AFSIThemeID {
  static const tagAFSITheme = "afsi";
  static const functional = AFThemeID("conceptual", AFSILibraryID.id, tagAFSITheme);
}

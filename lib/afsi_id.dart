
import 'package:afib/afib_command.dart';

class AFSILibraryID {
  static const id = AFLibraryID(code: "afsi", name: "AFib Signin");
}

class AFSIScreenID extends AFScreenID {
  const AFSIScreenID(String code) : super(code, AFSILibraryID.id);
  static const signup = AFSIScreenID("signup");
  static const forgotPassword = AFSIScreenID("forgot_password");
  static const signin = AFSIScreenID("signin");
}

class AFSIWidgetID extends AFWidgetID {
  const AFSIWidgetID(String code) : super(code, AFSILibraryID.id);

  static const showPasswordCheck = AFSIWidgetID("show_password_check");
  static const buttonRegister = AFSIWidgetID("button_register");
  static const buttonResetPassword = AFSIWidgetID("button_reset_password");
  static const buttonLogin = AFSIWidgetID("button_login");
  static const buttonForgotPassword = AFSIWidgetID("button_forgot_password");
  static const buttonSignup = AFSIWidgetID("button_signup");
  static const editEmail = AFSIWidgetID("edit_email");
  static const editPassword = AFSIWidgetID("edit_password");
  static const loginErrorText = AFSIWidgetID("login_error_text");
}

const signinTag = ["signin"];

class AFSIStateTestID {
}


class AFSITranslationID extends AFTranslationID {
  const AFSITranslationID(String code) : super(code, AFSILibraryID.id);

  static const titleForgotPassword = AFSITranslationID("title_forgot_password");
  static const titleSignup = AFSITranslationID("title_signup");
  static const backToSignin = AFSITranslationID("back_to_signin");
  static const messageSigningIn = AFSITranslationID("message_signing_in");
  static const messageResettingPassword = AFSITranslationID("message_resetting_password");
  static const messageSigningUp = AFSITranslationID("message_signing_up");
}

class AFSIScreenTestID extends AFScreenTestID {
  const AFSIScreenTestID(String code, { List<String>? tags }): super(code, AFSILibraryID.id, tags: tags); 

  /// Fills in the username and password, and clicks "Sign In"
  /// 
  /// The username and password should be supplied as param1 and param2 to 
  /// [AFWorkflowTestExecute.runScreenTest].
  static const signupScreen = AFSIScreenTestID("signup_screen");
  static const forgotPasswordSubmit = AFSIScreenTestID("forgot_password_submit");
  static const signinScreenLogin = AFSIScreenTestID("signin_screen_login");
}

class AFSIPrototypeID extends AFPrototypeID {
  const AFSIPrototypeID(String code, { List<String>? tags }): super(code, AFSILibraryID.id, tags: tags); 

  static const signinWithError = AFSIPrototypeID("signin_with_error", tags: signinTag);
  static const signup = AFSIPrototypeID("signup", tags: signinTag);
  static const signin = AFSIPrototypeID("signin", tags: signinTag);
  static const forgotPassword = AFSIPrototypeID("forgot_password", tags: signinTag);
}

class AFSITestDataID {  
}

class AFSIThemeID extends AFThemeID {
 const AFSIThemeID(String code, String tag): super(code, AFSILibraryID.id, tag);   

  static const tagAFSITheme = "afsi";
  static const defaultTheme = AFSIThemeID("default", tagAFSITheme);
}

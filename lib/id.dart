import 'package:afib/afib_flutter.dart';

class AFSIScreenID {
  static const signup = AFScreenID("signup");
  static const forgotPassword = AFScreenID("forgot_password");
  static const signin = AFScreenID("signin");
}

class AFSIWidgetID {
  static const buttonRegister = AFWidgetID("button_register");
  static const buttonResetPassword = AFWidgetID("button_reset_password");
  static const buttonLogin = AFWidgetID("button_login");
  static const buttonForgotPassword = AFWidgetID("button_forgot_password");
  static const buttonSignup = AFWidgetID("button_signup");
  static const editEmail = AFWidgetID("edit_email");
  static const editPassword = AFWidgetID("edit_password");
  static const loginErrorText = AFWidgetID("login_error_text");
}

const signinTag = ["signin"];

class AFSIStateTestID {
}

class AFSIReusableTestID {
  static const signupScreen = AFReusableTestID("signup_screen");
  static const forgotPasswordSubmit = AFReusableTestID("forgot_password_submit");
  static const signinScreenLogin = AFReusableTestID("signin_screen_login");
}

class AFSIScreenTestID {
  static const signup = AFSingleScreenTestID("signup", tags: signinTag);
  static const signin = AFSingleScreenTestID("signin", tags: signinTag);
  static const forgotPassword = AFSingleScreenTestID("forgot_password", tags: signinTag);
}

class AFSIWorkflowTestID {
}

class AFSITestDataID {  
}

class AFSIQueryID {
  
}

class AFSIThemeID {
  static const tagAFSITheme = "afsi";
  //static const tapColorMode = AFThemeID("tapColorMode", tagDFTheme);
}

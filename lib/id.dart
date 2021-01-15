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

class AFSIReusableTestID {
  /// Fills in the username and password, and clicks "Sign In"
  /// 
  /// The username and password should be supplied as param1 and param2 to 
  /// [AFWorkflowTestExecute.runScreenTest].
  static const signupScreen = AFReusableTestID("signup_screen", AFSILibraryID.id);
  static const forgotPasswordSubmit = AFReusableTestID("forgot_password_submit", AFSILibraryID.id);
  static const signinScreenLogin = AFReusableTestID("signin_screen_login", AFSILibraryID.id);
}

class AFSIScreenTestID {
  static const signinWithError = AFSingleScreenTestID("signin_with_error", AFSILibraryID.id, tags: signinTag);
  static const signup = AFSingleScreenTestID("signup", AFSILibraryID.id, tags: signinTag);
  static const signin = AFSingleScreenTestID("signin", AFSILibraryID.id, tags: signinTag);
  static const forgotPassword = AFSingleScreenTestID("forgot_password", AFSILibraryID.id, tags: signinTag);
}

class AFSIWorkflowTestID {
}

class AFSITestDataID {  
}

class AFSIQueryID {
  
}

class AFSIThemeID {
  static const tagAFSITheme = "afsi";
  static const conceptual = AFThemeID("conceptual", AFSILibraryID.id, tagAFSITheme);
}


import 'package:afib/afib_command.dart';

class AFSILibraryID {
  static const id = AFLibraryID(code: "afsi", name: "afib_signin");
}

class AFSIScreenID extends AFScreenID {
  const AFSIScreenID(String code) : super(code, AFSILibraryID.id);
  static const signup = AFSIScreenID("signup");
  static const forgotPassword = AFSIScreenID("forgotPassword");
  static const signin = AFSIScreenID("signin");
}

class AFSIWidgetID extends AFWidgetID {
  const AFSIWidgetID(String code) : super(code, AFSILibraryID.id);

  static const showPasswordCheck = AFSIWidgetID("showPasswordCheck");
  static const buttonRegister = AFSIWidgetID("buttonRegister");
  static const buttonResetPassword = AFSIWidgetID("buttonResetPassword");
  static const buttonLogin = AFSIWidgetID("buttonLogin");
  static const buttonForgotPassword = AFSIWidgetID("buttonForgotPassword");
  static const buttonSignup = AFSIWidgetID("buttonSignup");
  static const editEmail = AFSIWidgetID("editEmail");
  static const editPassword = AFSIWidgetID("editPassword");
  static const loginErrorText = AFSIWidgetID("loginErrorText");
}

const signinTag = ["signin"];

class AFSIStateTestID {
}


class AFSITranslationID extends AFTranslationID {
  const AFSITranslationID(String code) : super(code, AFSILibraryID.id);

  static const titleForgotPassword = AFSITranslationID("titleForgotPassword");
  static const titleSignup = AFSITranslationID("titleSignup");
  static const backToSignin = AFSITranslationID("backToSignin");
  static const messageSigningIn = AFSITranslationID("messageSigningIn");
  static const messageResettingPassword = AFSITranslationID("messageResettingPassword");
  static const messageSigningUp = AFSITranslationID("messageSigningUp");
}

class AFSIScreenTestID extends AFScreenTestID {
  const AFSIScreenTestID(String code, { List<String>? tags }): super(code, AFSILibraryID.id); 

  /// Fills in the username and password, and clicks "Sign In"
  /// 
  /// The username and password should be supplied as param1 and param2 to 
  /// [AFWorkflowTestExecute.runScreenTest].
  static const signupScreen = AFSIScreenTestID("signupScreen");
  static const forgotPasswordSubmit = AFSIScreenTestID("forgotPasswordSubmit");
  static const signinScreenLogin = AFSIScreenTestID("signinScreenLogin");
}

class AFSILibraryProgrammingInterfaceID extends AFLibraryProgrammingInterfaceID {
  static const manipulateState = AFSILibraryProgrammingInterfaceID("manipulateState");
  const AFSILibraryProgrammingInterfaceID(String code): super(code, AFSILibraryID.id); 
  static const signinActions = AFSILibraryProgrammingInterfaceID("signinActions");
}


class AFSIPrototypeID extends AFPrototypeID {
  const AFSIPrototypeID(String code): super(code, AFSILibraryID.id); 

  static const signinWithError = AFSIPrototypeID("signinWithError");
  static const signup = AFSIPrototypeID("signup");
  static const signin = AFSIPrototypeID("signin");
  static const forgotPassword = AFSIPrototypeID("forgotPassword");
}

class AFSITestDataID {  
}

class AFSIThemeID extends AFThemeID {
 const AFSIThemeID(String code): super(code, AFSILibraryID.id);   

  static const defaultTheme = AFSIThemeID("defaultTheme");
}
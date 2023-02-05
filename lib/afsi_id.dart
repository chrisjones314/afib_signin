import 'package:afib/afib_command.dart';

class AFSILibraryID {
  static const id = AFLibraryID(code: "afsi", name: "afib_signin");
}

class AFSIScreenID extends AFScreenID {
  static const accountSettings = AFSIScreenID("accountSettings");
  static const processAccountDeletion = AFSIScreenID("processAccountDeletion");
  static const startDeleteAccount = AFSIScreenID("startDeleteAccount");
  const AFSIScreenID(String code) : super(code, AFSILibraryID.id);
  static const register = AFSIScreenID("register");
  static const forgotPassword = AFSIScreenID("forgotPassword");
  static const signin = AFSIScreenID("signin");
}

class AFSIWidgetID extends AFWidgetID {
  static const buttonChangeEmail = AFSIWidgetID("buttonChangeEmail");
  static const editNewEmail = AFSIWidgetID("editNewEmail");
  static const editCurrentPasswordForEmail = AFSIWidgetID("editCurrentPasswordForEmail");
  static const buttonChangePassword = AFSIWidgetID("buttonChangePassword");
  static const editNewPasswordConfirm = AFSIWidgetID("editNewPasswordConfirm");
  static const editNewPassword = AFSIWidgetID("editNewPassword");
  static const editCurrentPassword = AFSIWidgetID("editCurrentPassword");
  static const buttonStartDeleteAccount = AFSIWidgetID("buttonStartDeleteAccount");
  const AFSIWidgetID(String code) : super(code, AFSILibraryID.id);

  static const buttonDeleteAccountNow = AFSIWidgetID("buttonDeleteAccountNow");
  static const showPasswordCheck = AFSIWidgetID("showPasswordCheck");
  static const buttonRegister = AFSIWidgetID("buttonRegister");
  static const buttonResetPassword = AFSIWidgetID("buttonResetPassword");
  static const buttonLogin = AFSIWidgetID("buttonLogin");
  static const buttonForgotPassword = AFSIWidgetID("buttonForgotPassword");
  static const buttonSignup = AFSIWidgetID("buttonSignup");
  static const editEmail = AFSIWidgetID("editEmail");
  static const editPassword = AFSIWidgetID("editPassword");
  static const editPasswordConfirm = AFSIWidgetID("editPasswordConfirm");
  static const loginErrorText = AFSIWidgetID("loginErrorText");
  static const buttonCancelDeleteAccount = AFSIWidgetID("buttonCancelDeleteAccount");
  static const buttonCancelCompleteReturnToSignin = AFSIWidgetID("buttonCancelCompleteReturnToSignin");
}

const signinTag = ["signin"];

class AFSIStateTestID {
}


class AFSITranslationID extends AFTranslationID {
  static const titleChangeEmailSection = AFSITranslationID("titleChangeEmailSection");
  static const titleChangePasswordSection = AFSITranslationID("titleChangePasswordSection");
  static const titleAccountSettings = AFSITranslationID("titleAccountSettings");
  const AFSITranslationID(String code) : super(code, AFSILibraryID.id);

  static const titleForgotPassword = AFSITranslationID("titleForgotPassword");
  static const titleSignup = AFSITranslationID("titleSignup");
  static const backToSignin = AFSITranslationID("backToSignin");
  static const messageSigningIn = AFSITranslationID("messageSigningIn");
  static const messageResettingPassword = AFSITranslationID("messageResettingPassword");
  static const messageSigningUp = AFSITranslationID("messageSigningUp");
  static const titleAccountDeletionWarning = AFSITranslationID("titleAccountTranslationWarning");
  static const messageAccountDeletionWarning = AFSITranslationID("messageAccountDeletionWarning");
  static const editConfirmText = AFSITranslationID("editConfirmText");
  static const titleDeletingAccount = AFSITranslationID("titleDeletingAccount");
  static const titleDeletedAccount = AFSITranslationID("titleDeletedAccount");
  static const messageDeletingAccount = AFSITranslationID("messageDeletingAccount");
  static const messageDeletedAccount = AFSITranslationID("messageDeletedAccount");
  static const titleStartDeleteAccount = AFSITranslationID("titleStartDeleteAccount");
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
  static const accountSettingsScreenInitial = AFSIPrototypeID("accountSettingsScreenInitial");
  static const processAccountDeletionScreenInitial = AFSIPrototypeID("processAccountDeletionScreenInitial");
  static const startDeleteAccountScreenInitial = AFSIPrototypeID("startDeleteAccountScreenInitial");
  const AFSIPrototypeID(String code): super(code, AFSILibraryID.id); 

  static const signinLoading = AFSIPrototypeID("signinLoading");
  static const signinWithError = AFSIPrototypeID("signinWithError");
  static const signup = AFSIPrototypeID("signup");
  static const signin = AFSIPrototypeID("signin");
  static const forgotPassword = AFSIPrototypeID("forgotPassword");
}

class AFSITestDataID {  
  static const afsiStateFullLogin = "afsiStateFullLogin";
}

class AFSIThemeID extends AFThemeID {
 const AFSIThemeID(String code): super(code, AFSILibraryID.id);   

  static const defaultTheme = AFSIThemeID("defaultTheme");
}
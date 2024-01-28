import 'package:afib/afib_command.dart';
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/screens/account_settings_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';

class AFSIManipulateStateLPI extends AFLibraryProgrammingInterface {

  AFSIManipulateStateLPI(AFLibraryProgrammingInterfaceID id, AFLibraryProgrammingInterfaceContext context): super(id, context);

  factory AFSIManipulateStateLPI.create(AFLibraryProgrammingInterfaceID id, AFLibraryProgrammingInterfaceContext context) {
    return AFSIManipulateStateLPI(id, context);
  }

  void updateSigninScreenStatus({
    required AFSISigninStatus status,
    String? message,
    String? storedEmail,
  }) {
    updateScreenStatus(
      screenId: AFSIScreenID.signin, 
      status: status,
      message: message,
      storedEmail: storedEmail
    );
  }

  void updateResetPasswordScreenStatus({
    required AFSISigninStatus status,
    String? message,
    String? storedEmail,
  }) {
    updateScreenStatus(
      screenId: AFSIScreenID.forgotPassword, 
      status: status,
      message: message,
      storedEmail: storedEmail
    );
  }

  void updateRegisterScreenStatus({
    required AFSISigninStatus status,
    String? message,
    String? storedEmail,
  }) {
    updateScreenStatus(
      screenId: AFSIScreenID.register, 
      status: status,
      message: message,
      storedEmail: storedEmail
    );
  }

  void updateAccountSettingsChangePasswordStatus({
    required AFSISigninStatus status,
    required String message
  }) {
    final param = context.accessRouteParam<AccountSettingsScreenRouteParam>(AFRouteParamRef.forScreen(AFSIScreenID.accountSettings));
    if(param != null) {
      final revised = param.reviseChangePasswordStatus(status, message);
      context.updateHierarchyRouteParam(revised);
    }
  }

  void updateAccountSettingsChangeEmailStatus({
    required AFSISigninStatus status,
    required String message
  }) {
    final param = context.accessRouteParam<AccountSettingsScreenRouteParam>(AFRouteParamRef.forScreen(AFSIScreenID.accountSettings));
    if(param != null) {
      final revised = param.reviseChangeEmailStatus(status, message);
      context.updateHierarchyRouteParam(revised);
    }
  }

  void updateScreenStatus({
    required AFScreenID screenId,
    required AFSISigninStatus status,
    String? message,
    String? storedEmail,
  }) {
    final param = context.accessRouteParam<SigninScreenRouteParam>(AFRouteParamRef.forScreen(screenId));
    if(param != null) {
      final revised = param.reviseStatus(status: status, message: message, email: storedEmail);
      context.updateHierarchyRouteParam(revised);
    }
  }

  void updateStartDeleteAcountScreenStatus({
    required AFSISigninStatus status,
    String? message,
  }) {
    updateScreenStatus(
      screenId: AFSIScreenID.startDeleteAccount, 
      status: status,
      message: message,
    );
  }

  void updateProcessDeleteAcountScreenStatus({
    required AFSISigninStatus status,
    String? message,
  }) {
    updateScreenStatus(
      screenId: AFSIScreenID.processAccountDeletion, 
      status: status,
      message: message,
    );
  }

  void navigateToSigninScreen({
    required String? initialEmail,
  }) {
    context.dispatch(AFSISigninScreen.navigateAfterSignout(email: initialEmail ?? ""));
  }
}
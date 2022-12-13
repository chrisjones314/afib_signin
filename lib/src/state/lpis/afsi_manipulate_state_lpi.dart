import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';

class AFSIManipulateStateLPI extends AFLibraryProgrammingInterface {

  AFSIManipulateStateLPI(AFLibraryProgrammingInterfaceID id, AFLibraryProgrammingInterfaceContext context): super(id, context);

  factory AFSIManipulateStateLPI.create(AFLibraryProgrammingInterfaceID id, AFLibraryProgrammingInterfaceContext context) {
    return AFSIManipulateStateLPI(id, context);
  }

  void updateSigninScreenStatus({
    required AFSISigninStatus status,
    String? message,
  }) {
      final param = context.accessRouteParam<SigninScreenRouteParam>(AFRouteParamRef.forScreen(AFSIScreenID.signin));
      if(param != null) {
        final revised = param.reviseStatus(status: status, message: message);
        context.updateHierarchyRouteParam(revised);
      }

  }
}
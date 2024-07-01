import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/initialization/create_dart_params.dart';
import 'package:afib_signin/src/initialization/install/install_base.dart';
import 'package:afib_signin/src/initialization/install/install_base_library.dart';
import 'package:afib_signin/src/initialization/install/install_core_library.dart';
import 'package:afib_signin/src/initialization/install/install_test.dart';

/// This is used to run in prototype mode during library development, it isn't used by library clients.
void main() {  
  afMainWrapper((widgetBinding) {
    final paramsD = createDartParams();
    afMainUILibrary(
      id: AFSILibraryID.id, 
      paramsDart: paramsD, 
      installBase: installBase, 
      installBaseLibrary: installBaseLibrary, 
      installCoreLibrary: installCoreLibrary, 
      installTest: installTest);
  });
}
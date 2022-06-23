

import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/initialization/install/install_core_library.dart';
import 'package:afib_signin/src/initialization/install/install_test.dart';

void afsiInstallCore(AFAppLibraryExtensionContext context) {
  final libContext = context.register(
    AFSILibraryID.id
  );
  if(libContext != null) {
    installCoreLibrary(libContext);
    installTest(libContext.test);
  }
}
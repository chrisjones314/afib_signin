

import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/initialization/install/install_core_library.dart';
import 'package:afib_signin/src/initialization/install/install_test.dart';

void afsiInstallCore(AFAppLibraryExtensionContext extend) {
  AFCoreLibraryExtensionContext libContext = extend.register(
    AFSILibraryID.id
  );
  installCoreLibrary(libContext);
  installTest(libContext.test);
}


import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/initialization/extend/extend_app.dart';
import 'package:afib_signin/initialization/extend/extend_test.dart';

void afInstallAFSI(AFAppThirdPartyExtensionContext extend) {
  AFUILibraryExtensionContext libContext = extend.register(
    AFSILibraryID.id, "afsi", "AFib Signin"
  );
  extendApp(libContext);
  extendTest(libContext.test);
}
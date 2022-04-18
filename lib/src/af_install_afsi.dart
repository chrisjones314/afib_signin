

import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/initialization/extend/extend_app.dart';
import 'package:afib_signin/src/initialization/extend/extend_test.dart';

void afsiExtendUI(AFAppThirdPartyExtensionContext extend) {
  AFUILibraryExtensionContext libContext = extend.register(
    AFSILibraryID.id
  );
  extendApp(libContext);
  extendTest(libContext.test);
}
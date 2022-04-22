

import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/initialization/extend/extend_ui.dart';
import 'package:afib_signin/src/initialization/extend/extend_test.dart';

void afsiExtendUI(AFAppLibraryExtensionContext extend) {
  AFUILibraryExtensionContext libContext = extend.register(
    AFSILibraryID.id
  );
  extendUI(libContext);
  extendTest(libContext.test);
}
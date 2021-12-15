import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/initialization/create_dart_params.g.dart';
import 'package:afib_signin/src/initialization/extend/extend_app.dart';
import 'package:afib_signin/src/initialization/extend/extend_base.dart';
import 'package:afib_signin/src/initialization/extend/extend_base_third_party.dart';
import 'package:afib_signin/src/initialization/extend/extend_test.dart';

/// This is used to run in prototype mode during library development, it isn't used by library clients.
void main() {  
  afMainWrapper(() {
    final paramsD = createDartParams();
    afMainUILibrary<AFComponentStateUnused>(AFSILibraryID.id, paramsD, extendBase, extendBaseThirdParty, extendApp, extendTest);
  });
}
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/initialization/create_dart_params.dart';
import 'package:afib_signin/src/initialization/extend/extend_app.dart';
import 'package:afib_signin/src/initialization/extend/extend_base.dart';
import 'package:afib_signin/src/initialization/extend/extend_third_party_base.dart';
import 'package:afib_signin/src/initialization/extend/extend_test.dart';
import 'package:afib_signin/src/initialization/extend/extend_third_party_ui.dart';
import 'package:flutter_test/flutter_test.dart';

//------------------------------------------------------------------------------
void main() async {
  afTestMainStartup();

  group("AFib Test", () {
    testWidgets('Afib Test', (tester) async {
      final paramsD = createDartParams();
      await afTestWidgetStartup(paramsD, tester, () async {
        await afTestMainUILibrary<AFComponentStateUnused>(
          id: AFSILibraryID.id, 
          extendBase: extendBase, 
          extendThirdPartyBase: extendThirdPartyBase, 
          extendApp: extendApp, 
          extendThirdPartyUI: extendThirdPartyUI, 
          extendTest: extendTest, 
          paramsD: paramsD, 
          widgetTester: tester);
      });
    });
  });
}

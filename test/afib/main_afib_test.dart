import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/initialization/create_dart_params.dart';
import 'package:afib_signin/src/initialization/install/install_core_library.dart';
import 'package:afib_signin/src/initialization/install/install_base.dart';
import 'package:afib_signin/src/initialization/install/install_base_library.dart';
import 'package:afib_signin/src/initialization/install/install_test.dart';
import 'package:flutter_test/flutter_test.dart';

//------------------------------------------------------------------------------
void main() async {
  afTestMainStartup();

  group("AFib Test", () {
    testWidgets('Afib Test', (tester) async {
      final paramsD = createDartParams();
      await afTestWidgetStartup(paramsD, tester, () async {
        await afTestMainUILibrary(
          id: AFSILibraryID.id, 
          installBase: installBase, 
          installBaseLibrary: installBaseLibrary, 
          installCoreLibrary: installCoreLibrary, 
          installTest: installTest, 
          paramsDart: paramsD, 
          widgetTester: tester);
      });
    });
  });
}

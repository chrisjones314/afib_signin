import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/initialization/create_dart_params.g.dart';
import 'package:afib_signin/initialization/extend/extend_app.dart';
import 'package:afib_signin/initialization/extend/extend_test.dart';
import 'package:flutter_test/flutter_test.dart';

//------------------------------------------------------------------------------
void main() async {
  afMainTestFirstStartup();

  group("AFib Test", () {
    testWidgets('Afib Test', (tester) async {
      await afMainTestConfigureScreenSize(tester);
      final paramsD = createDartParams();
      await afTestMainUILibrary<AFAppStateArea>(extendApp, extendTest, paramsD, tester);
    });
  });
}

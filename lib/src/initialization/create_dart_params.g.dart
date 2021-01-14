import 'package:afib/afib_command.dart';
import 'package:afib_signin/src/initialization/afib.g.dart';
import 'package:afib_signin/src/initialization/application.dart';
import 'package:afib_signin/src/initialization/environments/debug.dart';
import 'package:afib_signin/src/initialization/environments/production.dart';
import 'package:afib_signin/src/initialization/environments/prototype.dart';
import 'package:afib_signin/src/initialization/environments/test.dart';

AFDartParams createDartParams() {
  return AFDartParams(    
    initAfib: configureAfib,
    initAppConfig: configureApplication,
    initProductionConfig: configureProduction,
    initPrototypeConfig: configurePrototype,
    initTestConfig: configureTest,
    initDebugConfig: configureDebug,
  );
}

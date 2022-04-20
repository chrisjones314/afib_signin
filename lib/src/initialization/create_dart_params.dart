import 'package:afib/afib_command.dart';
import 'package:afib_signin/src/initialization/afsi_config.g.dart';
import 'package:afib_signin/src/initialization/application.dart';
import 'package:afib_signin/src/initialization/environments/debug.dart';
import 'package:afib_signin/src/initialization/environments/production.dart';
import 'package:afib_signin/src/initialization/environments/prototype.dart';
import 'package:afib_signin/src/initialization/environments/test.dart';

AFDartParams createDartParams() {
  return AFDartParams(    
    configureAfib: configureAfib,
    configureAppConfig: configureApplication,
    configureProductionConfig: configureProduction,
    condfigurePrototypeConfig: configurePrototype,
    configureTestConfig: configureTest,
    configureDebugConfig: configureDebug,
  );
}

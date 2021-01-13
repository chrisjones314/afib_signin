
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/initialization/create_dart_params.g.dart';
import 'package:afib_signin/initialization/extend/extend_app.dart';
import 'package:afib_signin/initialization/extend/extend_test.dart';

void main() {  
  afMainFirstStartup();
  final paramsD = createDartParams();
  afMainUILibrary<AFAppStateArea>(paramsD, extendApp, extendTest);
}
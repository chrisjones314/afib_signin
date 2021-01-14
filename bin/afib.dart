
import 'package:afib/afib_command.dart';
import 'package:afib_signin/src/initialization/create_dart_params.g.dart';
import 'package:afib_signin/src/initialization/extend/extend_command.dart';

/// The main function for the application-specific, extensible afib command-line
/// interface.
void main(List<String> args) {

  final paramsD = createDartParams();
 
  var argsFull = AFArgs.create(args);
  final debug = true;
  if(debug) {
    argsFull.debugResetTo("test");
  } 

  // execute the command.
  afAppCommandMain(paramsD, argsFull, extendCommand);
}

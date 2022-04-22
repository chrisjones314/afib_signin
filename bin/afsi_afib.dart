import 'package:afib/afib_command.dart';
import 'package:afib_signin/src/initialization/create_dart_params.dart';
import 'package:afib_signin/src/initialization/extend/extend_base.dart';
import 'package:afib_signin/src/initialization/extend/extend_base_library.dart';
import 'package:afib_signin/src/initialization/extend/extend_command.dart';
import 'package:afib_signin/src/initialization/extend/extend_command_library.dart';

/// The main function for the application-specific, extensible afib command-line
/// interface.
void main(List<String> args) {
  afCommandStartup(() async {
    final paramsD = createDartParams();
    final argsFull = AFArgs(args);

  // execute the command.
    await afUILibraryCommandMain(
      paramsDart: paramsD, 
      args: argsFull, 
      extendBase: extendBase, 
      extendBaseLibrary: extendBaseLibrary, 
      extendCommand: extendCommand, 
      extendCommandLibrary: extendLibraryCommand,
    );
  });
}

import 'package:afib/afib_command.dart';
import 'package:afib_signin/src/initialization/create_dart_params.dart';
import 'package:afib_signin/src/initialization/install/install_base.dart';
import 'package:afib_signin/src/initialization/install/install_base_library.dart';
import 'package:afib_signin/src/initialization/install/install_command.dart';
import 'package:afib_signin/src/initialization/install/install_command_library.dart';

/// The main function for the application-specific, extensible afib command-line
/// interface.
void main(List<String> args) {
  afCommandStartup(() async {
    final paramsD = createDartParams();
    final argsFull = AFArgs(args);

  // execute the command.
    await afLibraryCommandMain(
      paramsDart: paramsD, 
      args: argsFull, 
      installBase: installBase, 
      installBaseLibrary: installBaseLibrary, 
      installCommand: installCommand, 
      installCommandLibrary: installLibraryCommand,
    );
  });
}

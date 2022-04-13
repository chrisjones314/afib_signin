import 'package:afib/afib_command.dart';
import 'package:afib_signin/src/initialization/create_dart_params.dart';
import 'package:afib_signin/src/initialization/extend/extend_base.dart';
import 'package:afib_signin/src/initialization/extend/extend_base_third_party.dart';
import 'package:afib_signin/src/initialization/extend/extend_command.dart';
import 'package:afib_signin/src/initialization/extend/extend_command_third_party.g.dart';

/// The main function for the application-specific, extensible afib command-line
/// interface.
void main(List<String> args) {
  afCommandStartup(() async {
    final paramsD = createDartParams();

  // execute the command.
    await afUILibraryCommandMain(paramsD, args, extendBase, extendBaseThirdParty, extendCommand, extendCommandThirdParty);
  });
}

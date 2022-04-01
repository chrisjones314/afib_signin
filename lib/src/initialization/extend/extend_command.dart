

import 'package:afib/afib_command.dart';
import 'package:args/args.dart' as args;

class AFSICustomCommand extends AFCommand {

  @override
  final name = "afsi_custom";

  @override
  final description = "AFSI Custom Command";

  @override
  void registerArguments(args.ArgParser args) {
  }

  @override
  void execute(AFCommandContext ctx) {
    print("Executing afsi_custom command");
  }

  @override Never throwUsageError(String error) {
    throw AFCommandError(error: error, usage: "TODO");
  }
}

// You can use this function to add your own commands, or to
// import AFib-aware third party commands.
void extendCommand(AFCommandThirdPartyExtensionContext definitions) {
  definitions.register(AFSICustomCommand()); 
}
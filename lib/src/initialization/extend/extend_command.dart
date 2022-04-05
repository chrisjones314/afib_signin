

import 'package:afib/afib_command.dart';

class AFSICustomCommand extends AFCommand {

  @override
  final name = "afsi_custom";

  @override
  final description = "AFSI Custom Command";

  @override 
  final usage = "";

  @override
  void execute(AFCommandContext ctx) {
    print("Executing afsi_custom command");
  }
}

// You can use this function to add your own commands, or to
// import AFib-aware third party commands.
void extendCommand(AFCommandThirdPartyExtensionContext definitions) {
  definitions.register(AFSICustomCommand()); 
}


import 'package:afib/afib_command.dart';
import 'package:afib_signin/src/command/custom_command.dart';


// You can use this function to add your own commands, or to
// import AFib-aware third party commands.
void extendCommand(AFCommandThirdPartyExtensionContext context) {
  context.defineCommand(CustomCommand()); 
}
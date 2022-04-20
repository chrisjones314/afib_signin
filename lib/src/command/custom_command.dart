
import 'package:afib/afib_command.dart';

class CustomCommand extends AFCommand {

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


import 'package:afib/afib_command.dart';
import 'package:afib_signin/src/initialization/extend/extend_base.dart';
import 'package:afib_signin/src/initialization/extend/extend_command.dart';

void afsiExtendCommand(AFCommandThirdPartyExtensionContext definitions) {
  extendCommand(definitions);
}

void afsiExtendBase(AFBaseExtensionContext context) {
  extendBase(context);
}

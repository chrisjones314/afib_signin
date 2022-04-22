

import 'package:afib/afib_command.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/initialization/extend/extend_base.dart';
import 'package:afib_signin/src/initialization/extend/extend_command.dart';

void afsiExtendCommand(AFCommandUILibraryExtensionContext definitions) {
  extendCommand(definitions);
}

void afsiExtendBase(AFBaseExtensionContext context) {
  context.registerLibrary(AFSILibraryID.id);
  extendBase(context);
}

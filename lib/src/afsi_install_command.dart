

import 'package:afib/afib_command.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/initialization/install/install_base.dart';
import 'package:afib_signin/src/initialization/install/install_command.dart';

void afsiInstallCommand(AFCommandUILibraryExtensionContext definitions) {
  installCommand(definitions);
}

void afsiInstallBase(AFBaseExtensionContext context) {
  context.registerLibrary(AFSILibraryID.id);
  installBase(context);
}

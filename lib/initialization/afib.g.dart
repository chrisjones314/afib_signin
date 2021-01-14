// File last generated at 2021-01-14 15:25:58.082422 on Chriss-iMac-Pro.jh
import 'package:afib/afib_command.dart';
void configureAfib(AFConfig config) {
  config.setValue(AFConfigEntries.appNamespace, "afsi");
  config.setValue(AFConfigEntries.enabledTestList, []);
  config.setValue(AFConfigEntries.environment, AFEnvironment.production);
  config.setValue(AFConfigEntries.logAreas, ["none"]);
  config.setValue(AFConfigEntries.startInDarkMode, false);
}


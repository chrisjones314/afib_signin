
import 'package:afib/afib_command.dart';
import 'package:afib_signin/id.dart';

void extendBase(AFBaseExtensionContext context) {
  final item = AFConfigurationitemTrueFalse(
    libraryId: AFSILibraryID.id,
    name: "afsi_special_config",
    validContexts: AFConfigurationItem.validContextsAll,
    ordinal: 1000.0,
    help: "sample configuration value",
    defaultValue: false);
  context.registerConfigurationItem(item);
}

import 'package:afib/afib_command.dart';
import 'package:afib_signin/afsi_id.dart';

void installBase(AFBaseExtensionContext context) {
  
  final item = AFConfigurationItemTrueFalse(
    libraryId: AFSILibraryID.id,
    name: "afsi_special_config",
    validContexts: AFConfigurationItem.validContextsAll,
    ordinal: 1000.0,
    help: "sample configuration value",
    defaultValue: false);
  context.registerConfigurationItem(item);
}
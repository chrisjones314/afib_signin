



import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/src/ui/afsi_define_ui.dart';

void extendUI(AFUILibraryExtensionContext extend) {
    extend.initializeLibraryFundamentals(
      defineUI: defineUI, 
      defineFundamentalThemeArea: defineFundamentalThemeArea,
      initializeComponentState: () => null, 
    );
}




import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/src/ui/screen_map.dart';
import 'package:afib_signin/src/ui/themes/afsi_default_theme.dart';
import 'package:afib_signin/src/ui/themes/afsi_fundamental_theme.dart';

void extendApp(AFUILibraryExtensionContext extend) {
    extend.initializeLibraryFundamentals(
      defineScreenMap: defineScreenMap, 
      initializeComponentState: () => null, 
      defineFundamentalThemeArea: defineFundamentalThemeArea,
      defineFunctionalTheme: defineFunctionalThemes,
    );
}
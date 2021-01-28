



import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/src/initialization/screen_map.dart';
import 'package:afib_signin/src/ui/themes/afsi_conceptual_theme.dart';
import 'package:afib_signin/src/ui/themes/afsi_fundamental_theme.dart';

void extendApp(AFUILibraryExtensionContext extend) {
    extend.initializeLibraryFundamentals(
      initScreenMap: initScreenMap, 
      initializeAppState: () => null, 
      initFundamentalThemeArea: initFundamentalThemeArea,
      initFunctionalTheme: initFunctionalThemes,
    );
}
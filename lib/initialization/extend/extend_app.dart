



import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/initialization/screen_map.dart';
import 'package:afib_signin/ui/themes/afsi_conceptual_theme.dart';

void extendApp(AFUILibraryExtensionContext extend) {
    extend.initializeAppFundamentals(
      initScreenMap: initScreenMap, 
      initializeAppState: () => null, 
      initConceptualTheme: initConceptualThemes,
    );
}




import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/src/initialization/afsi_define_core.dart';

void installCoreLibrary(AFCoreLibraryExtensionContext libContext) {
    libContext.installCoreLibrary(
      defineCore: defineCore, 
      defineFundamentalTheme: defineFundamentalTheme,
    );
}
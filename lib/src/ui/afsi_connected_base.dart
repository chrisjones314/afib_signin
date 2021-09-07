
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/themes/afsi_functional_theme.dart';
import 'package:afib/afib_flutter.dart';

mixin AFSIConnectedUIMixin<TStateView extends AFStateView, TRouteParam extends AFRouteParam> {
  AFSIBuildContext<TStateView, TRouteParam> createContext(AFStandardBuildContextData standard, TStateView stateView, TRouteParam param, AFSIFunctionalTheme theme) {
    return AFSIBuildContext<TStateView, TRouteParam>(standard, stateView, param, theme);
  }
}

class AFSIBuildContext<TStateView extends AFStateView, TRouteParam extends AFRouteParam> extends AFBuildContext<AFAppStateArea, TStateView, TRouteParam, AFSIFunctionalTheme> {
  AFSIBuildContext(
    AFStandardBuildContextData standard,
    AFStateView stateView,
    AFRouteParam routeParam,
    AFSIFunctionalTheme theme,
  ): super(standard, stateView, routeParam, theme);
}

abstract class AFSIConnectedScreen<TStateView extends AFStateView, TRouteParam extends AFRouteParam> extends AFConnectedScreen<AFAppStateArea, AFSIFunctionalTheme, AFSIBuildContext<TStateView, TRouteParam>, TStateView, TRouteParam> with AFSIConnectedUIMixin<TStateView, TRouteParam> {
  AFSIConnectedScreen(AFScreenID screen): super(screen, AFSIThemeID.functional);
}

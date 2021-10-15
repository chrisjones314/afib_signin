
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/themes/afsi_functional_theme.dart';
import 'package:afib/afib_flutter.dart';

mixin AFSIConnectedUIMixin<TStateView extends AFStateView, TRouteParam extends AFRouteParam> {
  AFSIBuildContext<TStateView, TRouteParam> createContext(AFStandardBuildContextData standard, TStateView stateView, TRouteParam param, AFRouteSegmentChildren? children, AFSIFunctionalTheme theme) {
    return AFSIBuildContext<TStateView, TRouteParam>(standard, stateView, param, children, theme);
  }
}

class AFSIBuildContext<TStateView extends AFStateView, TRouteParam extends AFRouteParam> extends AFBuildContext<AFAppStateAreaUnused, TStateView, TRouteParam, AFSIFunctionalTheme> {
  AFSIBuildContext(
    AFStandardBuildContextData standard,
    TStateView stateView,
    TRouteParam routeParam,
    AFRouteSegmentChildren? children,
    AFSIFunctionalTheme theme,
  ): super(standard, stateView, routeParam, children, theme);
}

abstract class AFSIConnectedScreen<TStateView extends AFStateView, TRouteParam extends AFRouteParam> extends AFConnectedScreen<AFAppStateAreaUnused, AFSIFunctionalTheme, AFSIBuildContext<TStateView, TRouteParam>, TStateView, TRouteParam> with AFSIConnectedUIMixin<TStateView, TRouteParam> {
  AFSIConnectedScreen(AFScreenID screen): super(screen, AFSIThemeID.functional);
}


import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/themes/afsi_functional_theme.dart';
import 'package:afib/afib_flutter.dart';


class AFSIFlexibleStateView extends AFFlexibleStateView  {
  
  AFSIFlexibleStateView({
    required Map<String, Object> models,
    required AFCreateStateViewDelegate create,
  }): super(models: models, create: create);

}

mixin AFSICreateContextMixin<TStateView extends AFFlexibleStateView, TRouteParam extends AFRouteParam> {
  AFSIBuildContext<TStateView, TRouteParam> createContext(AFStandardBuildContextData standard, TStateView stateView, TRouteParam param, AFRouteSegmentChildren? children, AFSIFunctionalTheme theme) {
    return AFSIBuildContext<TStateView, TRouteParam>(standard, stateView, param, children, theme);
  }
}


class AFSIBuildContext<TStateView extends AFFlexibleStateView, TRouteParam extends AFRouteParam> extends AFBuildContext<AFComponentStateUnused, TStateView, TRouteParam, AFSIFunctionalTheme> {
  AFSIBuildContext(
    AFStandardBuildContextData standard,
    TStateView stateView,
    TRouteParam routeParam,
    AFRouteSegmentChildren? children,
    AFSIFunctionalTheme theme,
  ): super(standard, stateView, routeParam, children, theme);
}

abstract class AFSIConnectedScreen<TStateView extends AFFlexibleStateView, TRouteParam extends AFRouteParam> extends AFConnectedScreen<AFComponentStateUnused, AFSIFunctionalTheme, AFSIBuildContext<TStateView, TRouteParam>, TStateView, TRouteParam> with AFSICreateContextMixin<TStateView, TRouteParam> {
  AFSIConnectedScreen(AFScreenID screen, AFCreateStateViewDelegate<TStateView> creator): super(screen, AFSIThemeID.functional, creator);
}


import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/state/stateviews/afsi_default_state_view.dart';
import 'package:afib_signin/src/ui/themes/afsi_functional_theme.dart';
import 'package:afib/afib_flutter.dart';

mixin AFSIConnectedUIMixin<TStateView extends AFFlexibleStateView, TRouteParam extends AFRouteParam> {
  AFSIBuildContext<TStateView, TRouteParam> createContext(AFStandardBuildContextData standard, TStateView stateView, TRouteParam param, AFRouteSegmentChildren? children, AFSIFunctionalTheme theme) {
    return AFSIBuildContext<TStateView, TRouteParam>(standard, stateView, param, children, theme);
  }
}

mixin AFSIDefaultStateViewMixin<TRouteParam extends AFRouteParam> {

  //--------------------------------------------------------------------------------------
  AFUIStateView<AFSIDefaultStateView> createStateView(AFBuildStateViewContext<AFComponentStateUnused, TRouteParam> context) {
    final state = context.stateApp;
    return AFUIStateView<AFSIDefaultStateView>(
      models: state.allModels
    );
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

abstract class AFSIConnectedScreen<TRouteParam extends AFRouteParam> extends AFConnectedScreen<AFComponentStateUnused, AFSIFunctionalTheme, AFSIBuildContext<AFSIDefaultStateView, TRouteParam>, AFSIDefaultStateView, TRouteParam> with AFSIConnectedUIMixin<AFSIDefaultStateView, TRouteParam>, AFSIDefaultStateViewMixin<TRouteParam> {
  AFSIConnectedScreen(AFScreenID screen): super(screen, AFSIThemeID.functional, AFSIDefaultStateView.creator);
}

abstract class AFSIConnectedFilteredScreen<TStateView extends AFFlexibleStateView, TRouteParam extends AFRouteParam> extends AFConnectedScreen<AFComponentStateUnused, AFSIFunctionalTheme, AFSIBuildContext<TStateView, TRouteParam>, TStateView, TRouteParam> with AFSIConnectedUIMixin<TStateView, TRouteParam> {
  AFSIConnectedFilteredScreen(AFScreenID screen, AFCreateStateViewDelegate<TStateView> creator): super(screen, AFSIThemeID.functional, creator);
}


import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/themes/afsi_default_theme.dart';
import 'package:afib/afib_flutter.dart';


class AFSIFlexibleStateView extends AFFlexibleStateView  {
  
  AFSIFlexibleStateView({
    required Map<String, Object> models,
    required AFCreateStateViewDelegate create,
  }): super(models: models, create: create);

}

class AFSIBuildContext<TStateView extends AFFlexibleStateView, TRouteParam extends AFRouteParam> extends AFBuildContext<TStateView, TRouteParam> {
  AFSIBuildContext(
    AFStandardBuildContextData standard,
    TStateView stateView,
    TRouteParam routeParam,
    AFRouteSegmentChildren? children,
  ): super(standard, stateView, routeParam, children);
}

class AFSIScreenSPI<TStateView extends AFFlexibleStateView, TRouteParam extends AFRouteParam> extends AFScreenStateProgrammingInterface<AFComponentStateUnused, AFBuildContext<TStateView, TRouteParam>, AFSIDefaultTheme> {
  AFSIScreenSPI(AFBuildContext<TStateView, TRouteParam> context, AFScreenID screenId, AFSIDefaultTheme theme): super(context, screenId, theme);
}

abstract class AFSIConnectedScreen<TSPI extends AFScreenStateProgrammingInterface, TStateView extends AFFlexibleStateView, TRouteParam extends AFRouteParam> extends AFConnectedScreen<AFComponentStateUnused, AFSIDefaultTheme, TStateView, TRouteParam, TSPI> {
  AFSIConnectedScreen({
    required AFConnectedUIConfig<AFComponentStateUnused, AFSIDefaultTheme, TStateView, TRouteParam, TSPI>  config,
    required AFScreenID screenId,
    TRouteParam? launchParam,
  }): super(config: config, screenId: screenId, launchParam: launchParam);
}

abstract class AFSIScreenConfig<TSPI extends AFScreenStateProgrammingInterface, TStateView extends AFFlexibleStateView, TRouteParam extends AFRouteParam> extends AFScreenConfig<TSPI, AFComponentStateUnused, AFSIDefaultTheme, TStateView, TRouteParam> {
  AFSIScreenConfig({
    required AFCreateStateViewDelegate<TStateView> stateViewCreator,
    required AFCreateScreenSPIDelegate<TSPI, AFBuildContext<TStateView, TRouteParam>, AFSIDefaultTheme> spiCreator,
    AFRouteLocation? route,
  }): super(
    themeId: AFSIThemeID.defaultTheme,
    stateViewCreator: stateViewCreator,
    spiCreator: spiCreator,
    route: route ?? AFRouteLocation.routeHierarchy,
  );
}

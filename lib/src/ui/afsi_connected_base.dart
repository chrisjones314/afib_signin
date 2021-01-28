
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/themes/afsi_conceptual_theme.dart';
import 'package:flutter/material.dart';
import 'package:afib/afib_flutter.dart';

mixin AFSIConnectedUIMixin<TStateView extends AFStateView, TRouteParam extends AFRouteParam> {
  AFSIBuildContext<TStateView, TRouteParam> createContext(BuildContext context, AFDispatcher dispatcher, TStateView stateView, TRouteParam param, AFRouteParamWithChildren paramWithChildren, AFSIFunctionalTheme theme, AFConnectedUIBase container) {
    return AFSIBuildContext<TStateView, TRouteParam>(context, dispatcher, stateView, param, paramWithChildren, theme, container);
  }
}

class AFSIBuildContext<TStateView extends AFStateView, TRouteParam extends AFRouteParam> extends AFBuildContext<AFAppStateArea, TStateView, TRouteParam, AFSIFunctionalTheme> {
  AFSIBuildContext(
    BuildContext context, 
    AFDispatcher dispatcher, 
    AFStateView stateView,
    AFRouteParam routeParam,
    AFRouteParamWithChildren paramWithChildren, 
    AFFunctionalTheme theme,
    AFConnectedUIBase container
  ): super(context, dispatcher, stateView, routeParam, paramWithChildren, theme, container);
}

abstract class AFSIConnectedScreen<TStateView extends AFStateView, TRouteParam extends AFRouteParam> extends AFConnectedScreen<AFAppStateArea, AFSIFunctionalTheme, AFSIBuildContext<TStateView, TRouteParam>, TStateView, TRouteParam> with AFSIConnectedUIMixin<TStateView, TRouteParam> {
  AFSIConnectedScreen(AFScreenID screen): super(screen, AFSIThemeID.functional);
}

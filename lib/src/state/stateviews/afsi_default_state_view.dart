
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_flutter.dart';

class AFSIDefaultStateView extends AFSIFlexibleStateView {
  AFSIDefaultStateView({
    required Map<String, Object> models, 
    AFCreateStateViewDelegate? creator
  }): super(models: models, create: creator ?? AFSIDefaultStateView.create);

  factory AFSIDefaultStateView.create(Map<String, Object> models) {
    return AFSIDefaultStateView(models: models);
  }
  
  AFTimeState get time { return findType<AFTimeState>(); }
}

//--------------------------------------------------------------------------------------
mixin AFSIDefaultStateViewMixin<TRouteParam extends AFRouteParam> {

  //--------------------------------------------------------------------------------------
  Iterable<Object?> createStateModels(AFBuildStateViewContext<AFComponentStateUnused, TRouteParam> context) {
    final state = context.stateApp;
    return state.allModels;
  }
}

//--------------------------------------------------------------------------------------
class AFSIDefaultScreenConfig<TSPI extends AFScreenStateProgrammingInterface, TRouteParam extends AFRouteParam> extends AFSIScreenConfig<TSPI, AFSIDefaultStateView, TRouteParam> with AFSIDefaultStateViewMixin<TRouteParam> {
  AFSIDefaultScreenConfig({
    required AFCreateScreenSPIDelegate<TSPI, AFBuildContext<AFSIDefaultStateView, TRouteParam>, AFSIDefaultTheme> spiCreator,
    AFRouteLocation? route
  }): super(
    stateViewCreator: AFSIDefaultStateView.create,
    spiCreator: spiCreator,
    route: route,
  );
}

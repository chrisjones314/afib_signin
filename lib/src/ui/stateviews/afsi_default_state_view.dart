
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
    final models = state.allModels.toList();
    models.add(context.statePublic.time);
    return models;
  }
}

//--------------------------------------------------------------------------------------
class AFSIDefaultScreenConfig<TSPI extends AFScreenStateProgrammingInterface, TRouteParam extends AFRouteParam> extends AFSIScreenConfig<TSPI, AFSIDefaultStateView, TRouteParam> with AFSIDefaultStateViewMixin<TRouteParam> {
  AFSIDefaultScreenConfig({
    required AFCreateSPIDelegate<TSPI, AFBuildContext<AFSIDefaultStateView, TRouteParam>, AFSIDefaultTheme> spiCreator,
    AFNavigateRoute? route
  }): super(
    stateViewCreator: AFSIDefaultStateView.create,
    spiCreator: spiCreator,
    route: route,
  );
}

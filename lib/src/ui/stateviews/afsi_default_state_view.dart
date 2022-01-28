
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';

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

mixin AFSIDefaultStateViewMixin<TRouteParam extends AFRouteParam> {

  //--------------------------------------------------------------------------------------
  AFUIStateView<AFSIDefaultStateView> createStateView(AFBuildStateViewContext<AFComponentStateUnused, TRouteParam> context) {
    final state = context.stateApp;
    final models = state.allModels.toList();
    models.add(context.statePublic.time);
    return AFUIStateView<AFSIDefaultStateView>(
      models: models
    );
  }
}

abstract class AFSIDefaultConnectedScreen<TSPI extends AFScreenStateProgrammingInterface, TRouteParam extends AFRouteParam> extends AFSIConnectedScreen<AFSIDefaultStateView, TRouteParam, TSPI> with AFSICreateContextMixin<AFSIDefaultStateView, TRouteParam>, AFSIDefaultStateViewMixin<TRouteParam> {
  AFSIDefaultConnectedScreen(AFScreenID screen, AFCreateSPIDelegate<TSPI, AFSIBuildContext<AFSIDefaultStateView, TRouteParam>> spiCreator): super(screen, AFSIDefaultStateView.create, spiCreator);
}

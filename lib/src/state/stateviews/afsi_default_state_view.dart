
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/src/state/stateviews/afsi_flexible_state_view.dart';

class AFSIDefaultStateView extends AFSIFlexibleStateView {
  static final AFCreateStateViewDelegate<AFSIDefaultStateView> creator = (models) => AFSIDefaultStateView(models: models, create: null);
  AFSIDefaultStateView({
    required Map<String, Object> models, 
    AFCreateStateViewDelegate? create
  }): super(models: models, create: create ?? creator);

  AFTimeState get time { return findType<AFTimeState>(); }
}
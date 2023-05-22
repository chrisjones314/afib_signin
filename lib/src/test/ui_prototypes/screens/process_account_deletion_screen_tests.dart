import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/screens/process_account_deletion_screen.dart';

void defineProcessAccountDeletionScreenPrototypes(AFUIPrototypeDefinitionContext context) {
  _defineProcessAccountDeletionScreenPrototypeInitial(context);
}

void _defineProcessAccountDeletionScreenPrototypeInitial(AFUIPrototypeDefinitionContext context) {  
  var prototype = context.defineScreenPrototype(
    id: AFSIPrototypeID.processAccountDeletionScreenInitial,
    stateView: AFSITestDataID.afsiStateFullLogin,
    navigate: ProcessAccountDeletionScreen.navigatePush(),
  );

  prototype.defineSmokeTest( 
    body: (e) async {
      
  });
}
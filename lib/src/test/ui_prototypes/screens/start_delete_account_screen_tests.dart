import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/screens/start_delete_account_screen.dart';
import 'package:flutter_test/flutter_test.dart' as ft;

void defineStartDeleteAccountScreenPrototypes(AFUIPrototypeDefinitionContext context) {
  _defineStartDeleteAccountScreenPrototypeInitial(context);
}

void _defineStartDeleteAccountScreenPrototypeInitial(AFUIPrototypeDefinitionContext context) {  
  var prototype = context.defineScreenPrototype(
    id: AFSIPrototypeID.startDeleteAccountScreenInitial,
    stateView: AFSITestDataID.afsiStateFullLogin,
    navigate: StartDeleteAccountScreen.navigatePush(
      confirmText: "",
      //!af_push_params
    ),
  );

  prototype.defineSmokeTest( 
    body: (e) async {
      
  });
}
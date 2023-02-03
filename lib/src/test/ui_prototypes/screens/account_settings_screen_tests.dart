import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/screens/account_settings_screen.dart';
import 'package:flutter_test/flutter_test.dart' as ft;

void defineAccountSettingsScreenPrototypes(AFUIPrototypeDefinitionContext context) {
  _defineAccountSettingsScreenPrototypeInitial(context);
}

void _defineAccountSettingsScreenPrototypeInitial(AFUIPrototypeDefinitionContext context) {  
  var prototype = context.defineScreenPrototype(
    id: AFSIPrototypeID.accountSettingsScreenInitial,
    stateView: AFSITestDataID.afsiStateFullLogin,
    navigate: AccountSettingsScreen.navigatePush(
    ),
  );

  prototype.defineSmokeTest( 
    body: (e) async {
      
  });
}
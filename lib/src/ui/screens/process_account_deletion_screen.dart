import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/state/lpis/afsi_signin_actions_lpi.dart';
import 'package:afib_signin/src/state/stateviews/afsi_default_state_view.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:flutter/material.dart';

@immutable
class ProcessAccountDeletionScreenSPI extends SigninBaseSPI {
  ProcessAccountDeletionScreenSPI(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard): super(context, standard);
  
  factory ProcessAccountDeletionScreenSPI.create(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard) {
    return ProcessAccountDeletionScreenSPI(context, standard,
    );
  }

  void onPressedReturnToSignin() {
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onReturnToSigninAfterDelete();
  }
}

class ProcessAccountDeletionScreen extends AFSIConnectedScreen<ProcessAccountDeletionScreenSPI, AFSIDefaultStateView, SigninScreenRouteParam> {
  static final config = AFSIDefaultScreenConfig<ProcessAccountDeletionScreenSPI, SigninScreenRouteParam> (
    spiCreator: ProcessAccountDeletionScreenSPI.create,
    
  );

  ProcessAccountDeletionScreen(): super(    
    screenId: AFSIScreenID.processAccountDeletion, 
    config: config
  );

  static AFNavigatePushAction navigatePush() {
    return AFNavigatePushAction(
      launchParam: SigninScreenRouteParam.createLoading(screenId: AFSIScreenID.processAccountDeletion)
    );
  }

  static AFNavigateReplaceAllAction navigateReplaceAll() {
    return navigatePush().castToReplaceAll();
  }
    
  
  @override
  Widget buildWithSPI(ProcessAccountDeletionScreenSPI spi) {
    final t = spi.t;
    final body = _buildBody(spi);
    return t.childScaffold(
      spi: spi,
      body: body,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: t.childText(text: AFSITranslationID.titleDeletingAccount)
      ),
    );
  }

  Widget _buildBody(ProcessAccountDeletionScreenSPI spi) {
    final t = spi.t;
    final rows = t.column();
    final rowsCard = t.column();

    var titleId = AFSITranslationID.titleDeletingAccount;
    var messageId = AFSITranslationID.messageDeletingAccount;


    if(spi.isReady) {
      titleId = AFSITranslationID.titleDeletedAccount;
      messageId = AFSITranslationID.messageDeletedAccount;
    }

    rowsCard.add(t.childMargin(
      margin: t.margin.v.biggest,
      child: t.childText(text: titleId, style: t.styleOnCard.headlineSmall, textAlign: TextAlign.center)
    ));
    rowsCard.add(t.childText(text: messageId, textAlign: TextAlign.center));

    rowsCard.add(t.childStatusMessage(spi.status, spi.statusMessage));


    if(spi.isReady) {
      rowsCard.add(t.childButtonPrimaryText(
        wid: AFSIWidgetID.buttonCancelCompleteReturnToSignin,
        text: AFSIWidgetID.buttonCancelCompleteReturnToSignin, 
        onPressed: spi.onPressedReturnToSignin
      ));
    }

    rows.add(Card(
      child: t.childMarginStandard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: rowsCard
        )
      )
    ));

    return ListView(
      children: rows
    );
  }

  
}
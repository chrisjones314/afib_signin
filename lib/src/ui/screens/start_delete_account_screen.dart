import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/state/lpis/afsi_signin_actions_lpi.dart';
import 'package:afib_signin/src/state/stateviews/afsi_default_state_view.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:flutter/material.dart';

//!af_extra_imports

@immutable
class StartDeleteAccountScreenSPI extends SigninBaseSPI {
  StartDeleteAccountScreenSPI(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard): super(context, standard);
  
  factory StartDeleteAccountScreenSPI.create(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard) {
    return StartDeleteAccountScreenSPI(context, standard,
    );
  }

  String get confirmText => context.p.password;
  
  //!af_spi_resolve_methods
  
  void onChangedConfirmText(String value) => onChangedPassword(value);

  void onPressedDeleteNow() {
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onDeleteAccount(confirmText);
  }

  void onPressedCancel() {
    onPressedStandardBackButton();
  }
  
  //!af_spi_on_update_methods
  
  
}

class StartDeleteAccountScreen extends AFSIConnectedScreen<StartDeleteAccountScreenSPI, AFSIDefaultStateView, SigninScreenRouteParam> {
  static final config = AFSIDefaultScreenConfig<StartDeleteAccountScreenSPI, SigninScreenRouteParam> (
    spiCreator: StartDeleteAccountScreenSPI.create,
    
  );

  StartDeleteAccountScreen(): super(    screenId: AFSIScreenID.startDeleteAccount, 
      config: config,);

  static AFNavigatePushAction navigatePush({
      required String confirmText,
    //!af_navigate_push_param_decl
  }) {

    return AFNavigatePushAction(
      launchParam: SigninScreenRouteParam.createReady(screenId: AFSIScreenID.startDeleteAccount)
        //!af_navigate_push_param_call
      );
  }
    
  
  @override
  Widget buildWithSPI(StartDeleteAccountScreenSPI spi) {
        final t = spi.t;
        final body = _buildBody(spi);
        return t.childScaffold(
          spi: spi,
          body: body,
          appBar: AppBar(
            title: t.childText(text: "Delete Account"),
            leading: t.leadingButtonStandardBack(spi, screen: screenId),
            automaticallyImplyLeading: false,
          ),
        );
  }

  Widget _buildBody(StartDeleteAccountScreenSPI spi) {
    final t = spi.t;
    final context = spi.context;
    final rows = t.column();
    rows.add(t.childDeleteAccountPreamble(
      onPressedCancel: spi.onPressedCancel,
    ));    

    rows.add(t.childDeleteAccountAction(
      widConfirmText: AFSIWidgetID.editPassword,
      routeParam: spi.context.p,
      confirmText: spi.confirmText,
      statusMessage: t.childStatusMessage(context.p.status, context.p.statusMessage),
      onChangedConfirmText: spi.onChangedConfirmText,
      onPressedDeleteNow: spi.onPressedDeleteNow,
    ));
    return ListView(
      children: rows
    );
  }

  
}
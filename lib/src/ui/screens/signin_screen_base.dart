//--------------------------------------------------------------------------------------
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_id.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:afib_signin/src/state/stateviews/afsi_default_state_view.dart';
import 'package:afib_signin/src/ui/themes/afsi_default_theme.dart';
import 'package:flutter/material.dart';

enum AFSISigninStatus {
  loading,
  error,
  ready,  
  readyEmphasis,
}

class SigninScreenRouteParam extends AFRouteParamWithFlutterState {
  final AFSISigninStatus status;
  final String statusMessage; 
  final bool showPassword;
  final bool rememberMe;

  final String email;
  final String password;

  SigninScreenRouteParam({
    required AFID id,
    required this.statusMessage, 
    required this.status,
    required this.email,
    required this.password,
    required AFFlutterRouteParamState flutterState,
    required this.showPassword,
    required this.rememberMe,
  }): super(id: id, flutterState: flutterState);

  SigninScreenRouteParam copyWith({
    AFSISigninStatus? status,
    String? statusMessage,
    String? email,
    String? password,
    bool? showPassword,
    bool? rememberMe,
  }) {

    return SigninScreenRouteParam(
      id: this.id,
      statusMessage: statusMessage ?? this.statusMessage,
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      flutterState: this.flutterState,
      showPassword: showPassword ?? this.showPassword,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  SigninScreenRouteParam reviseStatus({
    AFSISigninStatus? status, 
    String? message
  }) {
    return copyWith(status: status, statusMessage: message);
  }

  factory SigninScreenRouteParam.createLoadingOncePerScreen({
    required AFID screenId,
  }) {
    final flutterState = _createInitialFlutterState();
    return SigninScreenRouteParam(
      id: screenId,
      status: AFSISigninStatus.loading,
      statusMessage: "",
      email: "",
      password: "",
      flutterState: flutterState,
      showPassword: true,
      rememberMe: false,
    );
  }

  factory SigninScreenRouteParam.createReadyOncePerScreen({
    required AFID screenId,
    String? email
  }) {
    final flutterState = _createInitialFlutterState(email: email);
    
    return SigninScreenRouteParam(
      id: screenId,
      statusMessage: "",
      status: AFSISigninStatus.ready,
      email: email ?? "",
      password: "",
      showPassword: false,
      flutterState: flutterState,
      rememberMe: false,
    );
  }

  static AFFlutterRouteParamState _createInitialFlutterState({
    String? email
  }) {
    final flutterState = AFFlutterRouteParamState(
      textControllers: _createTextControllers(email: email)
    );
    return flutterState;
  }

  static AFTextEditingControllers _createTextControllers({
    String? email
  }) {
    final controllers = AFTextEditingControllers.createN({
      AFSIWidgetID.editEmail: email ?? "",
      AFSIWidgetID.editPassword: "",
    });
    return controllers;
  }
}


//--------------------------------------------------------------------------------------
@immutable
class SigninBaseSPI extends AFSIScreenSPI<AFSIDefaultStateView, SigninScreenRouteParam> {
  SigninBaseSPI(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFScreenID screenId, AFSIDefaultTheme theme): super(context, screenId, theme, );
  
  factory SigninBaseSPI.create(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFSIDefaultTheme theme, AFScreenID screenId, ) {
    return SigninBaseSPI(context, screenId, theme,
    );
  }

  //--------------------------------------------------------------------------------------
  void onChangedEmail(String email) {
    context.updateTextField(AFSIWidgetID.editEmail, email);
    context.updateRouteParam(context.p.copyWith(email: email));
  }

  //--------------------------------------------------------------------------------------
  void onChangedPassword(String password) {
    context.updateTextField(AFSIWidgetID.editPassword, password);
    context.updateRouteParam(context.p.copyWith(password: password));    
  }
}

abstract class SigninScreenBase<TSPI extends AFScreenStateProgrammingInterface, TRouteParam extends AFRouteParam> extends AFSIConnectedScreen<TSPI, AFSIDefaultStateView, TRouteParam> {
  
  //--------------------------------------------------------------------------------------
  SigninScreenBase({
    required AFScreenID screenId,
    required AFConnectedUIConfig<AFComponentStateUnused, AFSIDefaultTheme, AFSIDefaultStateView, TRouteParam, TSPI>  config,
  }): super(screenId: screenId, config: config);


  //--------------------------------------------------------------------------------------
  Widget buildMainScaffold(SigninBaseSPI spi, Widget mainControls) {
    final t = spi.t;
    return t.childStandardSigninScaffold(
      spi: spi,
      body: mainControls
    );
  }
}


//--------------------------------------------------------------------------------------
import 'package:afib/afib_command.dart';
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

class SigninScreenRouteParam extends AFScreenRouteParamWithFlutterState {
  final AFSISigninStatus status;
  final String statusMessage; 
  final bool showPassword;
  final bool rememberMe;

  final String email;
  final String password;
  final String passwordConfirm;

  SigninScreenRouteParam({
    required AFScreenID screenId,
    required this.statusMessage, 
    required this.status,
    required this.email,
    required this.password,
    required this.passwordConfirm,
    required AFFlutterRouteParamState flutterState,
    required this.showPassword,
    required this.rememberMe,
  }): super(screenId: screenId, flutterState: flutterState);

  SigninScreenRouteParam copyWith({
    AFSISigninStatus? status,
    String? statusMessage,
    String? email,
    String? password,
    String? passwordConfirm,
    bool? showPassword,
    bool? rememberMe,
  }) {

    return SigninScreenRouteParam(
      screenId: this.screenId,
      statusMessage: statusMessage ?? this.statusMessage,
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      passwordConfirm: passwordConfirm ?? this.passwordConfirm,
      flutterState: this.flutterStateGuaranteed,
      showPassword: showPassword ?? this.showPassword,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  bool get isLoading => status == AFSISigninStatus.loading;
  bool get isReady => status == AFSISigninStatus.ready;


  SigninScreenRouteParam reviseStatus({
    AFSISigninStatus? status, 
    String? message,
    String? email,
  }) {
    return copyWith(status: status, statusMessage: message, email: email);
  }

  factory SigninScreenRouteParam.createSigninLoading() {
    return SigninScreenRouteParam.createLoading(screenId: AFSIScreenID.signin);
  }
 
  factory SigninScreenRouteParam.createLoading({
    required AFScreenID screenId,
  }) {
    final flutterState = _createInitialFlutterState();
    return SigninScreenRouteParam(
      screenId: screenId,
      status: AFSISigninStatus.loading,
      statusMessage: "",
      email: "",
      password: "",
      passwordConfirm: "",
      flutterState: flutterState,
      showPassword: false,
      rememberMe: false,
    );
  }

  factory SigninScreenRouteParam.createReady({
    required AFScreenID screenId,
    String? email,
    bool showPassword = false,
  }) {
    final flutterState = _createInitialFlutterState(email: email);
    
    return SigninScreenRouteParam(
      screenId: screenId,
      statusMessage: "",
      status: AFSISigninStatus.ready,
      email: email ?? "",
      password: "",
      passwordConfirm: "",
      showPassword: showPassword,
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
      AFSIWidgetID.editPasswordConfirm: "",
    });
    return controllers;
  }
}


//--------------------------------------------------------------------------------------
@immutable
class SigninBaseSPI extends AFSIScreenSPI<AFSIDefaultStateView, SigninScreenRouteParam> {
  SigninBaseSPI(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard): super(context, standard );
  
  factory SigninBaseSPI.create(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFStandardSPIData standard) {
    return SigninBaseSPI(context, standard,
    );
  }

  //--------------------------------------------------------------------------------------
  bool get isLoading => context.p.isLoading;
  bool get isReady => context.p.isReady;
  AFSISigninStatus get status => context.p.status;
  String get statusMessage => context.p.statusMessage;
  

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

  //--------------------------------------------------------------------------------------
  void onChangedPasswordConfirm(String password) {
    context.updateTextField(AFSIWidgetID.editPasswordConfirm, password);
    context.updateRouteParam(context.p.copyWith(passwordConfirm: password));    
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
      body: mainControls,
      isLoading: spi.isLoading
    );
  }
}


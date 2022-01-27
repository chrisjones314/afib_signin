//--------------------------------------------------------------------------------------
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:afib_signin/src/ui/stateviews/afsi_default_state_view.dart';
import 'package:flutter/material.dart';

enum AFSISigninStatus {
  loading,
  error,
  ready,  
  readyEmphasis,
}

/// Used to supply the implementation that actually does the signin,
/// forgot password, or signup actions.
abstract class AFSISigninConfiguration {
  void onSignin(AFBuildContext context, String email, String password, { required bool rememberMe } );
  void onResetPassword(AFBuildContext context, String email);
  void onSignup(AFBuildContext context, String email, String password);
}

//
class AFSITestActionConfiguration extends AFSISigninConfiguration {
  String? email;
  String? password;
  bool? rememberMe;
  bool visited = false;
  void onSignin(AFBuildContext context, String email, String password, { required bool rememberMe }) {
    context.log?.d("Signin $email/$password");
    this.email = email;
    this.password = password;
    this.rememberMe = rememberMe;
    visited = true;

  }

  void onResetPassword(AFBuildContext context, String email) {
    context.log?.d("Signin $password");
    this.email = email;
    visited = true;
  }

  void onSignup(AFBuildContext context, String email, String password) {
    context.log?.d("Signin $email/$password");
    this.email = email;
    this.password = password;
    visited = true;
  }

}

class SigninScreenRouteParam extends AFRouteParam {
  final AFSISigninStatus status;
  final String statusMessage; 
  final AFSISigninConfiguration configuration;
  final bool showPassword;
  final bool rememberMe;

  final String email;
  final String password;
  final AFTextEditingControllersHolder textControllers;

  SigninScreenRouteParam({
    required AFID id,
    required this.statusMessage, 
    required this.status,
    required this.configuration,
    required this.email,
    required this.password,
    required this.textControllers,
    required this.showPassword,
    required this.rememberMe,
  }): super(id: id);

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
      textControllers: this.textControllers,
      configuration: this.configuration,
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
    required AFSISigninConfiguration config
  }) {

    return SigninScreenRouteParam(
      id: screenId,
      status: AFSISigninStatus.loading,
      statusMessage: "",
      email: "",
      password: "",
      textControllers: _createEmptyText(),
      configuration: config,
      showPassword: true,
      rememberMe: false,
    );
  }

  factory SigninScreenRouteParam.createReadyOncePerScreen({
    required AFID screenId,
    required AFSISigninConfiguration config
  }) {
    return SigninScreenRouteParam(
      id: screenId,
      statusMessage: "",
      status: AFSISigninStatus.ready,
      email: "",
      password: "",
      showPassword: false,
      textControllers: _createEmptyText(),
      configuration: config,
      rememberMe: false,
    );
  }

  static AFTextEditingControllersHolder _createEmptyText() {
    final controllers = AFTextEditingControllersHolder.createN({
      AFSIWidgetID.editEmail: "",
      AFSIWidgetID.editPassword: "",
    });
    return controllers;
  }

  @override
  void dispose() {
    textControllers.dispose();
  }
}

//--------------------------------------------------------------------------------------
@immutable
class SigninExternalSPI<TStateView extends AFFlexibleStateView, TRouteParam extends AFRouteParam> extends AFStateProgrammingInterface<AFSIBuildContext<TStateView, TRouteParam>> {
  SigninExternalSPI(AFSIBuildContext<TStateView, TRouteParam> context, AFConnectedUIBase screen): super(context, screen);
}


//--------------------------------------------------------------------------------------
@immutable
class SigninBaseSPI extends SigninExternalSPI<AFSIDefaultStateView, SigninScreenRouteParam> {
  SigninBaseSPI(AFSIBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFConnectedUIBase screen): super(context, screen);

  void onUpdateEmail(String email) {
    context.updateRouteParam(owner, context.p.copyWith(email: email));
  }

  void onUpdatePassword(String password) {
    context.updateRouteParam(owner, context.p.copyWith(password: password));    
  }
}

abstract class SigninScreenBase<TSPI extends AFStateProgrammingInterface, TRouteParam extends AFRouteParam> extends AFSIDefaultConnectedScreen<TSPI, TRouteParam> {
  SigninScreenBase(AFScreenID screenId, AFCreateSPIDelegate<TSPI, AFSIBuildContext<AFSIDefaultStateView, TRouteParam>> spiCreator): super(screenId, spiCreator);

  //--------------------------------------------------------------------------------------
  Widget buildMainScaffold(AFSIBuildContext<AFSIDefaultStateView, TRouteParam>  context, Widget mainControls) {
    final t = context.t;
    return t.childStandardSigninScaffold(
      context: context,
      body: mainControls
    );
  }
}


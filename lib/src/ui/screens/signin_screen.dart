import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:afib_signin/src/ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';

/// Used to supply the implementation that actually does the signin,
/// forgot password, or signup actions.
abstract class AFSISigninConfiguration {
  void onSignin(AFBuildContext context, String email, String password);
  void onResetPassword(AFBuildContext context, String email);
  void onSignup(AFBuildContext context, String email, String password);
}

//
class AFSITestActionConfiguration extends AFSISigninConfiguration {
  String email;
  String password;
  bool visited = false;
  void onSignin(AFBuildContext context, String email, String password) {
    context.log?.d("Signin $email/$password");
    this.email = email;
    this.password = password;
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

  final String email;
  final String password;
  final AFTextEditingControllersHolder textControllers;

  SigninScreenRouteParam({
    @required this.statusMessage, 
    @required this.status,
    @required this.configuration,
    @required this.email,
    @required this.password,
    @required this.textControllers,
    @required this.showPassword,
  });

  SigninScreenRouteParam copyWith({
    AFSISigninStatus status,
    String statusMessage,
    String email,
    String password,
    bool showPassword
  }) {

    return SigninScreenRouteParam(
      statusMessage: statusMessage ?? this.statusMessage,
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      textControllers: this.textControllers,
      configuration: this.configuration,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  SigninScreenRouteParam reviseStatus({AFSISigninStatus status, String message}) {
    return copyWith(status: status, statusMessage: message);
  }

  factory SigninScreenRouteParam.createLoadingOncePerScreen({AFSISigninConfiguration config}) {

    return SigninScreenRouteParam(
      status: AFSISigninStatus.loading,
      statusMessage: "",
      email: "",
      password: "",
      textControllers: _createEmptyText(),
      configuration: config,
      showPassword: true,
    );
  }

  factory SigninScreenRouteParam.createReadyOncePerScreen({AFSISigninConfiguration config}) {
    return SigninScreenRouteParam(
      statusMessage: "",
      status: AFSISigninStatus.ready,
      email: "",
      password: "",
      showPassword: false,
      textControllers: _createEmptyText(),
      configuration: config,
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

/// The primary username/password signing screen, with buttons linking to forgot password
/// and register.
class SigninScreen extends SigninScreenBase<AFStateView, SigninScreenRouteParam> {

  SigninScreen(): super(AFSIScreenID.signin);

 //--------------------------------------------------------------------------------------
  @override
  AFStateView createStateView(AFAppStateArea state, SigninScreenRouteParam param) {
    return AFStateView();
  }

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePushReady(AFSISigninConfiguration config) {
    return AFNavigatePushAction(
      screen: AFSIScreenID.signin,
      routeParam: SigninScreenRouteParam.createReadyOncePerScreen(config: config),
    );
  }

  //--------------------------------------------------------------------------------------
  Widget buildMainControls(AFSIBuildContext<AFStateView, SigninScreenRouteParam>  context) {
    final t = context.t;
    final widgets = t.column();

    if (context.p.status == AFSISigninStatus.loading) {
      return _buildSignInWait(context);
    } else {
      _loginScreen(context, widgets);
    }

    return t.childMargin(
      margin: t.marginScreen,
      child: ListView(
        children: widgets
      )
    );
  }

  //--------------------------------------------------------------------------------------
  Widget _buildSignInWait(
      AFSIBuildContext<AFStateView, SigninScreenRouteParam>  context
  ) {
    final t = context.t;
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: t.childText(context.p.statusMessage, textColor: t.colorOnError)
      )
    );
  }

  //--------------------------------------------------------------------------------------
  void _loginScreen(AFSIBuildContext<AFStateView, SigninScreenRouteParam> context, List<Widget> rows) {
    final t = context.t;
    final textControllers = context.p.textControllers;

    rows.add(
      t.childSplashScreenTitle(text: AFUITranslationID.appTitle)
    );
    rows.add(t.childMargin(
      margin: t.marginEmail,
      child: t.childTextField(
      wid: AFSIWidgetID.editEmail,
      style: t.styleOnPrimary.bodyText2,
      text: context.p.email,
      controllers: textControllers,
      decoration: t.decorationTextInput(
        text: AFSIWidgetID.editEmail,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        updateRouteParam(context, context.p.copyWith(email: value));
      }
    )));
    rows.add(t.childMargin(
      margin: t.marginPassword,
      child: t.childTextField(
        wid: AFSIWidgetID.editPassword,
        controllers: textControllers,
        text: context.p.password,
        style: t.styleOnPrimary.bodyText2,
        decoration: t.decorationTextInput(
          text: AFSIWidgetID.editPassword,
        ),
        obscureText: true,
        onChanged: (value) {
          updateRouteParam(context, context.p.copyWith(password: value));
        }
    )));
    rows.add(t.childStatusMessage(context.t, context.p.status, context.p.statusMessage));

    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonLogin,
      onPressed: () {
          updateRouteParam(context, context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(AFSITranslationID.messageSigningIn)));
          context.p.configuration.onSignin(context, context.p.email, context.p.password);
      },
    ));
    
    rows.add(t.childButtonSecondarySignin(
      wid: AFSIWidgetID.buttonSignup,
      onPressed: () {
        context.dispatchNavigate(SignupScreen.navigatePush(context.p.configuration));      
      },
    ));

    rows.add(t.childButtonSecondarySignin( 
      wid: AFSIWidgetID.buttonForgotPassword,
      onPressed: () {
        context.dispatchNavigate(ForgotPasswordScreen.navigatePush(context.p.configuration));
      },
    ));
  }
}


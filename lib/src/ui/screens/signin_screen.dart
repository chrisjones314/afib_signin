import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:afib_signin/src/ui/screens/forgot_password_screen.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:afib_signin/src/ui/screens/signup_screen.dart';
import 'package:afib_signin/src/ui/stateviews/afsi_default_state_view.dart';
import 'package:flutter/material.dart';

@immutable
class SigninSPI extends SigninBaseSPI {
  static final creator = (context, screen) => SigninSPI(context, screen);
  SigninSPI(AFSIBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFConnectedUIBase screen): super(context, screen);

  void onClickLogin() {
    final t = context.t;
    context.updateRouteParam(owner, context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(AFSITranslationID.messageSigningIn)));
    context.p.configuration.onSignin(context, context.p.email, context.p.password, rememberMe: context.p.rememberMe);
  }
}

/// The primary username/password signing screen, with buttons linking to forgot password
/// and register.
class SigninScreen extends SigninScreenBase<SigninSPI, SigninScreenRouteParam> {

  SigninScreen(): super(AFSIScreenID.signin, SigninSPI.creator);

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePushReady(AFSISigninConfiguration config) {
    return AFNavigatePushAction(
      routeParam: SigninScreenRouteParam.createReadyOncePerScreen(screenId: AFSIScreenID.signin, config: config),
    );
  }

  //--------------------------------------------------------------------------------------
  @override
  Widget buildWithContext(SigninSPI spi) {
    final main = buildMainControls(spi);
    return buildMainScaffold(spi.context, main);
  }


  //--------------------------------------------------------------------------------------
  Widget buildMainControls(SigninSPI spi) {
    final context = spi.context;
    final t = context.t;
    final widgets = t.column();

    if (context.p.status == AFSISigninStatus.loading) {
      return _buildSignInWait(spi);
    } else {
      _loginScreen(spi, widgets);
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
    SigninSPI spi
  ) {
    final context = spi.context;
    final t = context.t;
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: t.childText(context.p.statusMessage, textColor: t.colorOnError)
      )
    );
  }

  //--------------------------------------------------------------------------------------
  void _loginScreen(SigninSPI spi, List<Widget> rows) {
    final context = spi.context;
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
      cursorColor: t.colorCursor,
      controllers: textControllers,
      decoration: t.decorationTextInput(
        text: AFSIWidgetID.editEmail,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        spi.onUpdateEmail(value);
      }
    )));
    rows.add(t.childMargin(
      margin: t.marginPassword,
      child: t.childTextField(
        wid: AFSIWidgetID.editPassword,
        controllers: textControllers,
        text: context.p.password,
        style: t.styleOnPrimary.bodyText2,
        cursorColor: t.colorCursor,
        decoration: t.decorationTextInput(
          text: AFSIWidgetID.editPassword,
        ),
        obscureText: true,
        onChanged: (value) {
          spi.onUpdatePassword(value);
        }
    )));
    final rememberSigninCheck = t.childCheckRememberSignin(
      buildContext: context.c,
      checked: context.p.rememberMe,
      onChanged: (newVal) {
        final revised = context.p.copyWith(rememberMe: newVal);
        updateRouteParam(context, revised);
      }
    );
    if(rememberSigninCheck != null) {
      rows.add(rememberSigninCheck);
    }
    
    rows.add(t.childStatusMessage(context.t, context.p.status, context.p.statusMessage));

    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonLogin,
      text: AFSIWidgetID.buttonLogin,
      onPressed: () {
        spi.onClickLogin();
      },
    ));
    
    rows.add(t.childButtonSecondarySignin(
      wid: AFSIWidgetID.buttonSignup,
      text: AFSIWidgetID.buttonSignup,
      onPressed: () {
        context.dispatchNavigate(SignupScreen.navigatePush(context.p.configuration));      
      },
    ));

    rows.add(t.childButtonSecondarySignin( 
      wid: AFSIWidgetID.buttonForgotPassword,
      text: AFSIWidgetID.buttonForgotPassword,
      onPressed: () {
        context.dispatchNavigate(ForgotPasswordScreen.navigatePush(context.p.configuration));
      },
    ));
  }
}


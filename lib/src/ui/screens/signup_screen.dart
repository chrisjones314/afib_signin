import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:afib_signin/src/ui/stateviews/afsi_default_state_view.dart';
import 'package:flutter/material.dart';

//--------------------------------------------------------------------------------------
@immutable
class SignupPasswordSPI extends SigninBaseSPI {
  static final creator = (context, screen) => SignupPasswordSPI(context, screen);
  SignupPasswordSPI(AFSIBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFConnectedUIBase screen): super(context, screen);

  void onClickRegister() {
    final t = context.t;
    context.updateRouteParam(owner, context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(AFSITranslationID.messageSigningUp)));
    context.p.configuration.onSignup(context, context.p.email, context.p.password);
  }
}


//--------------------------------------------------------------------------------------
class SignupScreen extends SigninScreenBase<SignupPasswordSPI, SigninScreenRouteParam> {

  //--------------------------------------------------------------------------------------
  SignupScreen(): super(AFSIScreenID.signup, SignupPasswordSPI.creator);

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePush(AFSISigninConfiguration config) {
    return AFNavigatePushAction(
      routeParam: SigninScreenRouteParam.createReadyOncePerScreen(screenId: AFSIScreenID.signup, config: config)
    );
  }

  //--------------------------------------------------------------------------------------
  @override
  Widget buildWithContext(SignupPasswordSPI spi) {
    final main = buildMainControls(spi);
    return buildMainScaffold(spi.context, main);
  }

  //--------------------------------------------------------------------------------------
  Widget buildMainControls(SignupPasswordSPI spi) {
    final context = spi.context;
    final t = context.t;
    final rows = t.column();

    _registerScreen(spi, rows);

    return t.childMargin(
      margin: t.marginScreen,
      child: ListView(
        children: rows
      )
    );
  }

  //--------------------------------------------------------------------------------------
  void _registerScreen(SignupPasswordSPI spi, List<Widget> rows) {
    final context = spi.context;
    final t = context.t;

   final textControllers = context.p.textControllers;

    rows.add(t.childSplashScreenTitle(text: AFSITranslationID.titleSignup));
    rows.add(t.childMargin(
      margin: t.marginEmail,
      child: t.childTextField(
      wid: AFSIWidgetID.editEmail,
      style: t.styleOnPrimary.bodyText2,
      text: context.p.email,
      controllers: textControllers,
      decoration: t.decorationTextInput(
        text: AFSIWidgetID.editEmail
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
        decoration: t.decorationTextInput(
          text: AFSIWidgetID.editPassword,
        ),
        obscureText: !context.p.showPassword,
        onChanged: (value) {
          spi.onUpdatePassword(value);
        }
    )));
    rows.add(t.childShowPasswordCheck(
      context,
      showPassword: context.p.showPassword,
      onChanged: (val) {
        updateRouteParam(context, context.p.copyWith(showPassword: val));
      }
    ));

    rows.add(t.childStatusMessage(context.t, context.p.status, context.p.statusMessage));

    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonRegister,
      text: AFSIWidgetID.buttonRegister,
      onPressed: () {
        spi.onClickRegister();
      },
    ));

    rows.add(t.childButtonSecondarySignin(
      wid: AFUIWidgetID.buttonBack,
      text: AFSITranslationID.backToSignin,
      onPressed: () {
        context.dispatchNavigatePop();
      },
    ));

  }
}


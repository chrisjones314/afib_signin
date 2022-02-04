import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:afib_signin/src/ui/stateviews/afsi_default_state_view.dart';
import 'package:afib_signin/src/ui/themes/afsi_default_theme.dart';
import 'package:flutter/material.dart';

//--------------------------------------------------------------------------------------
@immutable
class SignupPasswordSPI extends SigninBaseSPI {
  SignupPasswordSPI(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFScreenID screenId, AFSIDefaultTheme theme): super(context, screenId, theme, );
  
  factory SignupPasswordSPI.create(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFSIDefaultTheme theme, AFScreenID screenId, ) {
    return SignupPasswordSPI(context, screenId, theme,
    );
  }

  void onClickRegister() {
    updateRouteParam(context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(AFSITranslationID.messageSigningUp)));
    context.p.configuration.onSignup(context, context.p.email, context.p.password);
  }
}


//--------------------------------------------------------------------------------------
class SignupScreen extends SigninScreenBase<SignupPasswordSPI, SigninScreenRouteParam> {

  //--------------------------------------------------------------------------------------
  static final config = AFSIDefaultScreenConfig<SignupPasswordSPI, SigninScreenRouteParam> (
    spiCreator: SignupPasswordSPI.create,
  );

  //--------------------------------------------------------------------------------------
  SignupScreen(): super(screenId: AFSIScreenID.signup, config: config);

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePush(AFSISigninConfiguration config) {
    return AFNavigatePushAction(
      routeParam: SigninScreenRouteParam.createReadyOncePerScreen(screenId: AFSIScreenID.signup, config: config)
    );
  }

  //--------------------------------------------------------------------------------------
  @override
  Widget buildWithSPI(SignupPasswordSPI spi) {
    final main = buildMainControls(spi);
    return buildMainScaffold(spi, main);
  }

  //--------------------------------------------------------------------------------------
  Widget buildMainControls(SignupPasswordSPI spi) {
    final t = spi.t;
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
    final t = spi.t;

   final textControllers = context.p.textControllers;

    rows.add(t.childSplashScreenTitle(text: AFSITranslationID.titleSignup));
    rows.add(t.childMargin(
      margin: t.marginEmail,
      child: t.childTextField(
        screenId: screenId,
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
        screenId: screenId,
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
        spi.updateRouteParam(context.p.copyWith(showPassword: val));
      }
    ));

    rows.add(t.childStatusMessage(spi.t, context.p.status, context.p.statusMessage));

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


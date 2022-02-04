import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/id.dart';
import 'package:afib_signin/src/ui/screens/signin_screen_base.dart';
import 'package:afib_signin/src/ui/stateviews/afsi_default_state_view.dart';
import 'package:afib_signin/src/ui/themes/afsi_default_theme.dart';
import 'package:flutter/material.dart';


//--------------------------------------------------------------------------------------
@immutable
class ForgotPasswordSPI extends SigninBaseSPI {
  ForgotPasswordSPI(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFScreenID screenId, AFSIDefaultTheme theme): super(context, screenId, theme, );
  
  factory ForgotPasswordSPI.create(AFBuildContext<AFSIDefaultStateView, SigninScreenRouteParam> context, AFSIDefaultTheme theme, AFScreenID screenId, ) {
    return ForgotPasswordSPI(context, screenId, theme,
    );
  }

  void onUpdateEmail(String email) {
    updateRouteParam(context.p.copyWith(email: email));
  }

  void onClickRecover() {
    updateRouteParam(context.p.copyWith(status: AFSISigninStatus.ready, statusMessage: t.translate(AFSITranslationID.messageResettingPassword)));
    context.p.configuration.onResetPassword(context, context.p.email);
  }
}

//--------------------------------------------------------------------------------------
class ForgotPasswordScreen extends SigninScreenBase<ForgotPasswordSPI, SigninScreenRouteParam> {

  ForgotPasswordScreen(): super(screenId: AFSIScreenID.forgotPassword, config: config);

  //--------------------------------------------------------------------------------------
  static final config = AFSIDefaultScreenConfig<ForgotPasswordSPI, SigninScreenRouteParam> (
    spiCreator: ForgotPasswordSPI.create,
  );

  //--------------------------------------------------------------------------------------
  static AFNavigatePushAction navigatePush(AFSISigninConfiguration config) {
    return AFNavigatePushAction(
      routeParam: SigninScreenRouteParam.createReadyOncePerScreen(screenId: AFSIScreenID.forgotPassword, config: config)
    );
  }

  //--------------------------------------------------------------------------------------
  @override
  Widget buildWithSPI(ForgotPasswordSPI spi) {
    final main = buildMainControls(spi);
    return buildMainScaffold(spi, main);
  }


  //--------------------------------------------------------------------------------------
  Widget buildMainControls(ForgotPasswordSPI spi) {
    final t = spi.t;
    final rows = t.column();

    _forgotPasswordScreen(spi, rows);

    return t.childMargin(
      margin: t.marginScreen,
      child: ListView(
      children: rows
    ));
  }

  //--------------------------------------------------------------------------------------
  void _forgotPasswordScreen(ForgotPasswordSPI spi, List<Widget> rows) {
    final context = spi.context;
    final t = spi.t;
    final textControllers = context.p.textControllers;
    rows.add(t.childSplashScreenTitle(text: AFSITranslationID.titleForgotPassword));

    rows.add(t.childMargin(
      margin: t.marginEmail,
      child: t.childTextField(
      screenId: screenId,
      wid: AFSIWidgetID.editEmail,
      text: context.p.email,
      style: t.styleOnPrimary.bodyText2,
      controllers: textControllers,
      decoration: t.decorationTextInput(
        text: AFSIWidgetID.editEmail,
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        spi.onUpdateEmail(value);
      }
    )));

    rows.add(t.childStatusMessage(spi.t, context.p.status, context.p.statusMessage));
    rows.add(t.childButtonPrimarySignin(
      wid: AFSIWidgetID.buttonResetPassword,
      text: AFSIWidgetID.buttonResetPassword,
      onPressed: () {
        spi.onClickRecover();
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


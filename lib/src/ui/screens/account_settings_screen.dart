import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/afsi_flutter.dart';
import 'package:flutter/material.dart';

//!af_extra_imports


class AccountSettingsScreenRouteParam extends AFScreenRouteParamWithFlutterState {
  final String currentPasswordForPassword;
  final String newPassword;
  final String newPasswordConfirm;
  final String currentPasswordForEmail;
  final String newEmail;
  final AFSISigninStatus changeEmailStatus;
  final String changeEmailStatusMessage;
  final AFSISigninStatus changePasswordStatus;
  final String changePasswordStatusMessage;
  //!af_member_variables
  
  AccountSettingsScreenRouteParam({
    required this.currentPasswordForPassword,
    required this.newPassword,
    required this.newPasswordConfirm,
    required this.currentPasswordForEmail,
    required this.newEmail,
    required AFFlutterRouteParamState flutterState,
    required this.changeEmailStatus,
    required this.changeEmailStatusMessage,
    required this.changePasswordStatus,
    required this.changePasswordStatusMessage,
    //!af_constructor_params
  }): super(
    screenId: AFSIScreenID.accountSettings,
    flutterState: flutterState,
    
  );

  factory AccountSettingsScreenRouteParam.create({
      required String currentPasswordForPassword,
      required String newPassword,
      required String newPasswordConfirm,
      required String currentPasswordForEmail,
      required String newEmail,
      required AFSISigninStatus changeEmailStatus,
      required String changeEmailStatusMessage,
      required AFSISigninStatus changePasswordStatus,
      required String changePasswordStatusMessage,
    //!af_navigate_push_param_decl
      required AFFlutterRouteParamState flutterState,
  }) {
    return AccountSettingsScreenRouteParam(
        currentPasswordForPassword: currentPasswordForPassword,
        newPassword: newPassword,
        newPasswordConfirm: newPasswordConfirm,
        currentPasswordForEmail: currentPasswordForEmail,
        newEmail: newEmail,
        flutterState: flutterState,
        changeEmailStatus: changeEmailStatus,
        changeEmailStatusMessage: changeEmailStatusMessage,
        changePasswordStatus: changePasswordStatus,
        changePasswordStatusMessage: changePasswordStatusMessage,
    );
  }

  //!af_resolve_methods
  
  AccountSettingsScreenRouteParam reviseCurrentPasswordForPassword(String currentPasswordForPassword) => copyWith(currentPasswordForPassword: currentPasswordForPassword);
  AccountSettingsScreenRouteParam reviseNewPassword(String newPassword) => copyWith(newPassword: newPassword);
  AccountSettingsScreenRouteParam reviseNewPasswordConfirm(String newPasswordConfirm) => copyWith(newPasswordConfirm: newPasswordConfirm);
  AccountSettingsScreenRouteParam reviseCurrentPasswordForEmail(String currentPasswordForEmail) => copyWith(currentPasswordForEmail: currentPasswordForEmail);
  AccountSettingsScreenRouteParam reviseNewEmail(String newEmail) => copyWith(newEmail: newEmail);
  AccountSettingsScreenRouteParam reviseChangeEmailStatus(AFSISigninStatus changeEmailStatus, String message) => copyWith(changeEmailStatus: changeEmailStatus, changeEmailStatusMessage: message);
  AccountSettingsScreenRouteParam reviseChangeEmailStatusMessage(String changeEmailStatusMessage) => copyWith(changeEmailStatusMessage: changeEmailStatusMessage);
  AccountSettingsScreenRouteParam reviseChangePasswordStatus(AFSISigninStatus changePasswordStatus, String message) => copyWith(changePasswordStatus: changePasswordStatus, changePasswordStatusMessage: message);
  AccountSettingsScreenRouteParam reviseChangePasswordStatusMessage(String changePasswordStatusMessage) => copyWith(changePasswordStatusMessage: changePasswordStatusMessage);
  //!af_revise_methods
  

  AccountSettingsScreenRouteParam copyWith({
    String? currentPasswordForPassword,
    String? newPassword,
    String? newPasswordConfirm,
    String? currentPasswordForEmail,
    String? newEmail,
    AFSISigninStatus? changeEmailStatus,
    String? changeEmailStatusMessage,
    AFSISigninStatus? changePasswordStatus,
    String? changePasswordStatusMessage,
    //!af_copy_with_params
  }) {
    return AccountSettingsScreenRouteParam(
      currentPasswordForPassword: currentPasswordForPassword ?? this.currentPasswordForPassword,
      newPassword: newPassword ?? this.newPassword,
      newPasswordConfirm: newPasswordConfirm ?? this.newPasswordConfirm,
      currentPasswordForEmail: currentPasswordForEmail ?? this.currentPasswordForEmail,
      newEmail: newEmail ?? this.newEmail,
      flutterState: this.flutterStateGuaranteed,
      changeEmailStatus: changeEmailStatus ?? this.changeEmailStatus,
      changeEmailStatusMessage: changeEmailStatusMessage ?? this.changeEmailStatusMessage,
      changePasswordStatus: changePasswordStatus ?? this.changePasswordStatus,
      changePasswordStatusMessage: changePasswordStatusMessage ?? this.changePasswordStatusMessage,
      //!af_copy_with_constructor_call
    );
  }

  
}

@immutable
class AccountSettingsScreenSPI extends AFSIScreenSPI<AFSIDefaultStateView, AccountSettingsScreenRouteParam> {
  AccountSettingsScreenSPI(AFBuildContext<AFSIDefaultStateView, AccountSettingsScreenRouteParam> context, AFStandardSPIData standard): super(context, standard);
  
  factory AccountSettingsScreenSPI.create(AFBuildContext<AFSIDefaultStateView, AccountSettingsScreenRouteParam> context, AFStandardSPIData standard) {
    return AccountSettingsScreenSPI(context, standard,
    );
  }

  String get currentPasswordForPassword => context.p.currentPasswordForPassword;
  String get newPassword => context.p.newPassword;
  String get newPasswordConfirm => context.p.newPasswordConfirm;
  String get currentPasswordForEmail => context.p.currentPasswordForEmail;
  String get newEmail => context.p.newEmail;
  
  AFSISigninStatus get changeEmailStatus => context.p.changeEmailStatus;
  String get changeEmailStatusMessage => context.p.changeEmailStatusMessage;
  AFSISigninStatus get changePasswordStatus => context.p.changePasswordStatus;
  String get changePasswordStatusMessage => context.p.changePasswordStatusMessage;
  //!af_spi_resolve_methods
  
  void onChangedCurrentPasswordForPassword(String value) {
    context.updateTextField(AFSIWidgetID.editCurrentPassword, value);
    final revised = context.p.reviseCurrentPasswordForPassword(value);
    context.updateRouteParam(revised);
  }
  
  void onChangedNewPassword(String value) {
    context.updateTextField(AFSIWidgetID.editNewPassword, value);
    final revised = context.p.reviseNewPassword(value);
    context.updateRouteParam(revised);
  }
  
  void onChangedNewPasswordConfirm(String value) {
    context.updateTextField(AFSIWidgetID.editNewPasswordConfirm, value);
    final revised = context.p.reviseNewPasswordConfirm(value);
    context.updateRouteParam(revised);
  }
  
  void onChangedCurrentPasswordForEmail(String value) {
    final revised = context.p.reviseCurrentPasswordForEmail(value);
    context.updateRouteParam(revised);
  }
  
  void onChangedNewEmail(String value) {
    final revised = context.p.reviseNewEmail(value);
    context.updateRouteParam(revised);
  }

  void onPressedStartDeleteAccount() {
    // navigate to the default delete page, which is where the user actually does the deletion.
    context.navigatePush(StartDeleteAccountScreen.navigatePush(confirmText: ""));
  }

  void onPressedChangePassword() {
    if(newPassword != newPasswordConfirm) {
      final revised = context.p.reviseChangePasswordStatus(AFSISigninStatus.error, "The new password does not match the confirmation password.");
      context.updateRouteParam(revised);
      return;
    }
    final revised = context.p.reviseChangePasswordStatus(AFSISigninStatus.loading, "Changing password...");
    context.updateRouteParam(revised);

    // validate the users signin
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onChangePassword(currentPasswordForPassword, newPassword);
  }

  void onPressedChangeEmail() {
    final revised = context.p.reviseChangeEmailStatus(AFSISigninStatus.loading, "Changing email...");
    context.updateRouteParam(revised);

    // validate the users signin
    final lpi = context.accessLPI<AFSISigninActionsLPI>(AFSILibraryProgrammingInterfaceID.signinActions);
    lpi.onChangeEmail(currentPasswordForEmail, newEmail);
  }


  //!af_spi_on_update_methods
  
  
}

class AccountSettingsScreen extends AFSIConnectedScreen<AccountSettingsScreenSPI, AFSIDefaultStateView, AccountSettingsScreenRouteParam> {
  static final config = AFSIDefaultScreenConfig<AccountSettingsScreenSPI, AccountSettingsScreenRouteParam> (
    spiCreator: AccountSettingsScreenSPI.create,
    
  );

  AccountSettingsScreen(): super(    screenId: AFSIScreenID.accountSettings, 
      config: config,);

  static AFNavigatePushAction navigatePush() {
    final textControllers = AFTextEditingControllers.createN({
      AFSIWidgetID.editCurrentPassword: "",
      AFSIWidgetID.editNewPassword: "",
      AFSIWidgetID.editNewPasswordConfirm: "",
      AFSIWidgetID.editCurrentPasswordForEmail: "",
      AFSIWidgetID.editNewEmail: "",
    });

    final flutterState =  AFFlutterRouteParamState(
      textControllers: textControllers,
    );

    return AFNavigatePushAction(
      launchParam: AccountSettingsScreenRouteParam.create(
          currentPasswordForPassword: "",
          newPassword: "",
          newPasswordConfirm: "",
          currentPasswordForEmail: "",
          newEmail: "",
          flutterState: flutterState,
          changeEmailStatus: AFSISigninStatus.ready,
          changeEmailStatusMessage: "",
          changePasswordStatus: AFSISigninStatus.ready,
          changePasswordStatusMessage: "",
        //!af_navigate_push_param_call
        
      )
    );
  }
    
  
  @override
  Widget buildWithSPI(AccountSettingsScreenSPI spi) {
        final t = spi.t;
        final body = _buildBody(spi);
        return t.childScaffold(
          spi: spi,
          body: body,
          appBar: AppBar(
            title: t.childText(text: AFSITranslationID.titleAccountSettings),
            leading: t.leadingButtonStandardBack(spi, screen: screenId),
            automaticallyImplyLeading: false,
          ),
        );
  }

  Widget _buildStretchedCard(AccountSettingsScreenSPI spi, List<Widget> rows) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: rows
      )
    );
  }

  Widget? _buildExtraInputs(AccountSettingsScreenSPI spi) {
    return spi.t.childExtraSectionsAccountSettings(parentParam: spi.context.p);
  }

  Widget _buildStatusMessage(AccountSettingsScreenSPI spi, AFSISigninStatus status, String message) { 
    final t = spi.t;
    return t.childStatusMessage(status, message,
      colorBackground: t.colorSurface,
      textTheme: t.styleOnCard,
    );
  }

  Widget _buildChangePasswordCard(AccountSettingsScreenSPI spi) {
    final t = spi.t;
    final rows = t.column();
    rows.add(t.childSectionTitle(AFSITranslationID.titleChangePasswordSection));
    rows.add(t.childMargin(
      margin: t.margin.standard,
      child: t.childTextField(
        screenId: screenId, 
        wid: AFSIWidgetID.editCurrentPassword,
        parentParam: spi.context.p, 
        obscureText: true,
        autocorrect: false,
        onChanged: spi.onChangedCurrentPasswordForPassword,
        expectedText: spi.currentPasswordForPassword,
        decoration: t.decorationTextInput(
          text: AFSIWidgetID.editCurrentPassword,
          colorForeground: t.colorOnSurface,
        ),    
      )
    ));

    rows.add(t.childMargin(
      margin: t.margin.standard,
      child: t.childTextField(
        screenId: screenId, 
        wid: AFSIWidgetID.editNewPassword,
        parentParam: spi.context.p, 
        onChanged: spi.onChangedNewPassword,
        obscureText: true,
        autocorrect: false,
        expectedText: spi.newPassword,
        decoration: t.decorationTextInput(
          text: AFSIWidgetID.editNewPassword,
          colorForeground: t.colorOnSurface,
        ),            
      )
    ));

    rows.add(t.childMarginStandard(
      child: t.childTextField(
        screenId: screenId, 
        wid: AFSIWidgetID.editNewPasswordConfirm,
        parentParam: spi.context.p, 
        obscureText: true,
        autocorrect: false,
        onChanged: spi.onChangedNewPasswordConfirm,
        expectedText: spi.newPasswordConfirm,
        decoration: t.decorationTextInput(
          text: AFSIWidgetID.editNewPasswordConfirm,
          colorForeground: t.colorOnSurface,
        ),    
      )
    ));

    rows.add(_buildStatusMessage(spi, spi.changePasswordStatus, spi.changePasswordStatusMessage));
    
    rows.add(t.childMarginStandard(
      child: t.childButtonPrimaryText(
        wid: AFSIWidgetID.buttonChangePassword,
        text: AFSIWidgetID.buttonChangePassword,
        onPressed: spi.onPressedChangePassword
      )
    ));

    return _buildStretchedCard(spi, rows);
  }


  Widget _buildChangeEmailCard(AccountSettingsScreenSPI spi) {
    final t = spi.t;
    final rows = t.column();

    rows.add(t.childSectionTitle(AFSITranslationID.titleChangeEmailSection));

    rows.add(t.childMargin(
      margin: t.margin.standard,
      child: t.childTextField(
        screenId: screenId, 
        wid: AFSIWidgetID.editCurrentPasswordForEmail,
        parentParam: spi.context.p, 
        obscureText: true,
        autocorrect: false,
        onChanged: spi.onChangedCurrentPasswordForEmail,
        expectedText: spi.currentPasswordForEmail,
        decoration: t.decorationTextInput(
          text: AFSIWidgetID.editCurrentPasswordForEmail,
          colorForeground: t.colorOnSurface,
        ),    
      )
    ));

    rows.add(t.childMarginStandard(
      child: t.childTextField(
        screenId: screenId, 
        wid: AFSIWidgetID.editNewEmail,
        parentParam: spi.context.p, 
        obscureText: false,
        autocorrect: false,
        onChanged: spi.onChangedNewEmail,
        expectedText: spi.newEmail,
        decoration: t.decorationTextInput(
          text: AFSIWidgetID.editNewEmail,
          colorForeground: t.colorOnSurface,
        ),    
      )
    ));

    rows.add(_buildStatusMessage(spi, spi.changeEmailStatus, spi.changeEmailStatusMessage));

    rows.add(t.childMarginStandard(
      child: t.childButtonPrimaryText(
        wid: AFSIWidgetID.buttonChangeEmail,
        text: AFSIWidgetID.buttonChangeEmail,
        onPressed: spi.onPressedChangeEmail
      )
    ));

    return _buildStretchedCard(spi, rows);

  }

  Widget _buildStartDeleteAccount(AccountSettingsScreenSPI spi) {
    final t = spi.t;
    final rows = t.column();
    rows.add(t.childSectionTitle(AFSITranslationID.titleStartDeleteAccount));
    rows.add(t.childMargin(
      margin: t.margin.standard,
      child: t.childButtonPrimaryText(
        wid: AFSIWidgetID.buttonStartDeleteAccount,
        text: AFSIWidgetID.buttonStartDeleteAccount, 
        onPressed: spi.onPressedStartDeleteAccount
      )
    ));

    return _buildStretchedCard(spi, rows);
  }


  Widget _buildBody(AccountSettingsScreenSPI spi) {
    final t = spi.t;
    final rows = t.column();
    
    final extra = _buildExtraInputs(spi);

    if(extra != null) {
      rows.add(extra);
    }
    rows.add(_buildChangePasswordCard(spi));
    rows.add(_buildChangeEmailCard(spi));
    rows.add(_buildStartDeleteAccount(spi));
    rows.add(t.childExtraScrollSpacer());
    return ListView(
      children: rows
    );
  }

  
}
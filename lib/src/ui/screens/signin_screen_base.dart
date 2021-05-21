//--------------------------------------------------------------------------------------
import 'package:afib/afib_flutter.dart';
import 'package:afib_signin/src/ui/afsi_connected_base.dart';
import 'package:flutter/material.dart';

enum AFSISigninStatus {
  loading,
  error,
  ready,  
  readyEmphasis,
}

abstract class SigninScreenBase<TData extends AFStateView, TRouteParam extends AFRouteParam> extends AFSIConnectedScreen<TData, TRouteParam> {
  SigninScreenBase(AFScreenID screenId): super(screenId);

  //--------------------------------------------------------------------------------------
  @override
  Widget buildWithContext(AFSIBuildContext<TData, TRouteParam> context) {
    return _buildScreen(context);
  }

  //--------------------------------------------------------------------------------------
  Widget _buildScreen(AFSIBuildContext<TData, TRouteParam>  context) {
    final t = context.t;
    var mainControls = buildMainControls(context);

    return context.t.childScaffold(
        context: context,
        drawer: t.drawerSignIn(context),
        bottomNavigationBar: t.bottomNavigationBarSignin(context),
        body: Container(
          decoration: t.decorationSigninBackground(),
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: t.maxWidthSigninControls),
                child: mainControls
              )
            )
          )
        )
    );
  }

  //--------------------------------------------------------------------------------------
  Widget buildMainControls(AFSIBuildContext<TData, TRouteParam>  context);
}


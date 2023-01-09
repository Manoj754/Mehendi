import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ForgottenpasswordWidget extends StatefulWidget {
  const ForgottenpasswordWidget({Key? key}) : super(key: key);

  @override
  _ForgottenpasswordWidgetState createState() =>
      _ForgottenpasswordWidgetState();
}

class _ForgottenpasswordWidgetState extends State<ForgottenpasswordWidget> {
  TextEditingController? emailAddressController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'forgottenpassword'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    emailAddressController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'forgottenpassword',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.075),
            child: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 50,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'FORGOTTENPASSWORD_arrow_back_rounded_ICN');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.pop();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'FORGOTTENPASSWORD_Text_6rold34n_ON_TAP');
                                logFirebaseEvent('Text_navigate_back');
                                context.pop();
                              },
                              child: Text(
                                'Back',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 2, 0, 0),
                      child: GradientText(
                        'Forgot Password',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Noto Sans',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                        colors: [
                          Color(0xFFCF0A0A),
                          FlutterFlowTheme.of(context).gray600
                        ],
                        gradientDirection: GradientDirection.rtl,
                        gradientType: GradientType.linear,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              toolbarHeight: MediaQuery.of(context).size.height * 0.075,
              elevation: 0,
            ),
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                          child: Text(
                            'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Color(0x4D101213),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      controller: emailAddressController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelStyle: FlutterFlowTheme.of(context).bodyText2,
                        hintText: 'Enter your email...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 0,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('FORGOTTENPASSWORD_Button-Login_ON_TAP');
                      logFirebaseEvent('Button-Login_auth');
                      if (emailAddressController!.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Email required!',
                            ),
                          ),
                        );
                        return;
                      }
                      await resetPassword(
                        email: emailAddressController!.text,
                        context: context,
                      );
                    },
                    text: 'Send Link',
                    options: FFButtonOptions(
                      width: 270,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryText,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Noto Sans',
                                color: Color(0xFFEEEEEE),
                              ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

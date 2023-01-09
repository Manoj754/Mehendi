import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginregisterpageWidget extends StatefulWidget {
  const LoginregisterpageWidget({Key? key}) : super(key: key);

  @override
  _LoginregisterpageWidgetState createState() =>
      _LoginregisterpageWidgetState();
}

class _LoginregisterpageWidgetState extends State<LoginregisterpageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'loginregisterpage'});
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'loginregisterpage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFF14181B),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).black600,
                        Color(0xFFCF0A0A),
                        Color(0xFFDC5F00),
                        Color(0xFFAA2288)
                      ],
                      stops: [0, 0.5, 0.7, 1],
                      begin: AlignmentDirectional(0.98, -1),
                      end: AlignmentDirectional(-0.98, 1),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, -0.31),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Container(
                      width: 350,
                      child: TextFormField(
                        controller: textController,
                        onChanged: (_) => EasyDebounce.debounce(
                          'textController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Email address',
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Noto Sans',
                                    color: Color(0xB1E0E3E7),
                                  ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Color(0x24FFFFFF),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          suffixIcon: textController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    textController?.clear();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    size: 15,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Noto Sans',
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 1,
                              fontWeight: FontWeight.normal,
                            ),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, -0.08),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'LOGINREGISTERPAGE_PAGE_GO_BTN_ON_TAP');
                        logFirebaseEvent('Button_navigate_to');

                        context.pushNamed(
                          'loginregisterpageCopy',
                          queryParams: {
                            'emailentered': serializeParam(
                              textController!.text,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Go',
                      icon: FaIcon(
                        FontAwesomeIcons.solidArrowAltCircleRight,
                        size: 16,
                      ),
                      options: FFButtonOptions(
                        width: 100,
                        height: 40,
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Noto Sans',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.5),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 5),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'LOGINREGISTERCONTINUE_WITH_FACEBOOK_BTN_');
                        logFirebaseEvent('Button_auth');
                        GoRouter.of(context).prepareAuthEvent();
                        final user = await signInWithFacebook(context);
                        if (user == null) {
                          return;
                        }

                        context.goNamedAuth('HomePage', mounted);
                      },
                      text: 'Continue with Facebook',
                      icon: FaIcon(
                        FontAwesomeIcons.facebook,
                        size: 16,
                      ),
                      options: FFButtonOptions(
                        width: 275,
                        height: 45,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Noto Sans',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.35),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'LOGINREGISTERCONTINUE_WITH_GOOGLE_BTN_ON');
                        logFirebaseEvent('Button_auth');
                        GoRouter.of(context).prepareAuthEvent();
                        final user = await signInWithGoogle(context);
                        if (user == null) {
                          return;
                        }

                        context.goNamedAuth('HomePage', mounted);
                      },
                      text: 'Continue with Google',
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 16,
                      ),
                      options: FFButtonOptions(
                        width: 275,
                        height: 45,
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Noto Sans',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, -0.77),
                  child: Image.asset(
                    'assets/images/Sweet.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ).animateOnPageLoad(
                      animationsMap['imageOnPageLoadAnimation']!),
                ),
                Align(
                  alignment: AlignmentDirectional(0, -0.47),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      'Welcome to Mehndy',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Noto Sans',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                    ).animateOnPageLoad(
                        animationsMap['textOnPageLoadAnimation']!),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.07, 0.83),
                  child: Text(
                    'By continuing, you agree to Mehndy\'s Terms & Service\nand acknowledge that you\'ve read our Privacy Policy.',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Noto Sans',
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

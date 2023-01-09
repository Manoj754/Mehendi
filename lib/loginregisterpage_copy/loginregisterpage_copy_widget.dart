import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginregisterpageCopyWidget extends StatefulWidget {
  const LoginregisterpageCopyWidget({
    Key? key,
    this.emailentered,
  }) : super(key: key);

  final String? emailentered;

  @override
  _LoginregisterpageCopyWidgetState createState() =>
      _LoginregisterpageCopyWidgetState();
}

class _LoginregisterpageCopyWidgetState
    extends State<LoginregisterpageCopyWidget> {
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController(text: widget.emailentered);
    passwordTextController = TextEditingController();
    passwordVisibility = false;
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'loginregisterpageCopy'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'loginpassword',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 50,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () async {
                logFirebaseEvent('LOGINREGISTERCOPY_arrow_back_rounded_ICN');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
            title: Text(
              'Log In',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Noto Sans',
                    color: Colors.white,
                    fontSize: 18,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, -0.47),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Container(
                      width: 325,
                      child: TextFormField(
                        controller: passwordTextController,
                        obscureText: !passwordVisibility,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                              color: Color(0xFFFF0000),
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFF0000),
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Color(0xFF14181B),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordVisibility = !passwordVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Color(0xFF757575),
                              size: 20,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Noto Sans',
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                            ),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.5, -0.19),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 15),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'LOGINREGISTERCOPY_SIGN_UP_BTN_ON_TAP');
                        logFirebaseEvent('Button_auth');
                        GoRouter.of(context).prepareAuthEvent();

                        final user = await createAccountWithEmail(
                          context,
                          emailTextController!.text,
                          passwordTextController!.text,
                        );
                        if (user == null) {
                          return;
                        }

                        final usersCreateData = createUsersRecordData(
                          email: widget.emailentered,
                        );
                        await UsersRecord.collection
                            .doc(user.uid)
                            .update(usersCreateData);

                        context.goNamedAuth('HomePage', mounted);
                      },
                      text: 'Sign Up',
                      options: FFButtonOptions(
                        width: 120,
                        height: 40,
                        color: Color(0xFFCF0A0A),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Noto Sans',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
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
                  alignment: AlignmentDirectional(0, 0.61),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'LOGINREGISTERCOPY_CONTINUE_WITH_FACEBOOK');
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
                  alignment: AlignmentDirectional(0, 0.37),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'LOGINREGISTERCOPY_CONTINUE_WITH_GOOGLE_B');
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
                        color: FlutterFlowTheme.of(context).textColor,
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
                  alignment: AlignmentDirectional(2.84, -0.39),
                  child: Image.asset(
                    'assets/images/Sweet.png',
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.01, -0.04),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'LOGINREGISTERCOPY_Text_k2w2shbe_ON_TAP');
                        logFirebaseEvent('Text_navigate_to');

                        context.pushNamed('forgottenpassword');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Noto Sans',
                              color: FlutterFlowTheme.of(context).grayIcon,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, -0.77),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                    child: Container(
                      width: 325,
                      child: TextFormField(
                        controller: emailTextController,
                        onChanged: (_) => EasyDebounce.debounce(
                          'emailTextController',
                          Duration(milliseconds: 2000),
                          () => setState(() {}),
                        ),
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: widget.emailentered,
                          hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                              color: Color(0xFFFF0000),
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedErrorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFF0000),
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Color(0xFF14181B),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          suffixIcon: emailTextController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    emailTextController?.clear();
                                    setState(() {});
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Color(0xFF757575),
                                    size: 20,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Noto Sans',
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                            ),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.5, -0.19),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 15),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('LOGINREGISTERCOPY_LOG_IN_BTN_ON_TAP');
                        logFirebaseEvent('Button_auth');
                        GoRouter.of(context).prepareAuthEvent();

                        final user = await signInWithEmail(
                          context,
                          emailTextController!.text,
                          passwordTextController!.text,
                        );
                        if (user == null) {
                          return;
                        }

                        context.goNamedAuth('HomePage', mounted);
                      },
                      text: 'Log In',
                      options: FFButtonOptions(
                        width: 120,
                        height: 40,
                        color: Color(0xFFCF0A0A),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Noto Sans',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
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
              ],
            ),
          ),
        ));
  }
}

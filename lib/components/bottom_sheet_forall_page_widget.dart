import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomSheetForallPageWidget extends StatefulWidget {
  const BottomSheetForallPageWidget({Key? key}) : super(key: key);

  @override
  _BottomSheetForallPageWidgetState createState() =>
      _BottomSheetForallPageWidgetState();
}

class _BottomSheetForallPageWidgetState
    extends State<BottomSheetForallPageWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_SHEET_FORALL_Row_rtfdcvie_ON_TAP');
                              logFirebaseEvent('Row_navigate_to');

                              context.pushNamed('EditProfile');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Icon(
                                    Icons.settings_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Settings',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Noto Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_SHEET_FORALL_Row_optmpwgc_ON_TAP');
                              logFirebaseEvent('Row_launch_u_r_l');
                              await launchURL('https://www.mehndy.in/support');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Icon(
                                    Icons.help_outline,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Help',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Noto Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_SHEET_FORALL_Row_i8yof3qr_ON_TAP');
                              logFirebaseEvent('Row_launch_u_r_l');
                              await launchURL(
                                  'https://www.mehndy.in/privacy-policy');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Icon(
                                    Icons.privacy_tip_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'BOTTOM_SHEET_FORALL_Text_7inmqoj1_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_launch_u_r_l');
                                            await launchURL('');
                                          },
                                          child: Text(
                                            'Privacy & Policy',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Noto Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_SHEET_FORALL_Row_qoq4d938_ON_TAP');
                              logFirebaseEvent('Row_launch_u_r_l');
                              await launchURL(
                                  'https://www.mehndy.in/about--us');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: FaIcon(
                                    FontAwesomeIcons.trademark,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 18,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'About Mehndy',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Noto Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'BOTTOM_SHEET_FORALL_Container_c4324yld_O');
                          logFirebaseEvent('Container_haptic_feedback');
                          HapticFeedback.lightImpact();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'BOTTOM_SHEET_FORALL_Row_xy7uthel_ON_TAP');
                                logFirebaseEvent('Row_launch_u_r_l');
                                await launchURL(
                                    'https://play.google.com/store/apps/details?id=com.flutterflow.mehndy');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 12),
                                    child: Icon(
                                      Icons.star,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 18,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Rate App',
                                            style: FlutterFlowTheme.of(context)
                                                .subtitle2
                                                .override(
                                                  fontFamily: 'Noto Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBtnText,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOTTOM_SHEET_FORALL_Row_y8sv9jkz_ON_TAP');
                              logFirebaseEvent('Row_auth');
                              GoRouter.of(context).prepareAuthEvent();
                              await signOut();

                              context.goNamedAuth('loginregisterpage', mounted);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: Icon(
                                    Icons.logout,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 24,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Signout',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Noto Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

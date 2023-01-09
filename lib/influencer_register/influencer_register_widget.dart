import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bottom_sheet_forall_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class InfluencerRegisterWidget extends StatefulWidget {
  const InfluencerRegisterWidget({Key? key}) : super(key: key);

  @override
  _InfluencerRegisterWidgetState createState() =>
      _InfluencerRegisterWidgetState();
}

class _InfluencerRegisterWidgetState extends State<InfluencerRegisterWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  bool? switchListTileValue;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'InfluencerRegister'});
    textController1 = TextEditingController(text: currentUserDisplayName);
    textController2 = TextEditingController(text: currentUserEmail);
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'InfluencerRegister',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
            child: AppBar(
              backgroundColor: Color(0xFFCF0A0A),
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, -1),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.black, Color(0xFFCF0A0A)],
                              stops: [0, 1],
                              begin: AlignmentDirectional(0, -1),
                              end: AlignmentDirectional(0, 1),
                            ),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Container(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-0.93, 1),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'INFLUENCER_REGISTER_Image_vzw6724f_ON_TA');
                                        logFirebaseEvent('Image_navigate_to');

                                        context.pushNamed('HomePage');
                                      },
                                      child: Image.asset(
                                        'assets/images/Add_a_heading_(2).png',
                                        width: 110,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.93, 1),
                                    child: InkWell(
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'INFLUENCER_REGISTER_Icon_l5hhow38_ON_TAP');
                                        logFirebaseEvent('Icon_bottom_sheet');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.3,
                                                child:
                                                    BottomSheetForallPageWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Icon(
                                        Icons.menu,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        size: 25,
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
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              toolbarHeight: MediaQuery.of(context).size.height * 0.07,
              elevation: 5,
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 10),
                        child: GradientText(
                          'Influencer Register',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Noto Sans',
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                          colors: [Color(0xFFBF1F0B), Color(0xFFDC5F00)],
                          gradientDirection: GradientDirection.rtl,
                          gradientType: GradientType.linear,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 15),
                      child: Image.asset(
                        'assets/images/cold,_smooth_&_tasty._(1640__700_px).png',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                        child: Text(
                          'Partner with Mehndy for more YouTube Views & Subscribers (Get your content featured on our App/ YT Channel). Signup to Boost your Social Media Presence now!',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                                child: AuthUserStreamWidget(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: TextFormField(
                                      controller: textController1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: currentUserDisplayName,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFCF0A0A),
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFCF0A0A),
                                            width: 0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        filled: true,
                                        fillColor: Color(0x7DE0E3E7),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Noto Sans',
                                            fontWeight: FontWeight.w500,
                                          ),
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return 'Field is required';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: TextFormField(
                                    controller: textController2,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: currentUserEmail,
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFCF0A0A),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFCF0A0A),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      filled: true,
                                      fillColor: Color(0x7DE0E3E7),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Field is required';
                                      }

                                      if (!RegExp(kTextValidatorEmailRegex)
                                          .hasMatch(val)) {
                                        return 'Enter Valid Email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: TextFormField(
                                    controller: textController3,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Youtube Handle',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Noto Sans',
                                            color: Color(0x8557636C),
                                            fontWeight: FontWeight.w500,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFCF0A0A),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFCF0A0A),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      filled: true,
                                      fillColor: Color(0x7DE0E3E7),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Field is required';
                                      }

                                      if (!RegExp(kTextValidatorUsernameRegex)
                                          .hasMatch(val)) {
                                        return 'Must start with a letter and can only contain letters, digits and - or _.';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 7),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: TextFormField(
                                    controller: textController4,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Youtube Channel Link',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Noto Sans',
                                            color: Color(0x8557636C),
                                            fontWeight: FontWeight.w500,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFCF0A0A),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFCF0A0A),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      filled: true,
                                      fillColor: Color(0x7DE0E3E7),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Field is required';
                                      }

                                      if (!RegExp(kTextValidatorWebsiteRegex)
                                          .hasMatch(val)) {
                                        return 'Enter Valid Youtube Link';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: TextFormField(
                                    controller: textController5,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      'textController5',
                                      Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Phone',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Noto Sans',
                                            color: Color(0x8557636C),
                                            fontWeight: FontWeight.w500,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFCF0A0A),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFCF0A0A),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      filled: true,
                                      fillColor: Color(0x7DE0E3E7),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w500,
                                        ),
                                    keyboardType: TextInputType.phone,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Field is required';
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 15, 0, 15),
                                child: SwitchListTile(
                                  value: switchListTileValue ??= false,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => switchListTileValue = newValue!);
                                    if (newValue!) {
                                      logFirebaseEvent(
                                          'INFLUENCER_REGISTER_SwitchListTile_kyw1f');
                                      logFirebaseEvent(
                                          'SwitchListTile_backend_call');

                                      final usersUpdateData =
                                          createUsersRecordData(
                                        isinfluencer: true,
                                        phoneNumber: textController5!.text,
                                        yThandle: textController3!.text,
                                        yTLink: textController4!.text,
                                      );
                                      await currentUserReference!
                                          .update(usersUpdateData);
                                      logFirebaseEvent(
                                          'SwitchListTile_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            content: Text(
                                                'Your application has been recieved! :D We will mail you back once your application is approved.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent(
                                          'INFLUENCER_REGISTER_SwitchListTile_kyw1f');
                                      logFirebaseEvent(
                                          'SwitchListTile_backend_call');

                                      final usersUpdateData = {
                                        'isinfluencer': FieldValue.delete(),
                                      };
                                      await currentUserReference!
                                          .update(usersUpdateData);
                                    }
                                  },
                                  title: Text(
                                    'Switch to Influencer',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: Colors.black,
                                        ),
                                  ),
                                  subtitle: Text(
                                    'Mehndy Partner Program',
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          fontSize: 14,
                                        ),
                                  ),
                                  tileColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  activeColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  activeTrackColor: Color(0xFFCF0A0A),
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              Text(
                                'By Registering, you agree to Mehndy\'s Partner T&C\'s',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 9,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

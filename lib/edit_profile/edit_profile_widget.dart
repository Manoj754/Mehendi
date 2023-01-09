import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  bool? switchValue1;
  TextEditingController? yourNameController;
  TextEditingController? emailAddressController;
  bool? switchValue2;
  bool? switchValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController(text: currentUserEmail);
    yourNameController = TextEditingController(text: currentUserDisplayName);
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'EditProfile'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    emailAddressController?.dispose();
    yourNameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'EditProfile',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
            child: AppBar(
              backgroundColor: Color(0xFFCF0A0A),
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Align(
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
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.93, 1),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.arrow_back,
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              size: 25,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'EDIT_PROFILE_PAGE_arrow_back_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_navigate_back');
                              context.pop();
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.55, 0.85),
                          child: Text(
                            'Settings',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Noto Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 20,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              toolbarHeight: MediaQuery.of(context).size.height * 0.08,
              elevation: 5,
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthUserStreamWidget(
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'EDIT_PROFILE_PAGE_imageBorder_ON_TAP');
                            logFirebaseEvent(
                                'imageBorder_upload_media_to_firebase');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              imageQuality: 30,
                              allowPhoto: true,
                              textColor: FlutterFlowTheme.of(context).grayIcon,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => isMediaUploading = true);
                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                isMediaUploading = false;
                              }
                              if (downloadUrls.length == selectedMedia.length) {
                                setState(
                                    () => uploadedFileUrl = downloadUrls.first);
                                showUploadMessage(context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload media');
                                return;
                              }
                            }

                            logFirebaseEvent('imageBorder_backend_call');

                            final usersUpdateData = createUsersRecordData(
                              profilepic: uploadedFileUrl,
                            );
                            await currentUserReference!.update(usersUpdateData);
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFDBE2E7),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  valueOrDefault(
                                      currentUserDocument?.profilepic, ''),
                                ),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Visibility(
                              visible: valueOrDefault(
                                          currentUserDocument?.profilepic,
                                          '') ==
                                      null ||
                                  valueOrDefault(
                                          currentUserDocument?.profilepic,
                                          '') ==
                                      '',
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  'Profile \nPicture',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Noto Sans',
                                        color: Color(0xB2101213),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (valueOrDefault<bool>(
                    currentUserDocument?.isinfluencer, false))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                    child: AuthUserStreamWidget(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Influencer',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Switch(
                            value: switchValue1 ??= true,
                            onChanged: (newValue) async {
                              setState(() => switchValue1 = newValue!);
                              if (newValue!) {
                                logFirebaseEvent(
                                    'EDIT_PROFILE_Switch_3bf91e92_ON_TOGGLE_O');
                                logFirebaseEvent('Switch_backend_call');

                                final usersUpdateData = createUsersRecordData(
                                  isinfluencer: true,
                                );
                                await currentUserReference!
                                    .update(usersUpdateData);
                              } else {
                                logFirebaseEvent(
                                    'EDIT_PROFILE_Switch_3bf91e92_ON_TOGGLE_O');
                                logFirebaseEvent('Switch_backend_call');

                                final usersUpdateData = {
                                  'isinfluencer': FieldValue.delete(),
                                };
                                await currentUserReference!
                                    .update(usersUpdateData);
                              }
                            },
                            activeColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            activeTrackColor: Color(0xFFCF0A0A),
                            inactiveTrackColor:
                                FlutterFlowTheme.of(context).grayIcon,
                            inactiveThumbColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                        ],
                      ),
                    ),
                  ),
                if (!valueOrDefault<bool>(
                    currentUserDocument?.isinfluencer, false))
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 20),
                    child: AuthUserStreamWidget(
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'EDIT_PROFILE_PAGE_Text_5mq310zr_ON_TAP');
                          logFirebaseEvent('Text_navigate_to');

                          context.pushNamed('InfluencerRegister');
                        },
                        child: GradientText(
                          'Switch to Influencer Account',
                          style: FlutterFlowTheme.of(context).bodyText1,
                          colors: [Color(0xFFCF0A0A), Color(0xFFDC5F00)],
                          gradientDirection: GradientDirection.ltr,
                          gradientType: GradientType.linear,
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                  child: AuthUserStreamWidget(
                    child: TextFormField(
                      controller: yourNameController,
                      onChanged: (_) => EasyDebounce.debounce(
                        'yourNameController',
                        Duration(milliseconds: 2000),
                        () => setState(() {}),
                      ),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: FlutterFlowTheme.of(context).bodyText2,
                        hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                            color: Color(0xFFFF0000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFFF0000),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        filled: true,
                        fillColor: Color(0x7DE0E3E7),
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                        suffixIcon: Icon(
                          Icons.check_circle,
                          color: Color(0xFF757575),
                          size: 15,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                  child: TextFormField(
                    controller: emailAddressController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'emailAddressController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: FlutterFlowTheme.of(context).bodyText2,
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                          color: Color(0xFFFF0000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFF0000),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Color(0x7DE0E3E7),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: Color(0xFF757575),
                        size: 15,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                      child: Text(
                        'Email Notifications',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Noto Sans',
                              fontSize: 15,
                            ),
                      ),
                    ),
                    Switch(
                      value: switchValue2 ??= true,
                      onChanged: (newValue) async {
                        setState(() => switchValue2 = newValue!);
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Color(0xFFCF0A0A),
                      inactiveTrackColor: FlutterFlowTheme.of(context).grayIcon,
                      inactiveThumbColor: Colors.black,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 50, 0),
                      child: Text(
                        'Push Notifications',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Noto Sans',
                              fontSize: 15,
                            ),
                      ),
                    ),
                    Switch(
                      value: switchValue3 ??= true,
                      onChanged: (newValue) async {
                        setState(() => switchValue3 = newValue!);
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Color(0xFFCF0A0A),
                      inactiveTrackColor: FlutterFlowTheme.of(context).grayIcon,
                      inactiveThumbColor: Colors.black,
                    ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.05),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Save Changes',
                      options: FFButtonOptions(
                        width: 200,
                        height: 50,
                        color: Colors.black,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Noto Sans',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(50),
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

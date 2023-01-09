import 'dart:developer';

import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bottom_sheet_forall_page_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    Key? key,
    this.picquery,
    this.vidquery,
    this.relatedpicsquery,
    this.picsrecieve,
    this.relatedtagquery,
    this.namequery,
    this.stagviewpicisclicked,
    this.tagslistqueryonestring,
    this.buttontext,
    this.slidebuttonmenuisclicked,
    this.svimageisclicked,
  }) : super(key: key);

  final String? picquery;
  final String? vidquery;
  final DocumentReference? relatedpicsquery;
  final DocumentReference? picsrecieve;
  final DocumentReference? relatedtagquery;
  final String? namequery;
  final bool? stagviewpicisclicked;
  final String? tagslistqueryonestring;
  final String? buttontext;
  final bool? slidebuttonmenuisclicked;
  final bool? svimageisclicked;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0, 0),
          end: Offset(0, 0),
        ),
      ],
    ),
  };
  Completer<List<MehndiImagesRecord>>? _algoliaRequestCompleter;
  ScrollController? buttonsearchresults;
  Completer<List<MehndiImagesRecord>>? _firestoreRequestCompleter;
  ScrollController? morelikethisanddefaultSV;
  ScrollController? columnController;
  ScrollController? rowController1;
  ScrollController? rowController2;
  ScrollController? rowController3;
  String _currentPageLink = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int limit = 10;
  bool scrollstop = false;
  bool isloading = false;

  @override
  void initState() {
    super.initState();

    buttonsearchresults = ScrollController();
    columnController = ScrollController();
    rowController1 = ScrollController();
    rowController2 = ScrollController();
    rowController3 = ScrollController();
    morelikethisanddefaultSV = ScrollController();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'HomePage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  void _scrollListener() {
    setState(() {
      isloading = true;
      limit = limit + 10;
    });
    // log("sdshshdsds" + scrollstop.toString());

    Timer(Duration(milliseconds: 200), () {
      setState(() {
        isloading = false;
      });
    });
    // setState(() {
    //   isloading = false;
    // });
  }

  void _scrollstop() {}

  @override
  void dispose() {
    buttonsearchresults?.dispose();
    columnController?.dispose();
    rowController1?.dispose();
    rowController2?.dispose();
    rowController3?.dispose();
    morelikethisanddefaultSV?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<MehndiImagesRecord>>(
      stream: queryMehndiImagesRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: Color(0x5C090F13),
              ),
            ),
          );
        }
        List<MehndiImagesRecord> homePageMehndiImagesRecordList =
            snapshot.data!;
        return Title(
            title: 'HomePage',
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
                    title: Stack(
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
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.93, 1),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'HOME_PAGE_PAGE_Image_fhonapra_ON_TAP');
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
                                          'HOME_PAGE_PAGE_Icon_fave28tx_ON_TAP');
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
                                                  0.35,
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
                      ],
                    ),
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                  ),
                  toolbarHeight: MediaQuery.of(context).size.height * 0.08,
                  elevation: 5,
                ),
              ),
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: [
                    LazyLoadScrollView(
                      onEndOfPage: scrollstop ? _scrollstop : _scrollListener,
                      child: SingleChildScrollView(
                        controller: columnController,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            if (widget.slidebuttonmenuisclicked != null)
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    controller: rowController1,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 0, 0, 0),
                                          child: AutoSizeText(
                                            widget.buttontext!,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          buttonSize: 40,
                                          icon: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .grayIcon,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'HOME_PAGE_PAGE_clear_ICN_ON_TAP');
                                            logFirebaseEvent(
                                                'IconButton_navigate_to');

                                            context.pushNamed('HomePage');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            if (widget.slidebuttonmenuisclicked == null)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: StreamBuilder<List<MehnditypesRecord>>(
                                  stream: queryMehnditypesRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            color: Color(0x5C090F13),
                                          ),
                                        ),
                                      );
                                    }
                                    List<MehnditypesRecord>
                                        rowMehnditypesRecordList =
                                        snapshot.data!;
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: rowController2,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: List.generate(
                                            rowMehnditypesRecordList.length,
                                            (rowIndex) {
                                          final rowMehnditypesRecord =
                                              rowMehnditypesRecordList[
                                                  rowIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 4, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'HOME_PAGE_PAGE_FRONTHAND_BTN_ON_TAP');
                                                logFirebaseEvent(
                                                    'Button_navigate_to');

                                                context.pushNamed(
                                                  'HomePage',
                                                  queryParams: {
                                                    'slidebuttonmenuisclicked':
                                                        serializeParam(
                                                      true,
                                                      ParamType.bool,
                                                    ),
                                                    'buttontext':
                                                        serializeParam(
                                                      rowMehnditypesRecord
                                                          .nameoftype,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              text: rowMehnditypesRecord
                                                  .nameoftype!,
                                              options: FFButtonOptions(
                                                height: 40,
                                                color: Colors.black,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          color: Colors.white,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  width: 0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (widget.svimageisclicked == true)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: StreamBuilder<List<MehndiImagesRecord>>(
                                  stream: queryMehndiImagesRecord(
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: CircularProgressIndicator(
                                            color: Color(0x5C090F13),
                                          ),
                                        ),
                                      );
                                    }
                                    List<MehndiImagesRecord>
                                        containerMehndiImagesRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final containerMehndiImagesRecord =
                                        containerMehndiImagesRecordList
                                                .isNotEmpty
                                            ? containerMehndiImagesRecordList
                                                .first
                                            : null;
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x33000000),
                                            offset: Offset(0, 0),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width: double.infinity,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.65,
                                                constraints: BoxConstraints(
                                                  maxWidth:
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width,
                                                  maxHeight: double.infinity,
                                                ),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image:
                                                        CachedNetworkImageProvider(
                                                      widget.picquery!,
                                                    ),
                                                  ),
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.transparent,
                                                      Color(0x77000000)
                                                    ],
                                                    stops: [0, 1],
                                                    begin: AlignmentDirectional(
                                                        0, -1),
                                                    end: AlignmentDirectional(
                                                        0, 1),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.9, 0.65),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'HOME_PAGE_PAGE_Icon_jjkess21_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_backend_call');

                                                                    final usersUpdateData =
                                                                        {
                                                                      'savedimages':
                                                                          FieldValue
                                                                              .arrayUnion([
                                                                        widget
                                                                            .picquery
                                                                      ]),
                                                                    };
                                                                    await currentUserReference!
                                                                        .update(
                                                                            usersUpdateData);
                                                                    logFirebaseEvent(
                                                                        'Icon_update_local_state');
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .heartisclicked =
                                                                          true;
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'Icon_show_snack_bar');
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Saved to Your Collection!',
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Noto Sans',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontSize:
                                                                                20,
                                                                            height:
                                                                                1.5,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 2000),
                                                                        backgroundColor:
                                                                            Colors.black,
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .bookmarks,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    size: 30,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.9, 0.6),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_PAGE_PAGE_Icon_9zxg7q47_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Icon_generate_current_page_link');
                                                                      _currentPageLink =
                                                                          await generateCurrentPageLink(
                                                                        context,
                                                                        title: containerMehndiImagesRecord!
                                                                            .name,
                                                                        imageUrl:
                                                                            widget.picquery,
                                                                        description:
                                                                            containerMehndiImagesRecord.tagslist,
                                                                        isShortLink:
                                                                            false,
                                                                      );

                                                                      logFirebaseEvent(
                                                                          'Icon_share');
                                                                      await Share
                                                                          .share(
                                                                              _currentPageLink);
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .near_me_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      size: 25,
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (widget.vidquery !=
                                                                        null &&
                                                                    widget.vidquery !=
                                                                        '')
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            15,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'HOME_PAGE_PAGE_Icon_1375wtmc_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Icon_navigate_to');

                                                                        context
                                                                            .pushNamed(
                                                                          'newvideo',
                                                                          queryParams:
                                                                              {
                                                                            'vidquery':
                                                                                serializeParam(
                                                                              containerMehndiImagesRecord!.ytLinkNew,
                                                                              ParamType.String,
                                                                            ),
                                                                            'namequeryforvideo':
                                                                                serializeParam(
                                                                              containerMehndiImagesRecord.name,
                                                                              ParamType.String,
                                                                            ),
                                                                            'taglistforvideo':
                                                                                serializeParam(
                                                                              containerMehndiImagesRecord.tagslist,
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidPlayCircle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        size:
                                                                            22,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          15,
                                                                          0,
                                                                          0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .download_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    size: 30,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0.97),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.94,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.075,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          3,
                                                                          0,
                                                                          3),
                                                              child: Text(
                                                                widget
                                                                    .namequery!,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Noto Sans',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1, 1),
                                                              child: StreamBuilder<
                                                                  MehndiImagesRecord>(
                                                                stream: MehndiImagesRecord
                                                                    .getDocument(
                                                                        widget
                                                                            .relatedtagquery!),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              Color(0x5C090F13),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final rowMehndiImagesRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final tagsrecieved = rowMehndiImagesRecord
                                                                          .tags!
                                                                          .toList();
                                                                      return SingleChildScrollView(
                                                                        scrollDirection:
                                                                            Axis.horizontal,
                                                                        controller:
                                                                            rowController3,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: List.generate(
                                                                              tagsrecieved.length,
                                                                              (tagsrecievedIndex) {
                                                                            final tagsrecievedItem =
                                                                                tagsrecieved[tagsrecievedIndex];
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 3, 8, 3),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  logFirebaseEvent('HOME_PAGE_PAGE_BUTTON_BTN_ON_TAP');
                                                                                  logFirebaseEvent('Button_navigate_to');

                                                                                  context.pushNamed(
                                                                                    'HomePage',
                                                                                    queryParams: {
                                                                                      'slidebuttonmenuisclicked': serializeParam(
                                                                                        true,
                                                                                        ParamType.bool,
                                                                                      ),
                                                                                      'buttontext': serializeParam(
                                                                                        tagsrecievedItem,
                                                                                        ParamType.String,
                                                                                      ),
                                                                                    }.withoutNulls,
                                                                                  );
                                                                                },
                                                                                text: tagsrecievedItem,
                                                                                options: FFButtonOptions(
                                                                                  height: 30,
                                                                                  color: Color(0xB7FFFFFF),
                                                                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: 'Noto Sans',
                                                                                        color: Color(0xB2101213),
                                                                                        fontSize: 8,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                  elevation: 0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'containerOnPageLoadAnimation']!),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (widget.svimageisclicked == true)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Text(
                                  'More Like This',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            if (widget.slidebuttonmenuisclicked == null)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8, 12, 8, 12),
                                child: StreamBuilder<List<MehndiImagesRecord>>(
                                  stream: queryMehndiImagesRecord(
                                    limit: limit,
                                    queryBuilder: (mehndiImagesRecord) =>
                                        mehndiImagesRecord.orderBy('created_at',
                                            descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 150, 0, 0),
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: CircularProgressIndicator(
                                              color: Color(0x5C090F13),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<MehndiImagesRecord>
                                        morelikethisanddefaultSVMehndiImagesRecordList =
                                        snapshot.data!;
                                    if (morelikethisanddefaultSVMehndiImagesRecordList
                                        .isEmpty) {
                                      return Center(
                                        child: Image.asset(
                                          'assets/images/cold,_smooth_&_tasty._(1640__700_px)_(1).png',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                        ),
                                      );
                                    }
                                    return RefreshIndicator(
                                      onRefresh: () async {
                                        logFirebaseEvent(
                                            'HOME_morelikethisanddefaultSV_ON_PULL_TO');
                                        logFirebaseEvent(
                                            'morelikethisanddefaultSV_refresh_databas');
                                        setState(() =>
                                            _firestoreRequestCompleter = null);
                                        await waitForFirestoreRequestCompleter();
                                      },
                                      child: Column(
                                        children: [
                                          MasonryGridView.count(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 8,
                                            mainAxisSpacing: 8,
                                            itemCount:
                                                morelikethisanddefaultSVMehndiImagesRecordList
                                                    .length,
                                            shrinkWrap: true,
                                            itemBuilder: (context,
                                                morelikethisanddefaultSVIndex) {
                                              if (limit >
                                                  morelikethisanddefaultSVMehndiImagesRecordList
                                                          .length +
                                                      40) {
                                                scrollstop = true;
                                              }
                                              final morelikethisanddefaultSVMehndiImagesRecord =
                                                  morelikethisanddefaultSVMehndiImagesRecordList[
                                                      morelikethisanddefaultSVIndex];
                                              return InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'HOME_PAGE_PAGE_Image_6hkwd65a_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_navigate_to');

                                                  context.goNamed(
                                                    'HomePage',
                                                    queryParams: {
                                                      'picquery':
                                                          serializeParam(
                                                        morelikethisanddefaultSVMehndiImagesRecord
                                                            .pics,
                                                        ParamType.String,
                                                      ),
                                                      'vidquery':
                                                          serializeParam(
                                                        morelikethisanddefaultSVMehndiImagesRecord
                                                            .ytLinkNew,
                                                        ParamType.String,
                                                      ),
                                                      'picsrecieve':
                                                          serializeParam(
                                                        morelikethisanddefaultSVMehndiImagesRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'relatedtagquery':
                                                          serializeParam(
                                                        morelikethisanddefaultSVMehndiImagesRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'namequery':
                                                          serializeParam(
                                                        morelikethisanddefaultSVMehndiImagesRecord
                                                            .name,
                                                        ParamType.String,
                                                      ),
                                                      'stagviewpicisclicked':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                      'tagslistqueryonestring':
                                                          serializeParam(
                                                        morelikethisanddefaultSVMehndiImagesRecord
                                                            .tagslist,
                                                        ParamType.String,
                                                      ),
                                                      'svimageisclicked':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  logFirebaseEvent(
                                                      'Image_scroll_to');
                                                  await columnController
                                                      ?.animateTo(
                                                    0,
                                                    duration: Duration(
                                                        milliseconds: 10),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        morelikethisanddefaultSVMehndiImagesRecord
                                                            .pics!,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
                                            controller:
                                                morelikethisanddefaultSV,
                                          ),
                                          isloading
                                              ? Center(
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Color(0x5C090F13),
                                                    ),
                                                  ),
                                                )
                                              : SizedBox()
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (widget.slidebuttonmenuisclicked ?? true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8, 12, 8, 12),
                                child: FutureBuilder<List<MehndiImagesRecord>>(
                                  future: (_algoliaRequestCompleter ??=
                                          Completer<List<MehndiImagesRecord>>()
                                            ..complete(
                                                MehndiImagesRecord.search(
                                              term: widget.buttontext,
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 150, 0, 0),
                                          child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: CircularProgressIndicator(
                                              color: Color(0x5C090F13),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<MehndiImagesRecord>
                                        buttonsearchresultsMehndiImagesRecordList =
                                        snapshot.data!;
                                    if (buttonsearchresultsMehndiImagesRecordList
                                        .isEmpty) {
                                      return Center(
                                        child: Image.asset(
                                          'assets/images/cold,_smooth_&_tasty._(1640__700_px)_(1).png',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                        ),
                                      );
                                    }
                                    return RefreshIndicator(
                                      onRefresh: () async {
                                        logFirebaseEvent(
                                            'HOME_buttonsearchresults_ON_PULL_TO_REFR');
                                        logFirebaseEvent(
                                            'buttonsearchresults_refresh_database_req');
                                        setState(() =>
                                            _algoliaRequestCompleter = null);
                                        await waitForAlgoliaRequestCompleter();
                                      },
                                      child: MasonryGridView.count(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                        itemCount:
                                            buttonsearchresultsMehndiImagesRecordList
                                                .length,
                                        shrinkWrap: true,
                                        itemBuilder: (context,
                                            buttonsearchresultsIndex) {
                                          final buttonsearchresultsMehndiImagesRecord =
                                              buttonsearchresultsMehndiImagesRecordList[
                                                  buttonsearchresultsIndex];
                                          return StreamBuilder<
                                              List<MehndiImagesRecord>>(
                                            stream: queryMehndiImagesRecord(
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Color(0x5C090F13),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<MehndiImagesRecord>
                                                  imageMehndiImagesRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final imageMehndiImagesRecord =
                                                  imageMehndiImagesRecordList
                                                          .isNotEmpty
                                                      ? imageMehndiImagesRecordList
                                                          .first
                                                      : null;
                                              return InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'HOME_PAGE_PAGE_Image_hbf25pd1_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_navigate_to');

                                                  context.pushNamed(
                                                    'HomePage',
                                                    queryParams: {
                                                      'picquery':
                                                          serializeParam(
                                                        buttonsearchresultsMehndiImagesRecord
                                                            .pics,
                                                        ParamType.String,
                                                      ),
                                                      'vidquery':
                                                          serializeParam(
                                                        buttonsearchresultsMehndiImagesRecord
                                                            .ytLinkNew,
                                                        ParamType.String,
                                                      ),
                                                      'picsrecieve':
                                                          serializeParam(
                                                        buttonsearchresultsMehndiImagesRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'relatedtagquery':
                                                          serializeParam(
                                                        buttonsearchresultsMehndiImagesRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                      'namequery':
                                                          serializeParam(
                                                        buttonsearchresultsMehndiImagesRecord
                                                            .name,
                                                        ParamType.String,
                                                      ),
                                                      'stagviewpicisclicked':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                      'tagslistqueryonestring':
                                                          serializeParam(
                                                        buttonsearchresultsMehndiImagesRecord
                                                            .tagslist,
                                                        ParamType.String,
                                                      ),
                                                      'svimageisclicked':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  logFirebaseEvent(
                                                      'Image_scroll_to');
                                                  await columnController
                                                      ?.animateTo(
                                                    0,
                                                    duration: Duration(
                                                        milliseconds: 10),
                                                    curve: Curves.ease,
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        buttonsearchresultsMehndiImagesRecord
                                                            .pics!,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        controller: buttonsearchresults,
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  Future waitForAlgoliaRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _algoliaRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}

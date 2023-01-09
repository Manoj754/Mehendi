import 'dart:async';
import 'dart:developer';

import '../backend/backend.dart';
import '../components/bottom_sheet_forall_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class NewvideoWidget extends StatefulWidget {
  const NewvideoWidget({
    Key? key,
    this.vidquery,
    this.namequeryforvideo,
    this.taglistforvideo,
    this.thumbnailquery,
  }) : super(key: key);

  final String? vidquery;
  final String? namequeryforvideo;
  final String? taglistforvideo;
  final String? thumbnailquery;

  @override
  _NewvideoWidgetState createState() => _NewvideoWidgetState();
}

class _NewvideoWidgetState extends State<NewvideoWidget> {
  int limit = 10;
  bool scrollstop = false;
  bool isloading = false;
  String _currentPageLink = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'newvideo'});
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
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return YoutubeFullScreenWrapper(
      child: Title(
          title: 'newvideo',
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
                                        'NEWVIDEO_PAGE_Image_gzcahbky_ON_TAP');
                                    logFirebaseEvent('Image_navigate_to');

                                    context.pushNamed('HomePage');
                                  },
                                  child: Image.asset(
                                    'assets/images/Add_a_heading_(2).png',
                                    width: 110,
                                    height: MediaQuery.of(context).size.height *
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
                                        'NEWVIDEO_PAGE_Icon_r27rki5t_ON_TAP');
                                    logFirebaseEvent('Icon_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
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
            body: LazyLoadScrollView(
              onEndOfPage: scrollstop ? _scrollstop : _scrollListener,
              child: SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.vidquery != null &&
                                widget.vidquery != '')
                              StreamBuilder<List<MehndiImagesRecord>>(
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
                                      containerMehndiImagesRecordList.isNotEmpty
                                          ? containerMehndiImagesRecordList
                                              .first
                                          : null;
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.38,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 0,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        FlutterFlowYoutubePlayer(
                                          url: widget.vidquery!,
                                          autoPlay: false,
                                          looping: true,
                                          mute: false,
                                          showControls: false,
                                          showFullScreen: true,
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.77, 0.93),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 40, 5, 3),
                                                  child: Text(
                                                    widget.taglistforvideo!,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 12,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 3, 5, 0),
                                                  child: Text(
                                                    widget.namequeryforvideo!,
                                                    maxLines: 2,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Noto Sans',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .black600,
                                                          fontSize: 12,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.88, 0.7),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'NEWVIDEO_PAGE_Icon_99nmsf2k_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_generate_current_page_link');
                                              _currentPageLink =
                                                  await generateCurrentPageLink(
                                                context,
                                                isShortLink: false,
                                              );

                                              logFirebaseEvent('Icon_share');
                                              await Share.share(
                                                  _currentPageLink);
                                            },
                                            child: Icon(
                                              Icons.near_me_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .black600,
                                              size: 26,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            if (widget.vidquery != null &&
                                widget.vidquery != '')
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text(
                                  'Similar',
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                          ],
                        ),
                        if (widget.vidquery != null && widget.vidquery != '')
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: FutureBuilder<List<MehndiImagesRecord>>(
                              future: MehndiImagesRecord.search(
                                term: widget.taglistforvideo,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                    columnMehndiImagesRecordList =
                                    snapshot.data!;
                                // Customize what your widget looks like with no search results.
                                if (snapshot.data!.isEmpty) {
                                  return Container(
                                    height: 100,
                                    child: Center(
                                      child: Text('No results.'),
                                    ),
                                  );
                                }
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        columnMehndiImagesRecordList.length,
                                        (columnIndex) {
                                      final columnMehndiImagesRecord =
                                          columnMehndiImagesRecordList[
                                              columnIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 12, 16, 12),
                                        child: Container(
                                          width: double.infinity,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x230E151B),
                                                offset: Offset(0, 2),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'NEWVIDEO_PAGE_Stack_qxwsej4e_ON_TAP');
                                              logFirebaseEvent(
                                                  'Stack_navigate_to');

                                              context.pushNamed(
                                                'newvideo',
                                                queryParams: {
                                                  'vidquery': serializeParam(
                                                    columnMehndiImagesRecord
                                                        .ytLinkNew,
                                                    ParamType.String,
                                                  ),
                                                  'namequeryforvideo':
                                                      serializeParam(
                                                    columnMehndiImagesRecord
                                                        .name,
                                                    ParamType.String,
                                                  ),
                                                  'taglistforvideo':
                                                      serializeParam(
                                                    columnMehndiImagesRecord
                                                        .tagslist,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(12),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(0),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        widget.thumbnailquery!,
                                                    width: 120,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.9, 0.85),
                                                  child: Container(
                                                    width: 32,
                                                    height: 32,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4,
                                                          color:
                                                              Color(0x230E151B),
                                                          offset: Offset(0, 2),
                                                        )
                                                      ],
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.play_arrow_rounded,
                                                      color: Color(0xFF101213),
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(130, 5, 12, 5),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 0, 5),
                                                        child: Text(
                                                          columnMehndiImagesRecord
                                                              .name!,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF101213),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 4),
                                                        child: Text(
                                                          columnMehndiImagesRecord
                                                              .tagslist!,
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF57636C),
                                                                fontSize: 8,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            ),
                          ),
                        if (widget.vidquery == null || widget.vidquery == '')
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                    columnMehndiImagesRecordList =
                                    snapshot.data!;

                                return SingleChildScrollView(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              columnMehndiImagesRecordList
                                                  .length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            final columnMehndiImagesRecord =
                                                columnMehndiImagesRecordList[
                                                    index];
                                            // log("bdhjssdds+" +
                                            //     limit.toString());
                                            // log("bdhjssdds+===" +
                                            //     columnMehndiImagesRecordList
                                            //         .length
                                            //         .toString());
                                            if (limit >
                                                columnMehndiImagesRecordList
                                                        .length +
                                                    40) {
                                              scrollstop = true;
                                            }
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(16, 12, 16, 12),
                                              child: Container(
                                                width: double.infinity,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x230E151B),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'NEWVIDEO_PAGE_Stack_ius2fwfv_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Stack_navigate_to');

                                                    context.pushNamed(
                                                      'newvideo',
                                                      queryParams: {
                                                        'vidquery':
                                                            serializeParam(
                                                          columnMehndiImagesRecord
                                                              .ytLinkNew,
                                                          ParamType.String,
                                                        ),
                                                        'namequeryforvideo':
                                                            serializeParam(
                                                          columnMehndiImagesRecord
                                                              .name,
                                                          ParamType.String,
                                                        ),
                                                        'taglistforvideo':
                                                            serializeParam(
                                                          columnMehndiImagesRecord
                                                              .tagslist,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  12),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                          topRight:
                                                              Radius.circular(
                                                                  0),
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              columnMehndiImagesRecord
                                                                  .pics!,
                                                          width: 120,
                                                          height: 100,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.9, 0.85),
                                                        child: Container(
                                                          width: 32,
                                                          height: 32,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Color(
                                                                    0x230E151B),
                                                                offset: Offset(
                                                                    0, 2),
                                                              )
                                                            ],
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .play_arrow_rounded,
                                                            color: Color(
                                                                0xFF101213),
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(130,
                                                                    5, 12, 5),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              columnMehndiImagesRecord
                                                                  .name!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          4),
                                                              child:
                                                                  AutoSizeText(
                                                                columnMehndiImagesRecord
                                                                    .tagslist!,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          8,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
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
                                      ]

                                      //  List.generate(
                                      //     columnMehndiImagesRecordList.length,
                                      //     (columnIndex) {
                                      //   final columnMehndiImagesRecord =
                                      //       columnMehndiImagesRecordList[
                                      //           columnIndex];
                                      //   return Padding(
                                      //     padding: EdgeInsetsDirectional.fromSTEB(
                                      //         16, 12, 16, 12),
                                      //     child: Container(
                                      //       width: double.infinity,
                                      //       height: 100,
                                      //       decoration: BoxDecoration(
                                      //         color: Colors.white,
                                      //         boxShadow: [
                                      //           BoxShadow(
                                      //             blurRadius: 4,
                                      //             color: Color(0x230E151B),
                                      //             offset: Offset(0, 2),
                                      //           )
                                      //         ],
                                      //         borderRadius:
                                      //             BorderRadius.circular(12),
                                      //       ),
                                      //       child: InkWell(
                                      //         onTap: () async {
                                      //           logFirebaseEvent(
                                      //               'NEWVIDEO_PAGE_Stack_ius2fwfv_ON_TAP');
                                      //           logFirebaseEvent(
                                      //               'Stack_navigate_to');

                                      //           context.pushNamed(
                                      //             'newvideo',
                                      //             queryParams: {
                                      //               'vidquery': serializeParam(
                                      //                 columnMehndiImagesRecord
                                      //                     .ytLinkNew,
                                      //                 ParamType.String,
                                      //               ),
                                      //               'namequeryforvideo':
                                      //                   serializeParam(
                                      //                 columnMehndiImagesRecord.name,
                                      //                 ParamType.String,
                                      //               ),
                                      //               'taglistforvideo':
                                      //                   serializeParam(
                                      //                 columnMehndiImagesRecord
                                      //                     .tagslist,
                                      //                 ParamType.String,
                                      //               ),
                                      //             }.withoutNulls,
                                      //           );
                                      //         },
                                      //         child: Stack(
                                      //           children: [
                                      //             ClipRRect(
                                      //               borderRadius: BorderRadius.only(
                                      //                 bottomLeft:
                                      //                     Radius.circular(12),
                                      //                 bottomRight:
                                      //                     Radius.circular(0),
                                      //                 topLeft: Radius.circular(12),
                                      //                 topRight: Radius.circular(0),
                                      //               ),
                                      //               child: CachedNetworkImage(
                                      //                 imageUrl:
                                      //                     columnMehndiImagesRecord
                                      //                         .pics!,
                                      //                 width: 120,
                                      //                 height: 100,
                                      //                 fit: BoxFit.cover,
                                      //               ),
                                      //             ),
                                      //             Align(
                                      //               alignment: AlignmentDirectional(
                                      //                   -0.9, 0.85),
                                      //               child: Container(
                                      //                 width: 32,
                                      //                 height: 32,
                                      //                 decoration: BoxDecoration(
                                      //                   color: Colors.white,
                                      //                   boxShadow: [
                                      //                     BoxShadow(
                                      //                       blurRadius: 4,
                                      //                       color:
                                      //                           Color(0x230E151B),
                                      //                       offset: Offset(0, 2),
                                      //                     )
                                      //                   ],
                                      //                   shape: BoxShape.circle,
                                      //                 ),
                                      //                 child: Icon(
                                      //                   Icons.play_arrow_rounded,
                                      //                   color: Color(0xFF101213),
                                      //                   size: 20,
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //             Padding(
                                      //               padding: EdgeInsetsDirectional
                                      //                   .fromSTEB(130, 5, 12, 5),
                                      //               child: Column(
                                      //                 mainAxisSize:
                                      //                     MainAxisSize.max,
                                      //                 mainAxisAlignment:
                                      //                     MainAxisAlignment.start,
                                      //                 crossAxisAlignment:
                                      //                     CrossAxisAlignment.center,
                                      //                 children: [
                                      //                   Text(
                                      //                     columnMehndiImagesRecord
                                      //                         .name!,
                                      //                     style: FlutterFlowTheme
                                      //                             .of(context)
                                      //                         .subtitle1
                                      //                         .override(
                                      //                           fontFamily:
                                      //                               'Outfit',
                                      //                           color: Color(
                                      //                               0xFF101213),
                                      //                           fontSize: 12,
                                      //                           fontWeight:
                                      //                               FontWeight.w500,
                                      //                         ),
                                      //                   ),
                                      //                   Padding(
                                      //                     padding:
                                      //                         EdgeInsetsDirectional
                                      //                             .fromSTEB(
                                      //                                 0, 4, 0, 4),
                                      //                     child: AutoSizeText(
                                      //                       columnMehndiImagesRecord
                                      //                           .tagslist!,
                                      //                       maxLines: 2,
                                      //                       style:
                                      //                           FlutterFlowTheme.of(
                                      //                                   context)
                                      //                               .bodyText2
                                      //                               .override(
                                      //                                 fontFamily:
                                      //                                     'Outfit',
                                      //                                 color: Color(
                                      //                                     0xFF57636C),
                                      //                                 fontSize: 8,
                                      //                                 fontWeight:
                                      //                                     FontWeight
                                      //                                         .normal,
                                      //                               ),
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   );

                                      // }),

                                      ),
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

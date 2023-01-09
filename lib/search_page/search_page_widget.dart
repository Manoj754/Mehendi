import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({Key? key}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SearchPage'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        List<MehndiImagesRecord> searchPageMehndiImagesRecordList =
            snapshot.data!;
        return Title(
            title: 'SearchPage',
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
                                          'SEARCH_PAGE_PAGE_Image_yb7fgeg6_ON_TAP');
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
                                  alignment: AlignmentDirectional(0.9, 0.93),
                                  child: InkWell(
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SEARCH_PAGE_PAGE_Icon_f84ymyfp_ON_TAP');
                                      logFirebaseEvent('Icon_navigate_to');

                                      context.pushNamed(
                                        'searchresultspage',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    child: Icon(
                                      Icons.search,
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 2, 0, 0),
                                  child: GradientText(
                                    'Occasions',
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          color: Color(0x00090F13),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    colors: [
                                      Color(0xFFBF1F0B),
                                      Color(0xFFDC5F00)
                                    ],
                                    gradientDirection: GradientDirection.rtl,
                                    gradientType: GradientType.linear,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 5),
                                  child: Text(
                                    'Make your day special by picking from the best',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xD1000000),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6, 12, 6, 12),
                                        child: Container(
                                          width: 270,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'SEARCH_PAGE_PAGE_Image_2izc8th1_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_navigate_to');

                                                  context.pushNamed(
                                                    'HomePage',
                                                    queryParams: {
                                                      'buttontext':
                                                          serializeParam(
                                                        'engagement',
                                                        ParamType.String,
                                                      ),
                                                      'slidebuttonmenuisclicked':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(100),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/0e1b5bdecf60205be21ea434b22c2c7d.jpg',
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    fit: BoxFit.none,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.92, -0.85),
                                                child: FlutterFlowIconButton(
                                                  borderColor: Colors.black,
                                                  borderRadius: 100,
                                                  buttonSize: 44,
                                                  fillColor: Colors.black,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .arrowCircleRight,
                                                    color: Color(0xFFEEEEEE),
                                                    size: 24,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.8, 0.45),
                                                child: Text(
                                                  'Engagement',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 28,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.9, 0.75),
                                                child: Text(
                                                  '(1k+ Designs)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Noto Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6, 12, 6, 12),
                                        child: Container(
                                          width: 270,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'SEARCH_PAGE_PAGE_Image_9fvn06v0_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_navigate_to');

                                                  context.pushNamed(
                                                    'HomePage',
                                                    queryParams: {
                                                      'buttontext':
                                                          serializeParam(
                                                        'wedding',
                                                        ParamType.String,
                                                      ),
                                                      'slidebuttonmenuisclicked':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(100),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/Anokhi-Blog1.jpg',
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.92, -0.85),
                                                child: FlutterFlowIconButton(
                                                  borderColor: Colors.black,
                                                  borderRadius: 100,
                                                  buttonSize: 44,
                                                  fillColor: Colors.black,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .arrowCircleRight,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    size: 24,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.8, 0.45),
                                                child: Text(
                                                  'Wedding',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 28,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.8, 0.75),
                                                child: Text(
                                                  '(1k+ Designs)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Noto Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6, 12, 6, 12),
                                        child: Container(
                                          width: 270,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'SEARCH_PAGE_PAGE_Image_8s4n9099_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_navigate_to');

                                                  context.pushNamed(
                                                    'HomePage',
                                                    queryParams: {
                                                      'buttontext':
                                                          serializeParam(
                                                        'karwa',
                                                        ParamType.String,
                                                      ),
                                                      'slidebuttonmenuisclicked':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(100),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/13_29_580104610hayat.jpg',
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.92, -0.85),
                                                child: FlutterFlowIconButton(
                                                  borderColor: Colors.black,
                                                  borderRadius: 100,
                                                  buttonSize: 44,
                                                  fillColor: Colors.black,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .arrowCircleRight,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    size: 24,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.8, 0.45),
                                                child: Text(
                                                  'Karwachauth',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 28,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.8, 0.75),
                                                child: Text(
                                                  '(1k+ Designs)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Noto Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6, 12, 6, 12),
                                        child: Container(
                                          width: 270,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'SEARCH_PAGE_PAGE_Image_ts80oka1_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Image_navigate_to');

                                                  context.pushNamed(
                                                    'HomePage',
                                                    queryParams: {
                                                      'buttontext':
                                                          serializeParam(
                                                        'teej',
                                                        ParamType.String,
                                                      ),
                                                      'slidebuttonmenuisclicked':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(100),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/Hartalika-Teej-2018-Latest-and-Easy-Mehndi-Design-Photos-2.webp',
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.92, -0.85),
                                                child: FlutterFlowIconButton(
                                                  borderColor: Colors.black,
                                                  borderRadius: 100,
                                                  buttonSize: 44,
                                                  fillColor: Colors.black,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons
                                                        .arrowCircleRight,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                    size: 24,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'IconButton pressed ...');
                                                  },
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.8, 0.45),
                                                child: Text(
                                                  'Teej',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        fontSize: 28,
                                                      ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.8, 0.75),
                                                child: Text(
                                                  '(1k+ Designs)',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Noto Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.03,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, -0.05),
                            child: AutoSizeText(
                              'Ideas for you',
                              textAlign: TextAlign.center,
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Noto Sans',
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.94,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 15),
                          child: GridView(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SEARCH_PAGE_PAGE_Image_183b7ea4_ON_TAP');
                                  logFirebaseEvent('Image_navigate_to');

                                  context.pushNamed(
                                    'HomePage',
                                    queryParams: {
                                      'buttontext': serializeParam(
                                        'mandala',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: SvgPicture.asset(
                                    'assets/images/8mdcf_8.svg',
                                    width: 100,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SEARCH_PAGE_PAGE_Image_p2ukf5av_ON_TAP');
                                  logFirebaseEvent('Image_navigate_to');

                                  context.pushNamed(
                                    'HomePage',
                                    queryParams: {
                                      'buttontext': serializeParam(
                                        'simple',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: SvgPicture.asset(
                                    'assets/images/qj7zq_9.svg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SEARCH_PAGE_PAGE_Image_ffx8djru_ON_TAP');
                                  logFirebaseEvent('Image_navigate_to');

                                  context.pushNamed(
                                    'HomePage',
                                    queryParams: {
                                      'buttontext': serializeParam(
                                        'bridal',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: SvgPicture.asset(
                                    'assets/images/10.svg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SEARCH_PAGE_PAGE_Image_bed0d7cp_ON_TAP');
                                  logFirebaseEvent('Image_navigate_to');

                                  context.pushNamed(
                                    'HomePage',
                                    queryParams: {
                                      'buttontext': serializeParam(
                                        'designer',
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: SvgPicture.asset(
                                    'assets/images/11.svg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
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
            ));
      },
    );
  }
}

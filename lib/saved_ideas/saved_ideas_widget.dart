import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/bottom_sheet_forall_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SavedIdeasWidget extends StatefulWidget {
  const SavedIdeasWidget({Key? key}) : super(key: key);

  @override
  _SavedIdeasWidgetState createState() => _SavedIdeasWidgetState();
}

class _SavedIdeasWidgetState extends State<SavedIdeasWidget> {
  ScrollController? columnController;
  ScrollController? staggeredViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    columnController = ScrollController();
    staggeredViewController = ScrollController();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SavedIdeas'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    columnController?.dispose();
    staggeredViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'SavedIdeas',
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
                                      'SAVED_IDEAS_PAGE_Image_ap46dnt3_ON_TAP');
                                  logFirebaseEvent('Image_navigate_to');

                                  context.pushNamed('HomePage');
                                },
                                child: Image.asset(
                                  'assets/images/Add_a_heading_(2).png',
                                  width: 110,
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.93, 1),
                              child: InkWell(
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SAVED_IDEAS_PAGE_Icon_0shuqds7_ON_TAP');
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
                                          child: BottomSheetForallPageWidget(),
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
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: SingleChildScrollView(
                  controller: columnController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 10),
                          child: GradientText(
                            'Your Collection',
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Noto Sans',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                            colors: [Color(0xFFBF1F0B), Color(0xFFDC5F00)],
                            gradientDirection: GradientDirection.rtl,
                            gradientType: GradientType.linear,
                          ),
                        ),
                      ),
                      if ((currentUserDocument?.savedimages?.toList() ?? [])
                              .length !=
                          0)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: AuthUserStreamWidget(
                            child: Builder(
                              builder: (context) {
                                final favpics = (currentUserDocument
                                            ?.savedimages
                                            ?.toList() ??
                                        [])
                                    .toList();
                                if (favpics.isEmpty) {
                                  return Center(
                                    child: Image.asset(
                                      'assets/images/cold,_smooth_&_tasty._(1640__700_px)_(3).png',
                                    ),
                                  );
                                }
                                return MasonryGridView.count(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5,
                                  itemCount: favpics.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, favpicsIndex) {
                                    final favpicsItem = favpics[favpicsIndex];
                                    return StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          currentUserReference!),
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
                                        final imageUsersRecord = snapshot.data!;
                                        return InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SAVED_IDEAS_PAGE_Image_skrnq3cd_ON_TAP');
                                            logFirebaseEvent(
                                                'Image_navigate_to');

                                            context.pushNamed(
                                              'HomePage',
                                              queryParams: {
                                                'picquery': serializeParam(
                                                  favpicsItem,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );

                                            logFirebaseEvent('Image_scroll_to');
                                            await columnController?.animateTo(
                                              0,
                                              duration:
                                                  Duration(milliseconds: 10),
                                              curve: Curves.ease,
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: CachedNetworkImage(
                                              imageUrl: favpicsItem,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.25,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  controller: staggeredViewController,
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

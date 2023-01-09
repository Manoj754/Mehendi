import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchresultspageWidget extends StatefulWidget {
  const SearchresultspageWidget({
    Key? key,
    this.searchbarinput,
    this.searchresults,
  }) : super(key: key);

  final String? searchbarinput;
  final String? searchresults;

  @override
  _SearchresultspageWidgetState createState() =>
      _SearchresultspageWidgetState();
}

class _SearchresultspageWidgetState extends State<SearchresultspageWidget> {
  List<MehndiImagesRecord>? algoliaSearchResults = [];
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'searchresultspage'});
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
        title: 'searchresultspage',
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
                                      'SEARCHRESULTSIcon_uoa5p4gt_ON_TAP');
                                  logFirebaseEvent('Icon_navigate_back');
                                  context.pop();
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 24,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.7, 1),
                              child: Text(
                                'Back',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
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
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(-0.6, 0),
                              child: TextFormField(
                                controller: textController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'textController',
                                  Duration(milliseconds: 100),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Search designs & syles ...',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
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
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFEEEEEE),
                                  suffixIcon: textController!.text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            textController?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: Color(0xFF757575),
                                            size: 22,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 44,
                              icon: Icon(
                                Icons.search_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'SEARCHRESULTSsearch_rounded_ICN_ON_TAP');
                                logFirebaseEvent('IconButton_algolia_search');
                                setState(() => algoliaSearchResults = null);
                                await MehndiImagesRecord.search(
                                  term: textController!.text,
                                )
                                    .then((r) => algoliaSearchResults = r)
                                    .onError(
                                        (_, __) => algoliaSearchResults = [])
                                    .whenComplete(() => setState(() {}));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
                      child: Builder(
                        builder: (context) {
                          if (algoliaSearchResults == null) {
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
                          final results = algoliaSearchResults?.toList() ?? [];
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: results.length,
                            itemBuilder: (context, resultsIndex) {
                              final resultsItem = results[resultsIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 4, 16, 8),
                                child: InkWell(
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'SEARCHRESULTSPAGE_PAGE_userList_5_ON_TAP');
                                    logFirebaseEvent('userList_5_navigate_to');

                                    context.pushNamed(
                                      'HomePage',
                                      queryParams: {
                                        'buttontext': serializeParam(
                                          resultsItem.tagslist,
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
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x32000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 8, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 0, 8, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  resultsItem.name!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
          ),
        ));
  }
}

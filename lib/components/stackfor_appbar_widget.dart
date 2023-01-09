import '../components/bottom_sheet_forall_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StackforAppbarWidget extends StatefulWidget {
  const StackforAppbarWidget({Key? key}) : super(key: key);

  @override
  _StackforAppbarWidgetState createState() => _StackforAppbarWidgetState();
}

class _StackforAppbarWidgetState extends State<StackforAppbarWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Color(0xFFCF0A0A)],
              stops: [0, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
        ),
        Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(-0.93, 1),
              child: InkWell(
                onTap: () async {
                  logFirebaseEvent('STACKFOR_APPBAR_Image_z9dhfy7b_ON_TAP');
                  logFirebaseEvent('Image_navigate_to');

                  context.pushNamed('HomePage');
                },
                child: Image.asset(
                  'assets/images/Add_a_heading_(2).png',
                  width: 130,
                  height: MediaQuery.of(context).size.height * 0.04,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.93, 1),
              child: InkWell(
                onTap: () async {
                  logFirebaseEvent('STACKFOR_APPBAR_Icon_zcf7pm90_ON_TAP');
                  logFirebaseEvent('Icon_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.of(context).viewInsets,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: BottomSheetForallPageWidget(),
                        ),
                      );
                    },
                  ).then((value) => setState(() {}));
                },
                child: Icon(
                  Icons.menu,
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

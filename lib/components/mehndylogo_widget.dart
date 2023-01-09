import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MehndylogoWidget extends StatefulWidget {
  const MehndylogoWidget({Key? key}) : super(key: key);

  @override
  _MehndylogoWidgetState createState() => _MehndylogoWidgetState();
}

class _MehndylogoWidgetState extends State<MehndylogoWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(-0.09, 7.96),
      child: InkWell(
        onTap: () async {
          logFirebaseEvent('MEHNDYLOGO_COMP_Text_tifdv3gd_ON_TAP');
          logFirebaseEvent('Text_navigate_to');

          context.pushNamed(
            'HomePage',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        },
        child: Text(
          'mehndy',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Noto Sans',
                color: Color(0xFFBF1F0B),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

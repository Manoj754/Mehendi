import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Button1Widget extends StatefulWidget {
  const Button1Widget({Key? key}) : super(key: key);

  @override
  _Button1WidgetState createState() => _Button1WidgetState();
}

class _Button1WidgetState extends State<Button1Widget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
      child: FFButtonWidget(
        onPressed: () {
          print('Button1 pressed ...');
        },
        text: 'front hand',
        options: FFButtonOptions(
          width: 100,
          height: 40,
          color: Colors.white,
          textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Noto Sans',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
          elevation: 0,
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).lineColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

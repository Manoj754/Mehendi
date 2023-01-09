import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ClickableVideoWidget extends StatefulWidget {
  const ClickableVideoWidget({Key? key}) : super(key: key);

  @override
  _ClickableVideoWidgetState createState() => _ClickableVideoWidgetState();
}

class _ClickableVideoWidgetState extends State<ClickableVideoWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: 'Button',
      options: FFButtonOptions(
        width: 130,
        height: 40,
        color: FlutterFlowTheme.of(context).primaryColor,
        textStyle: FlutterFlowTheme.of(context).subtitle2.override(
              fontFamily: 'Noto Sans',
              color: Colors.white,
            ),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

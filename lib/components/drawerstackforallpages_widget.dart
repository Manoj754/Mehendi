import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerstackforallpagesWidget extends StatefulWidget {
  const DrawerstackforallpagesWidget({Key? key}) : super(key: key);

  @override
  _DrawerstackforallpagesWidgetState createState() =>
      _DrawerstackforallpagesWidgetState();
}

class _DrawerstackforallpagesWidgetState
    extends State<DrawerstackforallpagesWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container();
  }
}

import '/flutter_flow/flutter_flow_util.dart';
import 'sampl1_widget.dart' show Sampl1Widget;
import 'package:flutter/material.dart';

class Sampl1Model extends FlutterFlowModel<Sampl1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

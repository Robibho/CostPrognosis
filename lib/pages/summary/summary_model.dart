import '/flutter_flow/flutter_flow_util.dart';
import 'summary_widget.dart' show SummaryWidget;
import 'package:flutter/material.dart';

class SummaryModel extends FlutterFlowModel<SummaryWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

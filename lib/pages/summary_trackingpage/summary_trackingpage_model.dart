import '/flutter_flow/flutter_flow_util.dart';
import 'summary_trackingpage_widget.dart' show SummaryTrackingpageWidget;
import 'package:flutter/material.dart';

class SummaryTrackingpageModel
    extends FlutterFlowModel<SummaryTrackingpageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

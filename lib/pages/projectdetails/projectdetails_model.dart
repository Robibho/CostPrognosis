import '/flutter_flow/flutter_flow_util.dart';
import 'projectdetails_widget.dart' show ProjectdetailsWidget;
import 'package:flutter/material.dart';

class ProjectdetailsModel extends FlutterFlowModel<ProjectdetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

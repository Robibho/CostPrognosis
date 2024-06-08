import '/flutter_flow/flutter_flow_util.dart';
import 'accounts_widget.dart' show AccountsWidget;
import 'package:flutter/material.dart';

class AccountsModel extends FlutterFlowModel<AccountsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

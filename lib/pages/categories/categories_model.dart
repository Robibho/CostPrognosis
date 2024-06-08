import '/flutter_flow/flutter_flow_util.dart';
import '/pages/categories_component/categories_component_widget.dart';
import 'categories_widget.dart' show CategoriesWidget;
import 'package:flutter/material.dart';

class CategoriesModel extends FlutterFlowModel<CategoriesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for CategoriesComponent component.
  late CategoriesComponentModel categoriesComponentModel;

  @override
  void initState(BuildContext context) {
    categoriesComponentModel =
        createModel(context, () => CategoriesComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    categoriesComponentModel.dispose();
  }
}

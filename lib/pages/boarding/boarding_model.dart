import '/flutter_flow/flutter_flow_util.dart';
import 'boarding_widget.dart' show BoardingWidget;
import 'package:flutter/material.dart';

class BoardingModel extends FlutterFlowModel<BoardingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}

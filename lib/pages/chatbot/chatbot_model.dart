import '/backend/api_requests/api_calls.dart';
import '/chat_g_p_t_component/ai_chat_component/ai_chat_component_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chatbot_widget.dart' show ChatbotWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class ChatbotModel extends FlutterFlowModel<ChatbotWidget> {
  ///  Local state fields for this page.

  bool isRecording = false;

  bool isSpeaking = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for aiChat_Component component.
  late AiChatComponentModel aiChatComponentModel;
  // Stores action output result for [Backend Call - API (GetResponse)] action in IconButton widget.
  ApiCallResponse? openAIResponse;
  // Stores action output result for [Custom Action - fetchSpeechAndPlay] action in IconButton widget.
  int? audioFileDuration;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {
    aiChatComponentModel = createModel(context, () => AiChatComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    aiChatComponentModel.dispose();
    timerController.dispose();
  }
}

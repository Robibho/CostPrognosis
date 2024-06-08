import '/backend/api_requests/api_calls.dart';
import '/chat_g_p_t_component/ai_chat_component/ai_chat_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'chatbot_model.dart';
export 'chatbot_model.dart';

class ChatbotWidget extends StatefulWidget {
  const ChatbotWidget({super.key});

  @override
  State<ChatbotWidget> createState() => _ChatbotWidgetState();
}

class _ChatbotWidgetState extends State<ChatbotWidget>
    with TickerProviderStateMixin {
  late ChatbotModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatbotModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    animationsMap.addAll({
      'lottieAnimationOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'conditionalBuilderOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: FlutterFlowTheme.of(context).secondary,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            fillColor: FlutterFlowTheme.of(context).primary,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondary,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '7fgwo0j0' /* COST POWER PROGNATOR */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 44.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                  maxWidth: 602.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                alignment: AlignmentDirectional(-1.0, 0.0),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 700.0,
                              constraints: BoxConstraints(
                                maxWidth: 602.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(-1.0, 0),
                                      child: TabBar(
                                        isScrollable: true,
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        labelPadding: EdgeInsets.all(16.0),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Inter',
                                              letterSpacing: 0.0,
                                            ),
                                        unselectedLabelStyle:
                                            FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        indicatorWeight: 4.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 16.0, 12.0),
                                        tabs: [
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'm1szpw57' /* ChatBot */,
                                            ),
                                          ),
                                          Tab(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '8mky6g77' /* VoiceBot */,
                                            ),
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [() async {}, () async {}][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: wrapWithModel(
                                              model:
                                                  _model.aiChatComponentModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              updateOnChange: true,
                                              child: AiChatComponentWidget(),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      AnimatedContainer(
                                                        duration: Duration(
                                                            milliseconds: 300),
                                                        curve: Curves.easeInOut,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    24.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    24.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    24.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    24.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      32.0,
                                                                      32.0,
                                                                      32.0,
                                                                      32.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              if (!_model
                                                                  .isSpeaking)
                                                                Lottie.asset(
                                                                  'assets/lottie_animations/H_Icon_03.json',
                                                                  width: 400.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  animate: true,
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'lottieAnimationOnPageLoadAnimation']!),
                                                              if (!_model
                                                                  .isSpeaking)
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    if (_model
                                                                        .isRecording) {
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            30.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          borderRadius:
                                                                              100.0,
                                                                          borderWidth:
                                                                              10.0,
                                                                          buttonSize:
                                                                              200.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.stop_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                80.0,
                                                                          ),
                                                                          showLoadingIndicator:
                                                                              true,
                                                                          onPressed:
                                                                              () async {
                                                                            _model.isRecording =
                                                                                false;
                                                                            setState(() {});
                                                                            await actions.stopTextRecording();
                                                                            _model.openAIResponse =
                                                                                await GetResponseCall.call(
                                                                              apiKeyAuth: FFAppState().apiKey,
                                                                              prompt: FFAppState().speechToTextResponse,
                                                                              language: FFLocalizations.of(context).languageCode,
                                                                            );
                                                                            if ((_model.openAIResponse?.succeeded ??
                                                                                true)) {
                                                                              _model.audioFileDuration = await actions.fetchSpeechAndPlay(
                                                                                GetResponseCall.message(
                                                                                  (_model.openAIResponse?.jsonBody ?? ''),
                                                                                ).toString(),
                                                                                FFAppState().apiKey,
                                                                              );
                                                                              FFAppState().timerValue = _model.audioFileDuration!;
                                                                              FFAppState().speechToTextResponse = '';
                                                                              setState(() {});
                                                                              _model.isSpeaking = true;
                                                                              setState(() {});
                                                                              await Future.delayed(const Duration(milliseconds: 100));
                                                                              _model.timerController.onStartTimer();
                                                                            } else {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'API Call failed.',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 4000),
                                                                                  backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                ),
                                                                              );
                                                                            }

                                                                            setState(() {});
                                                                          },
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      return FlutterFlowIconButton(
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                        borderRadius:
                                                                            100.0,
                                                                        borderWidth:
                                                                            10.0,
                                                                        buttonSize:
                                                                            200.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondary,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .mic_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              80.0,
                                                                        ),
                                                                        showLoadingIndicator:
                                                                            true,
                                                                        onPressed:
                                                                            () async {
                                                                          _model.isRecording =
                                                                              true;
                                                                          setState(
                                                                              () {});
                                                                          await actions
                                                                              .startTextRecording();
                                                                        },
                                                                      );
                                                                    }
                                                                  },
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'conditionalBuilderOnPageLoadAnimation']!),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child:
                                                      FlutterFlowLanguageSelector(
                                                    width: 200.0,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    dropdownColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                    dropdownIconColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .tertiary,
                                                    borderRadius: 12.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hideFlags: true,
                                                    flagTextGap: 8.0,
                                                    currentLanguage:
                                                        FFLocalizations.of(
                                                                context)
                                                            .languageCode,
                                                    languages: FFLocalizations
                                                        .languages(),
                                                    onChanged: (lang) =>
                                                        setAppLanguage(
                                                            context, lang),
                                                  ),
                                                ),
                                                if (_model.isSpeaking)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: FlutterFlowTimer(
                                                      initialTime: FFAppState()
                                                          .timerValue,
                                                      getDisplayTime: (value) =>
                                                          StopWatchTimer
                                                              .getDisplayTime(
                                                        value,
                                                        hours: false,
                                                        minute: false,
                                                        milliSecond: false,
                                                      ),
                                                      controller: _model
                                                          .timerController,
                                                      updateStateInterval:
                                                          Duration(
                                                              milliseconds:
                                                                  100),
                                                      onChanged: (value,
                                                          displayTime,
                                                          shouldUpdate) {
                                                        _model.timerMilliseconds =
                                                            value;
                                                        _model.timerValue =
                                                            displayTime;
                                                        if (shouldUpdate)
                                                          setState(() {});
                                                      },
                                                      onEnded: () async {
                                                        _model.timerController
                                                            .onResetTimer();

                                                        _model.isSpeaking =
                                                            false;
                                                        setState(() {});
                                                      },
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineSmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: Color(
                                                                0x0014181B),
                                                            fontSize: 1.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Container(
                                        width: 120.0,
                                        height: 120.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/_28fcc36e-1049-4cb0-ad2b-6f93a14e4a25.jpeg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '83abgw6a' /* AI Construction Advicer */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '22ymert0' /* ChatGPT Project Manager. */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

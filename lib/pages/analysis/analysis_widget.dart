import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'analysis_model.dart';
export 'analysis_model.dart';

class AnalysisWidget extends StatefulWidget {
  const AnalysisWidget({super.key});

  @override
  State<AnalysisWidget> createState() => _AnalysisWidgetState();
}

class _AnalysisWidgetState extends State<AnalysisWidget> {
  late AnalysisModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalysisModel());

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
    final chartPieChartColorsList = [
      const Color(0xED4A57C1),
      const Color(0xFFFF3653),
      const Color(0xFFFAC418),
      const Color(0xFF539A80),
      const Color(0xFF4A57C1),
      FlutterFlowTheme.of(context).accent3,
      const Color(0xFF824BEB),
      FlutterFlowTheme.of(context).primary,
      const Color(0xFF5C6BF4),
      const Color(0xFF8F5CB5),
      const Color(0xFFA487ED),
      const Color(0xFF6A80C9),
      const Color(0xFF7849BD),
      const Color(0xFF2534B9)
    ];
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('SummaryTrackingpage');
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '7uc05cpn' /* Analysis */,
            ),
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'x2xj4ama' /* Contigence Reserve Summary
 */
                            ,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD4F5F5),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'kpsj3wtr' /* $ */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: ((functions.addAmount(FFAppState()
                                                  .transaction
                                                  .where(
                                                      (e) => e.type == 'income')
                                                  .toList())!) -
                                              (functions.addAmount(FFAppState()
                                                  .transaction
                                                  .where((e) =>
                                                      e.type == 'expense')
                                                  .toList())!))
                                          .toString(),
                                      style: const TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'svgjgywe' /*  balance */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                      child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD4F5F5),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'akd0l8x4' /* $ */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: functions
                                          .addAmount(FFAppState()
                                              .transaction
                                              .where((e) => e.type == 'income')
                                              .toList())
                                          .toString(),
                                      style: const TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: const Color(0xFF3ADB19),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '4vm2umbb' /* income */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD4F5F5),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                textScaler: MediaQuery.of(context).textScaler,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        'qq32zl26' /* $ */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: functions
                                          .addAmount(FFAppState()
                                              .transaction
                                              .where((e) => e.type == 'expense')
                                              .toList())
                                          .toString(),
                                      style: const TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ailxapg1' /*  expenditure */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1.0,
                color: Color(0xFF2BD9DC),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??= 'expense',
                        ),
                        options: List<String>.from(['expense', 'income']),
                        optionLabels: [
                          FFLocalizations.of(context).getText(
                            'hs5b4w8r' /* Expense Overview */,
                          ),
                          FFLocalizations.of(context).getText(
                            'x4iqqdp3' /* Income Overview */,
                          )
                        ],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue = val),
                        width: 300.0,
                        height: 56.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'e75pynpn' /* Please select... */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: SizedBox(
                  width: 370.0,
                  height: 257.0,
                  child: Stack(
                    children: [
                      FlutterFlowPieChart(
                        data: FFPieChartData(
                          values: FFAppState()
                              .transaction
                              .where((e) => e.type == _model.dropDownValue)
                              .toList()
                              .map((e) => e.amount)
                              .toList(),
                          colors: chartPieChartColorsList,
                          radius: [50.0],
                        ),
                        donutHoleRadius: 50.0,
                        donutHoleColor: Colors.transparent,
                        sectionLabelStyle:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: FlutterFlowChartLegendWidget(
                          entries: functions
                              .getCategoriesname(
                                  FFAppState()
                                      .transaction
                                      .where(
                                          (e) => e.type == _model.dropDownValue)
                                      .toList(),
                                  FFAppState().categories.toList())!
                              .asMap()
                              .entries
                              .map(
                                (label) => LegendEntry(
                                  chartPieChartColorsList[label.key %
                                      chartPieChartColorsList.length],
                                  label.value,
                                ),
                              )
                              .toList(),
                          width: double.infinity,
                          height: double.infinity,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          textPadding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 5.0, 0.0),
                          borderColor: Colors.black,
                          indicatorSize: 10.0,
                          indicatorBorderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 250.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD7F7F6),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Builder(
                      builder: (context) {
                        final transaction = FFAppState()
                            .transaction
                            .where((e) => e.type == _model.dropDownValue)
                            .toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: transaction.length,
                          itemBuilder: (context, transactionIndex) {
                            final transactionItem =
                                transaction[transactionIndex];
                            return Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  6.0, 5.0, 6.0, 5.0),
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF50E3A6),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            FFAppState()
                                                .categories
                                                .where((e) =>
                                                    e.id ==
                                                    transactionItem.category)
                                                .toList()
                                                .first
                                                .image,
                                            width: 40.0,
                                            height: 40.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFAppState()
                                                .categories
                                                .where((e) =>
                                                    e.id ==
                                                    transactionItem.category)
                                                .toList()
                                                .first
                                                .name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '3qbtnnb1' /* $ */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: transactionItem.account,
                                                  style: const TextStyle(),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
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

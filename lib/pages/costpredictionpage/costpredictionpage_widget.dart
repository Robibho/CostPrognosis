import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'costpredictionpage_model.dart';
import 'package:tflite_flutter/tflite_flutter.dart';  // Add this import

class CostpredictionpageWidget extends StatefulWidget {
  const CostpredictionpageWidget({Key? key, required this.interpreter}) : super(key: key);  // Add interpreter parameter

  final Interpreter interpreter;  // Add this field

  @override
  _CostpredictionpageWidgetState createState() =>
      _CostpredictionpageWidgetState();
}

class _CostpredictionpageWidgetState extends State<CostpredictionpageWidget> {
  late CostpredictionpageModel _model;

  @override
  void initState() {
    super.initState();
    _model = CostpredictionpageModel(widget.interpreter);  // Pass the interpreter

    // Initialize your text controllers, focus nodes, etc.
    _model.textController1 = TextEditingController();
    _model.textFieldFocusNode1 = FocusNode();
    _model.textController2 = TextEditingController();
    _model.textFieldFocusNode2 = FocusNode();
    _model.textController3 = TextEditingController();
    _model.textFieldFocusNode3 = FocusNode();
    _model.textController4 = TextEditingController();
    _model.textFieldFocusNode4 = FocusNode();
    _model.textController5 = TextEditingController();
    _model.textFieldFocusNode5 = FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void performPrediction() async {
    final input = [
      _model.textController1?.text,
      _model.textController2?.text,
      _model.textController3?.text,
      _model.textController4?.text,
      _model.textController5?.text,
    ].map((e) => double.parse(e ?? '0')).toList();

    final prediction = await _model.predict([input]);
    print('Prediction: $prediction');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cost Prediction')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _model.textController1,
              focusNode: _model.textFieldFocusNode1,
              decoration: const InputDecoration(labelText: 'Input 1'),
            ),
            TextField(
              controller: _model.textController2,
              focusNode: _model.textFieldFocusNode2,
              decoration: const InputDecoration(labelText: 'Input 2'),
            ),
            TextField(
              controller: _model.textController3,
              focusNode: _model.textFieldFocusNode3,
              decoration: const InputDecoration(labelText: 'Input 3'),
            ),
            TextField(
              controller: _model.textController4,
              focusNode: _model.textFieldFocusNode4,
              decoration: const InputDecoration(labelText: 'Input 4'),
            ),
            TextField(
              controller: _model.textController5,
              focusNode: _model.textFieldFocusNode5,
              decoration: const InputDecoration(labelText: 'Input 5'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: performPrediction,
              child: const Text('Predict'),
            ),
          ],
        ),
      ),
    );
  }
}

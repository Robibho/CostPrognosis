// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksStruct extends FFFirebaseStruct {
  TasksStruct({
    String? label,
    DateTime? startDate,
    DateTime? endDate,
    double? progress,
    double? cost,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _label = label,
        _startDate = startDate,
        _endDate = endDate,
        _progress = progress,
        _cost = cost,
        super(firestoreUtilData);

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;
  bool hasLabel() => _label != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? val) => _endDate = val;
  bool hasEndDate() => _endDate != null;

  // "progress" field.
  double? _progress;
  double get progress => _progress ?? 0.0;
  set progress(double? val) => _progress = val;
  void incrementProgress(double amount) => _progress = progress + amount;
  bool hasProgress() => _progress != null;

  // "cost" field.
  double? _cost;
  double get cost => _cost ?? 0.0;
  set cost(double? val) => _cost = val;
  void incrementCost(double amount) => _cost = cost + amount;
  bool hasCost() => _cost != null;

  static TasksStruct fromMap(Map<String, dynamic> data) => TasksStruct(
        label: data['label'] as String?,
        startDate: data['startDate'] as DateTime?,
        endDate: data['endDate'] as DateTime?,
        progress: castToType<double>(data['progress']),
        cost: castToType<double>(data['cost']),
      );

  static TasksStruct? maybeFromMap(dynamic data) =>
      data is Map ? TasksStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'label': _label,
        'startDate': _startDate,
        'endDate': _endDate,
        'progress': _progress,
        'cost': _cost,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'startDate': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'endDate': serializeParam(
          _endDate,
          ParamType.DateTime,
        ),
        'progress': serializeParam(
          _progress,
          ParamType.double,
        ),
        'cost': serializeParam(
          _cost,
          ParamType.double,
        ),
      }.withoutNulls;

  static TasksStruct fromSerializableMap(Map<String, dynamic> data) =>
      TasksStruct(
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        startDate: deserializeParam(
          data['startDate'],
          ParamType.DateTime,
          false,
        ),
        endDate: deserializeParam(
          data['endDate'],
          ParamType.DateTime,
          false,
        ),
        progress: deserializeParam(
          data['progress'],
          ParamType.double,
          false,
        ),
        cost: deserializeParam(
          data['cost'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'TasksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TasksStruct &&
        label == other.label &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        progress == other.progress &&
        cost == other.cost;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([label, startDate, endDate, progress, cost]);
}

TasksStruct createTasksStruct({
  String? label,
  DateTime? startDate,
  DateTime? endDate,
  double? progress,
  double? cost,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TasksStruct(
      label: label,
      startDate: startDate,
      endDate: endDate,
      progress: progress,
      cost: cost,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TasksStruct? updateTasksStruct(
  TasksStruct? tasks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tasks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTasksStructData(
  Map<String, dynamic> firestoreData,
  TasksStruct? tasks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tasks == null) {
    return;
  }
  if (tasks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tasks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tasksData = getTasksFirestoreData(tasks, forFieldValue);
  final nestedData = tasksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tasks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTasksFirestoreData(
  TasksStruct? tasks, [
  bool forFieldValue = false,
]) {
  if (tasks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tasks.toMap());

  // Add any Firestore field values
  tasks.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTasksListFirestoreData(
  List<TasksStruct>? taskss,
) =>
    taskss?.map((e) => getTasksFirestoreData(e, true)).toList() ?? [];

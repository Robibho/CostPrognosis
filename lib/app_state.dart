import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _transaction = (await secureStorage.getStringList('ff_transaction'))
              ?.map((x) {
                try {
                  return TransactionStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _transaction;
    });
    await _safeInitAsync(() async {
      _categories = (await secureStorage.getStringList('ff_categories'))
              ?.map((x) {
                try {
                  return CategoriesStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _categories;
    });
    await _safeInitAsync(() async {
      _apiKey = await secureStorage.getString('ff_apiKey') ?? _apiKey;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<TransactionStruct> _transaction = [];
  List<TransactionStruct> get transaction => _transaction;
  set transaction(List<TransactionStruct> value) {
    _transaction = value;
    secureStorage.setStringList(
        'ff_transaction', value.map((x) => x.serialize()).toList());
  }

  void deleteTransaction() {
    secureStorage.delete(key: 'ff_transaction');
  }

  void addToTransaction(TransactionStruct value) {
    _transaction.add(value);
    secureStorage.setStringList(
        'ff_transaction', _transaction.map((x) => x.serialize()).toList());
  }

  void removeFromTransaction(TransactionStruct value) {
    _transaction.remove(value);
    secureStorage.setStringList(
        'ff_transaction', _transaction.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTransaction(int index) {
    _transaction.removeAt(index);
    secureStorage.setStringList(
        'ff_transaction', _transaction.map((x) => x.serialize()).toList());
  }

  void updateTransactionAtIndex(
    int index,
    TransactionStruct Function(TransactionStruct) updateFn,
  ) {
    _transaction[index] = updateFn(_transaction[index]);
    secureStorage.setStringList(
        'ff_transaction', _transaction.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTransaction(int index, TransactionStruct value) {
    _transaction.insert(index, value);
    secureStorage.setStringList(
        'ff_transaction', _transaction.map((x) => x.serialize()).toList());
  }

  List<CategoriesStruct> _categories = [
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"1\",\"name\":\"startup funding\",\"image\":\"https://cdn-icons-png.flaticon.com/128/12309/12309161.png\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"2\",\"name\":\"Expense reinbursement\",\"image\":\"https://cdn-icons-png.flaticon.com/128/13012/13012815.png\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"3\",\"name\":\"machinery & equipment\",\"image\":\"https://cdn-icons-png.flaticon.com/128/10559/10559176.png\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"4\",\"name\":\"permits & licencing\",\"image\":\"https://cdn-icons-png.flaticon.com/128/12799/12799187.png\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"5\",\"name\":\"Miscellaneous\",\"image\":\"https://cdn-icons-png.flaticon.com/128/1556/1556324.png\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"6\",\"name\":\"labour\",\"image\":\"https://cdn-icons-png.flaticon.com/128/10343/10343987.png\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"7\",\"name\":\"materials\",\"image\":\"https://cdn-icons-png.flaticon.com/128/7857/7857808.png\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"8\",\"name\":\"infrastructure\",\"image\":\"https://cdn-icons-png.flaticon.com/128/15564/15564326.png\"}'))
  ];
  List<CategoriesStruct> get categories => _categories;
  set categories(List<CategoriesStruct> value) {
    _categories = value;
    secureStorage.setStringList(
        'ff_categories', value.map((x) => x.serialize()).toList());
  }

  void deleteCategories() {
    secureStorage.delete(key: 'ff_categories');
  }

  void addToCategories(CategoriesStruct value) {
    _categories.add(value);
    secureStorage.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void removeFromCategories(CategoriesStruct value) {
    _categories.remove(value);
    secureStorage.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCategories(int index) {
    _categories.removeAt(index);
    secureStorage.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void updateCategoriesAtIndex(
    int index,
    CategoriesStruct Function(CategoriesStruct) updateFn,
  ) {
    _categories[index] = updateFn(_categories[index]);
    secureStorage.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCategories(int index, CategoriesStruct value) {
    _categories.insert(index, value);
    secureStorage.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  int _selectedCategory = 0;
  int get selectedCategory => _selectedCategory;
  set selectedCategory(int value) {
    _selectedCategory = value;
  }

  String _speechToTextResponse = '';
  String get speechToTextResponse => _speechToTextResponse;
  set speechToTextResponse(String value) {
    _speechToTextResponse = value;
  }

  String _apiKey = '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';
  String get apiKey => _apiKey;
  set apiKey(String value) {
    _apiKey = value;
    secureStorage.setString('ff_apiKey', value);
  }

  void deleteApiKey() {
    secureStorage.delete(key: 'ff_apiKey');
  }

  List<TasksStruct> _tasks = [];
  List<TasksStruct> get tasks => _tasks;
  set tasks(List<TasksStruct> value) {
    _tasks = value;
  }

  void addToTasks(TasksStruct value) {
    _tasks.add(value);
  }

  void removeFromTasks(TasksStruct value) {
    _tasks.remove(value);
  }

  void removeAtIndexFromTasks(int index) {
    _tasks.removeAt(index);
  }

  void updateTasksAtIndex(
    int index,
    TasksStruct Function(TasksStruct) updateFn,
  ) {
    _tasks[index] = updateFn(_tasks[index]);
  }

  void insertAtIndexInTasks(int index, TasksStruct value) {
    _tasks.insert(index, value);
  }

  int _timerValue = 0;
  int get timerValue => _timerValue;
  set timerValue(int value) {
    _timerValue = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}

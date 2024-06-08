import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CostprojectRecord extends FirestoreRecord {
  CostprojectRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _amount = castToType<double>(snapshotData['amount']);
    _description = snapshotData['description'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('costproject');

  static Stream<CostprojectRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CostprojectRecord.fromSnapshot(s));

  static Future<CostprojectRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CostprojectRecord.fromSnapshot(s));

  static CostprojectRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CostprojectRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CostprojectRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CostprojectRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CostprojectRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CostprojectRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCostprojectRecordData({
  DateTime? date,
  double? amount,
  String? description,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'amount': amount,
      'description': description,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class CostprojectRecordDocumentEquality implements Equality<CostprojectRecord> {
  const CostprojectRecordDocumentEquality();

  @override
  bool equals(CostprojectRecord? e1, CostprojectRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.amount == e2?.amount &&
        e1?.description == e2?.description &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(CostprojectRecord? e) => const ListEquality().hash([
        e?.date,
        e?.amount,
        e?.description,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is CostprojectRecord;
}

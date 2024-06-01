import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CategoriasRecord extends FirestoreRecord {
  CategoriasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipos" field.
  List<String>? _tipos;
  List<String> get tipos => _tipos ?? const [];
  bool hasTipos() => _tipos != null;

  void _initializeFields() {
    _tipos = getDataList(snapshotData['tipos']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categorias');

  static Stream<CategoriasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriasRecord.fromSnapshot(s));

  static Future<CategoriasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriasRecord.fromSnapshot(s));

  static CategoriasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriasRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class CategoriasRecordDocumentEquality implements Equality<CategoriasRecord> {
  const CategoriasRecordDocumentEquality();

  @override
  bool equals(CategoriasRecord? e1, CategoriasRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.tipos, e2?.tipos);
  }

  @override
  int hash(CategoriasRecord? e) => const ListEquality().hash([e?.tipos]);

  @override
  bool isValidKey(Object? o) => o is CategoriasRecord;
}

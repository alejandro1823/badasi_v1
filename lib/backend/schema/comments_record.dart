import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "contenidoCom" field.
  String? _contenidoCom;
  String get contenidoCom => _contenidoCom ?? '';
  bool hasContenidoCom() => _contenidoCom != null;

  // "timePost" field.
  DateTime? _timePost;
  DateTime? get timePost => _timePost;
  bool hasTimePost() => _timePost != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "display_name" field.
  DocumentReference? _displayName;
  DocumentReference? get displayName => _displayName;
  bool hasDisplayName() => _displayName != null;

  // "idPost" field.
  DocumentReference? _idPost;
  DocumentReference? get idPost => _idPost;
  bool hasIdPost() => _idPost != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _contenidoCom = snapshotData['contenidoCom'] as String?;
    _timePost = snapshotData['timePost'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _displayName = snapshotData['display_name'] as DocumentReference?;
    _idPost = snapshotData['idPost'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  String? uid,
  String? contenidoCom,
  DateTime? timePost,
  DocumentReference? displayName,
  DocumentReference? idPost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'contenidoCom': contenidoCom,
      'timePost': timePost,
      'display_name': displayName,
      'idPost': idPost,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.contenidoCom == e2?.contenidoCom &&
        e1?.timePost == e2?.timePost &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.displayName == e2?.displayName &&
        e1?.idPost == e2?.idPost;
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.contenidoCom,
        e?.timePost,
        e?.likes,
        e?.displayName,
        e?.idPost
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}

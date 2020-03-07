import 'package:cloud_firestore/cloud_firestore.dart';

class ApiProvider{
  final Firestore _db = Firestore.instance;
  final String _path;
  CollectionReference _ref;

  ApiProvider(this._path) {
    _ref = _db.collection(_path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return _ref.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollectionContains(
      String field, dynamic value) {
    return _ref
        .orderBy(field, descending: false).startAt([value]).endAt([value+ '\uf8ff'])
        .snapshots();
  }

  Stream<QuerySnapshot> streamDataCollectionWhere(
      String field, dynamic value) {
    return _ref
        .where(field, isEqualTo: value)
        .snapshots();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return _ref.snapshots();
  }

  Stream<DocumentSnapshot> streamDataCollectionById(String id) {
    return _ref.document(id).snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return _ref.document(id).get();
  }

  Future<DocumentReference> create(Map data) {
    return _ref.add(data);
  }

  Future<void> delete(String id) {
    return _ref.document(id).delete();
  }

  Future<void> update(Map data, String id) {
    return _ref.document(id).updateData(data);
  }
}

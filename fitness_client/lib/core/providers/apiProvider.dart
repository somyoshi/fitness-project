import 'package:cloud_firestore/cloud_firestore.dart';

class ApiProvider {
  final Firestore _db = Firestore.instance;
  final String _path;
  CollectionReference _ref;

  ApiProvider(this._path) {
    _ref = _db.collection(_path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return _ref.getDocuments();
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

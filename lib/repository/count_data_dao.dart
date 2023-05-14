import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/count_data_fs.dart';

class CountDataDao {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('collection_count');

  void saveCountData(CountDataFs countData) {
    _collection.add(countData.toJson());
  }

  Stream<QuerySnapshot> getSnapshots() {
    return _collection
        .orderBy("dateTime", descending: true)
        .limit(5)
        .snapshots();
  }
}

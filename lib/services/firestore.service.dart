part of app_services;

class FirestoreService {
  const FirestoreService._();

  static const instance = FirestoreService._();
  static final databaseReference = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    // debugPrint('$path: $data');
    await reference.set(data, SetOptions(merge: merge));
  }

  Stream<T?> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  }) {
    final DocumentReference reference = FirebaseFirestore.instance.doc(path);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();

    return snapshots
        .map((snapshot) => builder(snapshot.data() as Map<String, dynamic>?, snapshot.id));
  }

  Future<T?> documentFuture<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentID) builder,
  }) async {
    try {
      final DocumentReference reference = FirebaseFirestore.instance.doc(path);
      final snapshot = await reference.get();
      if (!snapshot.exists) return null;
      return builder(snapshot.data() as Map<String, dynamic>, snapshot.id);
    } catch (e) {
      debugPrint('documentFuture err > $e');
      rethrow;
    }
  }

  /// gets data from a firestore collection and returns it as a stream
  Stream<List<T?>> collectionStream<T>({
    required String path,
    required T? Function(Map<String, dynamic> data, String documentID) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T? lhs, T? rhs)? sort,

    /// if filterBuilder returns true, the data will be filtered(nullified)
    bool? Function(T data)? filterBuilder,
    String? sortByField,
    bool sortDescending = false,
    int? limit,
  }) {
    assert((limit != null && limit > 0) || limit == null,
        'Either the limit is null or is greater than zero');

    Query query = FirebaseFirestore.instance.collection(path);

    if (sortByField != null) {
      query = query.orderBy(sortByField, descending: sortDescending);
    }

    if (limit != null && limit > 0) {
      query = query.limit(limit);
    }

    if (queryBuilder != null) {
      query = queryBuilder(query);
    }

    final Stream<QuerySnapshot> snapshots = query.snapshots();

    return snapshots.map((eachSnapshot) {
      final result = eachSnapshot.docs
          .map((snapshot) {
            if (snapshot.exists && snapshot.data() is Map) {
              final data = snapshot.data() as Map<String, dynamic>;

              final tempdata = builder(data, snapshot.id);
              if (tempdata == null) return null;

              T? finalData = tempdata;

              // filter
              if (filterBuilder != null) {
                if (filterBuilder(tempdata)!) finalData = null;
              }

              return finalData;
            }
          })
          .where((value) => value != null)
          .toList(growable: false);

      if (sort != null) {
        result.sort(sort);
      }

      return result;
    });
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_record.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class AttendanceRecordCollectionReference
    implements
        AttendanceRecordQuery,
        FirestoreCollectionReference<AttendanceRecord,
            AttendanceRecordQuerySnapshot> {
  factory AttendanceRecordCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$AttendanceRecordCollectionReference;

  static AttendanceRecord fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return AttendanceRecord.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    AttendanceRecord value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<AttendanceRecord> get reference;

  @override
  AttendanceRecordDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<AttendanceRecordDocumentReference> add(AttendanceRecord value);
}

class _$AttendanceRecordCollectionReference extends _$AttendanceRecordQuery
    implements AttendanceRecordCollectionReference {
  factory _$AttendanceRecordCollectionReference(
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$AttendanceRecordCollectionReference._(
      firestore.collection('attendances').withConverter(
            fromFirestore: AttendanceRecordCollectionReference.fromFirestore,
            toFirestore: AttendanceRecordCollectionReference.toFirestore,
          ),
    );
  }

  _$AttendanceRecordCollectionReference._(
    CollectionReference<AttendanceRecord> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<AttendanceRecord> get reference =>
      super.reference as CollectionReference<AttendanceRecord>;

  @override
  AttendanceRecordDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return AttendanceRecordDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<AttendanceRecordDocumentReference> add(AttendanceRecord value) {
    return reference
        .add(value)
        .then((ref) => AttendanceRecordDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$AttendanceRecordCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class AttendanceRecordDocumentReference
    extends FirestoreDocumentReference<AttendanceRecord,
        AttendanceRecordDocumentSnapshot> {
  factory AttendanceRecordDocumentReference(
          DocumentReference<AttendanceRecord> reference) =
      _$AttendanceRecordDocumentReference;

  DocumentReference<AttendanceRecord> get reference;

  /// A reference to the [AttendanceRecordCollectionReference] containing this document.
  AttendanceRecordCollectionReference get parent {
    return _$AttendanceRecordCollectionReference(reference.firestore);
  }

  @override
  Stream<AttendanceRecordDocumentSnapshot> snapshots();

  @override
  Future<AttendanceRecordDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String studentId,
    FieldValue studentIdFieldValue,
    String classId,
    FieldValue classIdFieldValue,
    DateTime dateTime,
    FieldValue dateTimeFieldValue,
    AttendanceStatus status,
    FieldValue statusFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String studentId,
    FieldValue studentIdFieldValue,
    String classId,
    FieldValue classIdFieldValue,
    DateTime dateTime,
    FieldValue dateTimeFieldValue,
    AttendanceStatus status,
    FieldValue statusFieldValue,
  });
}

class _$AttendanceRecordDocumentReference extends FirestoreDocumentReference<
        AttendanceRecord, AttendanceRecordDocumentSnapshot>
    implements AttendanceRecordDocumentReference {
  _$AttendanceRecordDocumentReference(this.reference);

  @override
  final DocumentReference<AttendanceRecord> reference;

  /// A reference to the [AttendanceRecordCollectionReference] containing this document.
  AttendanceRecordCollectionReference get parent {
    return _$AttendanceRecordCollectionReference(reference.firestore);
  }

  @override
  Stream<AttendanceRecordDocumentSnapshot> snapshots() {
    return reference.snapshots().map(AttendanceRecordDocumentSnapshot._);
  }

  @override
  Future<AttendanceRecordDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(AttendanceRecordDocumentSnapshot._);
  }

  @override
  Future<AttendanceRecordDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(AttendanceRecordDocumentSnapshot._);
  }

  Future<void> update({
    Object? studentId = _sentinel,
    FieldValue? studentIdFieldValue,
    Object? classId = _sentinel,
    FieldValue? classIdFieldValue,
    Object? dateTime = _sentinel,
    FieldValue? dateTimeFieldValue,
    Object? status = _sentinel,
    FieldValue? statusFieldValue,
  }) async {
    assert(
      studentId == _sentinel || studentIdFieldValue == null,
      "Cannot specify both studentId and studentIdFieldValue",
    );
    assert(
      classId == _sentinel || classIdFieldValue == null,
      "Cannot specify both classId and classIdFieldValue",
    );
    assert(
      dateTime == _sentinel || dateTimeFieldValue == null,
      "Cannot specify both dateTime and dateTimeFieldValue",
    );
    assert(
      status == _sentinel || statusFieldValue == null,
      "Cannot specify both status and statusFieldValue",
    );
    final json = {
      if (studentId != _sentinel)
        _$AttendanceRecordFieldMap['studentId']!:
            _$AttendanceRecordPerFieldToJson.studentId(studentId as String),
      if (studentIdFieldValue != null)
        _$AttendanceRecordFieldMap['studentId']!: studentIdFieldValue,
      if (classId != _sentinel)
        _$AttendanceRecordFieldMap['classId']!:
            _$AttendanceRecordPerFieldToJson.classId(classId as String),
      if (classIdFieldValue != null)
        _$AttendanceRecordFieldMap['classId']!: classIdFieldValue,
      if (dateTime != _sentinel)
        _$AttendanceRecordFieldMap['dateTime']!:
            _$AttendanceRecordPerFieldToJson.dateTime(dateTime as DateTime),
      if (dateTimeFieldValue != null)
        _$AttendanceRecordFieldMap['dateTime']!: dateTimeFieldValue,
      if (status != _sentinel)
        _$AttendanceRecordFieldMap['status']!:
            _$AttendanceRecordPerFieldToJson.status(status as AttendanceStatus),
      if (statusFieldValue != null)
        _$AttendanceRecordFieldMap['status']!: statusFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? studentId = _sentinel,
    FieldValue? studentIdFieldValue,
    Object? classId = _sentinel,
    FieldValue? classIdFieldValue,
    Object? dateTime = _sentinel,
    FieldValue? dateTimeFieldValue,
    Object? status = _sentinel,
    FieldValue? statusFieldValue,
  }) {
    assert(
      studentId == _sentinel || studentIdFieldValue == null,
      "Cannot specify both studentId and studentIdFieldValue",
    );
    assert(
      classId == _sentinel || classIdFieldValue == null,
      "Cannot specify both classId and classIdFieldValue",
    );
    assert(
      dateTime == _sentinel || dateTimeFieldValue == null,
      "Cannot specify both dateTime and dateTimeFieldValue",
    );
    assert(
      status == _sentinel || statusFieldValue == null,
      "Cannot specify both status and statusFieldValue",
    );
    final json = {
      if (studentId != _sentinel)
        _$AttendanceRecordFieldMap['studentId']!:
            _$AttendanceRecordPerFieldToJson.studentId(studentId as String),
      if (studentIdFieldValue != null)
        _$AttendanceRecordFieldMap['studentId']!: studentIdFieldValue,
      if (classId != _sentinel)
        _$AttendanceRecordFieldMap['classId']!:
            _$AttendanceRecordPerFieldToJson.classId(classId as String),
      if (classIdFieldValue != null)
        _$AttendanceRecordFieldMap['classId']!: classIdFieldValue,
      if (dateTime != _sentinel)
        _$AttendanceRecordFieldMap['dateTime']!:
            _$AttendanceRecordPerFieldToJson.dateTime(dateTime as DateTime),
      if (dateTimeFieldValue != null)
        _$AttendanceRecordFieldMap['dateTime']!: dateTimeFieldValue,
      if (status != _sentinel)
        _$AttendanceRecordFieldMap['status']!:
            _$AttendanceRecordPerFieldToJson.status(status as AttendanceStatus),
      if (statusFieldValue != null)
        _$AttendanceRecordFieldMap['status']!: statusFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is AttendanceRecordDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class AttendanceRecordQuery
    implements QueryReference<AttendanceRecord, AttendanceRecordQuerySnapshot> {
  @override
  AttendanceRecordQuery limit(int limit);

  @override
  AttendanceRecordQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  AttendanceRecordQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    AttendanceRecordDocumentSnapshot? startAtDocument,
    AttendanceRecordDocumentSnapshot? endAtDocument,
    AttendanceRecordDocumentSnapshot? endBeforeDocument,
    AttendanceRecordDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  AttendanceRecordQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  AttendanceRecordQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  AttendanceRecordQuery whereStudentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  AttendanceRecordQuery whereClassId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  AttendanceRecordQuery whereDateTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  });
  AttendanceRecordQuery whereStatus({
    AttendanceStatus? isEqualTo,
    AttendanceStatus? isNotEqualTo,
    AttendanceStatus? isLessThan,
    AttendanceStatus? isLessThanOrEqualTo,
    AttendanceStatus? isGreaterThan,
    AttendanceStatus? isGreaterThanOrEqualTo,
    bool? isNull,
    List<AttendanceStatus>? whereIn,
    List<AttendanceStatus>? whereNotIn,
  });

  AttendanceRecordQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AttendanceRecordDocumentSnapshot? startAtDocument,
    AttendanceRecordDocumentSnapshot? endAtDocument,
    AttendanceRecordDocumentSnapshot? endBeforeDocument,
    AttendanceRecordDocumentSnapshot? startAfterDocument,
  });

  AttendanceRecordQuery orderByStudentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AttendanceRecordDocumentSnapshot? startAtDocument,
    AttendanceRecordDocumentSnapshot? endAtDocument,
    AttendanceRecordDocumentSnapshot? endBeforeDocument,
    AttendanceRecordDocumentSnapshot? startAfterDocument,
  });

  AttendanceRecordQuery orderByClassId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AttendanceRecordDocumentSnapshot? startAtDocument,
    AttendanceRecordDocumentSnapshot? endAtDocument,
    AttendanceRecordDocumentSnapshot? endBeforeDocument,
    AttendanceRecordDocumentSnapshot? startAfterDocument,
  });

  AttendanceRecordQuery orderByDateTime({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    AttendanceRecordDocumentSnapshot? startAtDocument,
    AttendanceRecordDocumentSnapshot? endAtDocument,
    AttendanceRecordDocumentSnapshot? endBeforeDocument,
    AttendanceRecordDocumentSnapshot? startAfterDocument,
  });

  AttendanceRecordQuery orderByStatus({
    bool descending = false,
    AttendanceStatus startAt,
    AttendanceStatus startAfter,
    AttendanceStatus endAt,
    AttendanceStatus endBefore,
    AttendanceRecordDocumentSnapshot? startAtDocument,
    AttendanceRecordDocumentSnapshot? endAtDocument,
    AttendanceRecordDocumentSnapshot? endBeforeDocument,
    AttendanceRecordDocumentSnapshot? startAfterDocument,
  });
}

class _$AttendanceRecordQuery
    extends QueryReference<AttendanceRecord, AttendanceRecordQuerySnapshot>
    implements AttendanceRecordQuery {
  _$AttendanceRecordQuery(
    this._collection, {
    required Query<AttendanceRecord> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<AttendanceRecordQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(AttendanceRecordQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<AttendanceRecordQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(AttendanceRecordQuerySnapshot._fromQuerySnapshot);
  }

  @override
  AttendanceRecordQuery limit(int limit) {
    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  AttendanceRecordQuery limitToLast(int limit) {
    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  AttendanceRecordQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AttendanceRecordDocumentSnapshot? startAtDocument,
    AttendanceRecordDocumentSnapshot? endAtDocument,
    AttendanceRecordDocumentSnapshot? endBeforeDocument,
    AttendanceRecordDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  AttendanceRecordQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  AttendanceRecordQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  AttendanceRecordQuery whereStudentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AttendanceRecordFieldMap['studentId']!,
        isEqualTo: isEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.studentId(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.studentId(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$AttendanceRecordPerFieldToJson.studentId(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.studentId(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$AttendanceRecordPerFieldToJson.studentId(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.studentId(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn:
            whereIn?.map((e) => _$AttendanceRecordPerFieldToJson.studentId(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$AttendanceRecordPerFieldToJson.studentId(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  AttendanceRecordQuery whereClassId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AttendanceRecordFieldMap['classId']!,
        isEqualTo: isEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.classId(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.classId(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$AttendanceRecordPerFieldToJson.classId(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.classId(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$AttendanceRecordPerFieldToJson.classId(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.classId(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn:
            whereIn?.map((e) => _$AttendanceRecordPerFieldToJson.classId(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$AttendanceRecordPerFieldToJson.classId(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  AttendanceRecordQuery whereDateTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
  }) {
    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AttendanceRecordFieldMap['dateTime']!,
        isEqualTo: isEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.dateTime(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.dateTime(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$AttendanceRecordPerFieldToJson.dateTime(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.dateTime(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$AttendanceRecordPerFieldToJson.dateTime(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.dateTime(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn:
            whereIn?.map((e) => _$AttendanceRecordPerFieldToJson.dateTime(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$AttendanceRecordPerFieldToJson.dateTime(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  AttendanceRecordQuery whereStatus({
    AttendanceStatus? isEqualTo,
    AttendanceStatus? isNotEqualTo,
    AttendanceStatus? isLessThan,
    AttendanceStatus? isLessThanOrEqualTo,
    AttendanceStatus? isGreaterThan,
    AttendanceStatus? isGreaterThanOrEqualTo,
    bool? isNull,
    List<AttendanceStatus>? whereIn,
    List<AttendanceStatus>? whereNotIn,
  }) {
    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$AttendanceRecordFieldMap['status']!,
        isEqualTo: isEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.status(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.status(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$AttendanceRecordPerFieldToJson.status(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.status(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$AttendanceRecordPerFieldToJson.status(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$AttendanceRecordPerFieldToJson.status(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn:
            whereIn?.map((e) => _$AttendanceRecordPerFieldToJson.status(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$AttendanceRecordPerFieldToJson.status(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  AttendanceRecordQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AttendanceRecordDocumentSnapshot? startAtDocument,
    AttendanceRecordDocumentSnapshot? endAtDocument,
    AttendanceRecordDocumentSnapshot? endBeforeDocument,
    AttendanceRecordDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  AttendanceRecordQuery orderByStudentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AttendanceRecordDocumentSnapshot? startAtDocument,
    AttendanceRecordDocumentSnapshot? endAtDocument,
    AttendanceRecordDocumentSnapshot? endBeforeDocument,
    AttendanceRecordDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$AttendanceRecordFieldMap['studentId']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  AttendanceRecordQuery orderByClassId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AttendanceRecordDocumentSnapshot? startAtDocument,
    AttendanceRecordDocumentSnapshot? endAtDocument,
    AttendanceRecordDocumentSnapshot? endBeforeDocument,
    AttendanceRecordDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$AttendanceRecordFieldMap['classId']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  AttendanceRecordQuery orderByDateTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AttendanceRecordDocumentSnapshot? startAtDocument,
    AttendanceRecordDocumentSnapshot? endAtDocument,
    AttendanceRecordDocumentSnapshot? endBeforeDocument,
    AttendanceRecordDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$AttendanceRecordFieldMap['dateTime']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  AttendanceRecordQuery orderByStatus({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AttendanceRecordDocumentSnapshot? startAtDocument,
    AttendanceRecordDocumentSnapshot? endAtDocument,
    AttendanceRecordDocumentSnapshot? endBeforeDocument,
    AttendanceRecordDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$AttendanceRecordFieldMap['status']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$AttendanceRecordQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$AttendanceRecordQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class AttendanceRecordDocumentSnapshot
    extends FirestoreDocumentSnapshot<AttendanceRecord> {
  AttendanceRecordDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<AttendanceRecord> snapshot;

  @override
  AttendanceRecordDocumentReference get reference {
    return AttendanceRecordDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final AttendanceRecord? data;
}

class AttendanceRecordQuerySnapshot extends FirestoreQuerySnapshot<
    AttendanceRecord, AttendanceRecordQueryDocumentSnapshot> {
  AttendanceRecordQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory AttendanceRecordQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<AttendanceRecord> snapshot,
  ) {
    final docs =
        snapshot.docs.map(AttendanceRecordQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        AttendanceRecordDocumentSnapshot._,
      );
    }).toList();

    return AttendanceRecordQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<AttendanceRecordDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    AttendanceRecordDocumentSnapshot Function(DocumentSnapshot<T> doc)
        decodeDoc,
  ) {
    return FirestoreDocumentChange<AttendanceRecordDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<AttendanceRecord> snapshot;

  @override
  final List<AttendanceRecordQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AttendanceRecordDocumentSnapshot>>
      docChanges;
}

class AttendanceRecordQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<AttendanceRecord>
    implements AttendanceRecordDocumentSnapshot {
  AttendanceRecordQueryDocumentSnapshot._(this.snapshot)
      : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<AttendanceRecord> snapshot;

  @override
  final AttendanceRecord data;

  @override
  AttendanceRecordDocumentReference get reference {
    return AttendanceRecordDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceRecord _$AttendanceRecordFromJson(Map<String, dynamic> json) =>
    AttendanceRecord(
      id: json['id'] as String,
      studentId: json['studentId'] as String,
      classId: json['classId'] as String,
      dateTime: const FirestoreDateTimeConverter()
          .fromJson(json['dateTime'] as Timestamp),
      status: $enumDecodeNullable(_$AttendanceStatusEnumMap, json['status']),
    );

const _$AttendanceRecordFieldMap = <String, String>{
  'id': 'id',
  'studentId': 'studentId',
  'classId': 'classId',
  'dateTime': 'dateTime',
  'status': 'status',
};

// ignore: unused_element
abstract class _$AttendanceRecordPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? studentId(String instance) => instance;
  // ignore: unused_element
  static Object? classId(String instance) => instance;
  // ignore: unused_element
  static Object? dateTime(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? status(AttendanceStatus instance) =>
      _$AttendanceStatusEnumMap[instance]!;
}

Map<String, dynamic> _$AttendanceRecordToJson(AttendanceRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'classId': instance.classId,
      'dateTime': const FirestoreDateTimeConverter().toJson(instance.dateTime),
      'status': _$AttendanceStatusEnumMap[instance.status]!,
    };

const _$AttendanceStatusEnumMap = {
  AttendanceStatus.unknown: -1,
  AttendanceStatus.Absent: 0,
  AttendanceStatus.Present: 1,
  AttendanceStatus.Late: 2,
  AttendanceStatus.Excused: 3,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_class.dart';

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
abstract class SchoolClassCollectionReference
    implements
        SchoolClassQuery,
        FirestoreCollectionReference<SchoolClass, SchoolClassQuerySnapshot> {
  factory SchoolClassCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$SchoolClassCollectionReference;

  static SchoolClass fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return SchoolClass.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    SchoolClass value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<SchoolClass> get reference;

  @override
  SchoolClassDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<SchoolClassDocumentReference> add(SchoolClass value);
}

class _$SchoolClassCollectionReference extends _$SchoolClassQuery
    implements SchoolClassCollectionReference {
  factory _$SchoolClassCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$SchoolClassCollectionReference._(
      firestore.collection('classes').withConverter(
            fromFirestore: SchoolClassCollectionReference.fromFirestore,
            toFirestore: SchoolClassCollectionReference.toFirestore,
          ),
    );
  }

  _$SchoolClassCollectionReference._(
    CollectionReference<SchoolClass> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<SchoolClass> get reference =>
      super.reference as CollectionReference<SchoolClass>;

  @override
  SchoolClassDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return SchoolClassDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<SchoolClassDocumentReference> add(SchoolClass value) {
    return reference
        .add(value)
        .then((ref) => SchoolClassDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$SchoolClassCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class SchoolClassDocumentReference extends FirestoreDocumentReference<
    SchoolClass, SchoolClassDocumentSnapshot> {
  factory SchoolClassDocumentReference(
          DocumentReference<SchoolClass> reference) =
      _$SchoolClassDocumentReference;

  DocumentReference<SchoolClass> get reference;

  /// A reference to the [SchoolClassCollectionReference] containing this document.
  SchoolClassCollectionReference get parent {
    return _$SchoolClassCollectionReference(reference.firestore);
  }

  late final ClassScheduleCollectionReference schedule =
      _$ClassScheduleCollectionReference(
    reference,
  );

  @override
  Stream<SchoolClassDocumentSnapshot> snapshots();

  @override
  Future<SchoolClassDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String subjectCode,
    FieldValue subjectCodeFieldValue,
    String name,
    FieldValue nameFieldValue,
    String section,
    FieldValue sectionFieldValue,
    List<ClassSchedule> schedule,
    FieldValue scheduleFieldValue,
    String teacherId,
    FieldValue teacherIdFieldValue,
    int maxAbsences,
    FieldValue maxAbsencesFieldValue,
    Set<String> studentIds,
    FieldValue studentIdsFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String subjectCode,
    FieldValue subjectCodeFieldValue,
    String name,
    FieldValue nameFieldValue,
    String section,
    FieldValue sectionFieldValue,
    List<ClassSchedule> schedule,
    FieldValue scheduleFieldValue,
    String teacherId,
    FieldValue teacherIdFieldValue,
    int maxAbsences,
    FieldValue maxAbsencesFieldValue,
    Set<String> studentIds,
    FieldValue studentIdsFieldValue,
  });
}

class _$SchoolClassDocumentReference
    extends FirestoreDocumentReference<SchoolClass, SchoolClassDocumentSnapshot>
    implements SchoolClassDocumentReference {
  _$SchoolClassDocumentReference(this.reference);

  @override
  final DocumentReference<SchoolClass> reference;

  /// A reference to the [SchoolClassCollectionReference] containing this document.
  SchoolClassCollectionReference get parent {
    return _$SchoolClassCollectionReference(reference.firestore);
  }

  late final ClassScheduleCollectionReference schedule =
      _$ClassScheduleCollectionReference(
    reference,
  );

  @override
  Stream<SchoolClassDocumentSnapshot> snapshots() {
    return reference.snapshots().map(SchoolClassDocumentSnapshot._);
  }

  @override
  Future<SchoolClassDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(SchoolClassDocumentSnapshot._);
  }

  @override
  Future<SchoolClassDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(SchoolClassDocumentSnapshot._);
  }

  Future<void> update({
    Object? subjectCode = _sentinel,
    FieldValue? subjectCodeFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? section = _sentinel,
    FieldValue? sectionFieldValue,
    Object? schedule = _sentinel,
    FieldValue? scheduleFieldValue,
    Object? teacherId = _sentinel,
    FieldValue? teacherIdFieldValue,
    Object? maxAbsences = _sentinel,
    FieldValue? maxAbsencesFieldValue,
    Object? studentIds = _sentinel,
    FieldValue? studentIdsFieldValue,
  }) async {
    assert(
      subjectCode == _sentinel || subjectCodeFieldValue == null,
      "Cannot specify both subjectCode and subjectCodeFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      section == _sentinel || sectionFieldValue == null,
      "Cannot specify both section and sectionFieldValue",
    );
    assert(
      schedule == _sentinel || scheduleFieldValue == null,
      "Cannot specify both schedule and scheduleFieldValue",
    );
    assert(
      teacherId == _sentinel || teacherIdFieldValue == null,
      "Cannot specify both teacherId and teacherIdFieldValue",
    );
    assert(
      maxAbsences == _sentinel || maxAbsencesFieldValue == null,
      "Cannot specify both maxAbsences and maxAbsencesFieldValue",
    );
    assert(
      studentIds == _sentinel || studentIdsFieldValue == null,
      "Cannot specify both studentIds and studentIdsFieldValue",
    );
    final json = {
      if (subjectCode != _sentinel)
        _$SchoolClassFieldMap['subjectCode']!:
            _$SchoolClassPerFieldToJson.subjectCode(subjectCode as String),
      if (subjectCodeFieldValue != null)
        _$SchoolClassFieldMap['subjectCode']!: subjectCodeFieldValue,
      if (name != _sentinel)
        _$SchoolClassFieldMap['name']!:
            _$SchoolClassPerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$SchoolClassFieldMap['name']!: nameFieldValue,
      if (section != _sentinel)
        _$SchoolClassFieldMap['section']!:
            _$SchoolClassPerFieldToJson.section(section as String),
      if (sectionFieldValue != null)
        _$SchoolClassFieldMap['section']!: sectionFieldValue,
      if (schedule != _sentinel)
        _$SchoolClassFieldMap['schedule']!: _$SchoolClassPerFieldToJson
            .schedule(schedule as List<ClassSchedule>),
      if (scheduleFieldValue != null)
        _$SchoolClassFieldMap['schedule']!: scheduleFieldValue,
      if (teacherId != _sentinel)
        _$SchoolClassFieldMap['teacherId']!:
            _$SchoolClassPerFieldToJson.teacherId(teacherId as String),
      if (teacherIdFieldValue != null)
        _$SchoolClassFieldMap['teacherId']!: teacherIdFieldValue,
      if (maxAbsences != _sentinel)
        _$SchoolClassFieldMap['maxAbsences']!:
            _$SchoolClassPerFieldToJson.maxAbsences(maxAbsences as int),
      if (maxAbsencesFieldValue != null)
        _$SchoolClassFieldMap['maxAbsences']!: maxAbsencesFieldValue,
      if (studentIds != _sentinel)
        _$SchoolClassFieldMap['studentIds']!:
            _$SchoolClassPerFieldToJson.studentIds(studentIds as Set<String>),
      if (studentIdsFieldValue != null)
        _$SchoolClassFieldMap['studentIds']!: studentIdsFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? subjectCode = _sentinel,
    FieldValue? subjectCodeFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? section = _sentinel,
    FieldValue? sectionFieldValue,
    Object? schedule = _sentinel,
    FieldValue? scheduleFieldValue,
    Object? teacherId = _sentinel,
    FieldValue? teacherIdFieldValue,
    Object? maxAbsences = _sentinel,
    FieldValue? maxAbsencesFieldValue,
    Object? studentIds = _sentinel,
    FieldValue? studentIdsFieldValue,
  }) {
    assert(
      subjectCode == _sentinel || subjectCodeFieldValue == null,
      "Cannot specify both subjectCode and subjectCodeFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      section == _sentinel || sectionFieldValue == null,
      "Cannot specify both section and sectionFieldValue",
    );
    assert(
      schedule == _sentinel || scheduleFieldValue == null,
      "Cannot specify both schedule and scheduleFieldValue",
    );
    assert(
      teacherId == _sentinel || teacherIdFieldValue == null,
      "Cannot specify both teacherId and teacherIdFieldValue",
    );
    assert(
      maxAbsences == _sentinel || maxAbsencesFieldValue == null,
      "Cannot specify both maxAbsences and maxAbsencesFieldValue",
    );
    assert(
      studentIds == _sentinel || studentIdsFieldValue == null,
      "Cannot specify both studentIds and studentIdsFieldValue",
    );
    final json = {
      if (subjectCode != _sentinel)
        _$SchoolClassFieldMap['subjectCode']!:
            _$SchoolClassPerFieldToJson.subjectCode(subjectCode as String),
      if (subjectCodeFieldValue != null)
        _$SchoolClassFieldMap['subjectCode']!: subjectCodeFieldValue,
      if (name != _sentinel)
        _$SchoolClassFieldMap['name']!:
            _$SchoolClassPerFieldToJson.name(name as String),
      if (nameFieldValue != null)
        _$SchoolClassFieldMap['name']!: nameFieldValue,
      if (section != _sentinel)
        _$SchoolClassFieldMap['section']!:
            _$SchoolClassPerFieldToJson.section(section as String),
      if (sectionFieldValue != null)
        _$SchoolClassFieldMap['section']!: sectionFieldValue,
      if (schedule != _sentinel)
        _$SchoolClassFieldMap['schedule']!: _$SchoolClassPerFieldToJson
            .schedule(schedule as List<ClassSchedule>),
      if (scheduleFieldValue != null)
        _$SchoolClassFieldMap['schedule']!: scheduleFieldValue,
      if (teacherId != _sentinel)
        _$SchoolClassFieldMap['teacherId']!:
            _$SchoolClassPerFieldToJson.teacherId(teacherId as String),
      if (teacherIdFieldValue != null)
        _$SchoolClassFieldMap['teacherId']!: teacherIdFieldValue,
      if (maxAbsences != _sentinel)
        _$SchoolClassFieldMap['maxAbsences']!:
            _$SchoolClassPerFieldToJson.maxAbsences(maxAbsences as int),
      if (maxAbsencesFieldValue != null)
        _$SchoolClassFieldMap['maxAbsences']!: maxAbsencesFieldValue,
      if (studentIds != _sentinel)
        _$SchoolClassFieldMap['studentIds']!:
            _$SchoolClassPerFieldToJson.studentIds(studentIds as Set<String>),
      if (studentIdsFieldValue != null)
        _$SchoolClassFieldMap['studentIds']!: studentIdsFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is SchoolClassDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class SchoolClassQuery
    implements QueryReference<SchoolClass, SchoolClassQuerySnapshot> {
  @override
  SchoolClassQuery limit(int limit);

  @override
  SchoolClassQuery limitToLast(int limit);

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
  SchoolClassQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
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
  SchoolClassQuery whereFieldPath(
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

  SchoolClassQuery whereDocumentId({
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
  SchoolClassQuery whereSubjectCode({
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
  SchoolClassQuery whereName({
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
  SchoolClassQuery whereSection({
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
  SchoolClassQuery whereSchedule({
    List<ClassSchedule>? isEqualTo,
    List<ClassSchedule>? isNotEqualTo,
    List<ClassSchedule>? isLessThan,
    List<ClassSchedule>? isLessThanOrEqualTo,
    List<ClassSchedule>? isGreaterThan,
    List<ClassSchedule>? isGreaterThanOrEqualTo,
    bool? isNull,
    ClassSchedule? arrayContains,
    List<ClassSchedule>? arrayContainsAny,
  });
  SchoolClassQuery whereTeacherId({
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
  SchoolClassQuery whereMaxAbsences({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  SchoolClassQuery whereStudentIds({
    Set<String>? isEqualTo,
    Set<String>? isNotEqualTo,
    Set<String>? isLessThan,
    Set<String>? isLessThanOrEqualTo,
    Set<String>? isGreaterThan,
    Set<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    Set<String>? arrayContainsAny,
  });

  SchoolClassQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  });

  SchoolClassQuery orderBySubjectCode({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  });

  SchoolClassQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  });

  SchoolClassQuery orderBySection({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  });

  SchoolClassQuery orderBySchedule({
    bool descending = false,
    List<ClassSchedule> startAt,
    List<ClassSchedule> startAfter,
    List<ClassSchedule> endAt,
    List<ClassSchedule> endBefore,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  });

  SchoolClassQuery orderByTeacherId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  });

  SchoolClassQuery orderByMaxAbsences({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  });

  SchoolClassQuery orderByStudentIds({
    bool descending = false,
    Set<String> startAt,
    Set<String> startAfter,
    Set<String> endAt,
    Set<String> endBefore,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  });
}

class _$SchoolClassQuery
    extends QueryReference<SchoolClass, SchoolClassQuerySnapshot>
    implements SchoolClassQuery {
  _$SchoolClassQuery(
    this._collection, {
    required Query<SchoolClass> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<SchoolClassQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(SchoolClassQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<SchoolClassQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(SchoolClassQuerySnapshot._fromQuerySnapshot);
  }

  @override
  SchoolClassQuery limit(int limit) {
    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  SchoolClassQuery limitToLast(int limit) {
    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  SchoolClassQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
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
    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  SchoolClassQuery whereFieldPath(
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
    return _$SchoolClassQuery(
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

  SchoolClassQuery whereDocumentId({
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
    return _$SchoolClassQuery(
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

  SchoolClassQuery whereSubjectCode({
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
    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$SchoolClassFieldMap['subjectCode']!,
        isEqualTo: isEqualTo != null
            ? _$SchoolClassPerFieldToJson.subjectCode(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$SchoolClassPerFieldToJson.subjectCode(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$SchoolClassPerFieldToJson.subjectCode(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.subjectCode(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$SchoolClassPerFieldToJson.subjectCode(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.subjectCode(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn:
            whereIn?.map((e) => _$SchoolClassPerFieldToJson.subjectCode(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$SchoolClassPerFieldToJson.subjectCode(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  SchoolClassQuery whereName({
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
    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$SchoolClassFieldMap['name']!,
        isEqualTo: isEqualTo != null
            ? _$SchoolClassPerFieldToJson.name(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$SchoolClassPerFieldToJson.name(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$SchoolClassPerFieldToJson.name(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.name(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$SchoolClassPerFieldToJson.name(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.name(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$SchoolClassPerFieldToJson.name(e)),
        whereNotIn: whereNotIn?.map((e) => _$SchoolClassPerFieldToJson.name(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  SchoolClassQuery whereSection({
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
    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$SchoolClassFieldMap['section']!,
        isEqualTo: isEqualTo != null
            ? _$SchoolClassPerFieldToJson.section(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$SchoolClassPerFieldToJson.section(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$SchoolClassPerFieldToJson.section(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.section(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$SchoolClassPerFieldToJson.section(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.section(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$SchoolClassPerFieldToJson.section(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$SchoolClassPerFieldToJson.section(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  SchoolClassQuery whereSchedule({
    List<ClassSchedule>? isEqualTo,
    List<ClassSchedule>? isNotEqualTo,
    List<ClassSchedule>? isLessThan,
    List<ClassSchedule>? isLessThanOrEqualTo,
    List<ClassSchedule>? isGreaterThan,
    List<ClassSchedule>? isGreaterThanOrEqualTo,
    bool? isNull,
    ClassSchedule? arrayContains,
    List<ClassSchedule>? arrayContainsAny,
  }) {
    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$SchoolClassFieldMap['schedule']!,
        isEqualTo: isEqualTo != null
            ? _$SchoolClassPerFieldToJson.schedule(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$SchoolClassPerFieldToJson.schedule(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$SchoolClassPerFieldToJson.schedule(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.schedule(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$SchoolClassPerFieldToJson.schedule(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.schedule(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        arrayContains: arrayContains != null
            ? (_$SchoolClassPerFieldToJson.schedule([arrayContains]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$SchoolClassPerFieldToJson.schedule(arrayContainsAny)
                as Iterable<Object>?
            : null,
      ),
      $queryCursor: $queryCursor,
    );
  }

  SchoolClassQuery whereTeacherId({
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
    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$SchoolClassFieldMap['teacherId']!,
        isEqualTo: isEqualTo != null
            ? _$SchoolClassPerFieldToJson.teacherId(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$SchoolClassPerFieldToJson.teacherId(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$SchoolClassPerFieldToJson.teacherId(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.teacherId(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$SchoolClassPerFieldToJson.teacherId(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.teacherId(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$SchoolClassPerFieldToJson.teacherId(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$SchoolClassPerFieldToJson.teacherId(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  SchoolClassQuery whereMaxAbsences({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$SchoolClassFieldMap['maxAbsences']!,
        isEqualTo: isEqualTo != null
            ? _$SchoolClassPerFieldToJson.maxAbsences(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$SchoolClassPerFieldToJson.maxAbsences(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$SchoolClassPerFieldToJson.maxAbsences(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.maxAbsences(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$SchoolClassPerFieldToJson.maxAbsences(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.maxAbsences(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn:
            whereIn?.map((e) => _$SchoolClassPerFieldToJson.maxAbsences(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$SchoolClassPerFieldToJson.maxAbsences(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  SchoolClassQuery whereStudentIds({
    Set<String>? isEqualTo,
    Set<String>? isNotEqualTo,
    Set<String>? isLessThan,
    Set<String>? isLessThanOrEqualTo,
    Set<String>? isGreaterThan,
    Set<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    Set<String>? arrayContainsAny,
  }) {
    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$SchoolClassFieldMap['studentIds']!,
        isEqualTo: isEqualTo != null
            ? _$SchoolClassPerFieldToJson.studentIds(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$SchoolClassPerFieldToJson.studentIds(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$SchoolClassPerFieldToJson.studentIds(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.studentIds(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$SchoolClassPerFieldToJson.studentIds(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$SchoolClassPerFieldToJson.studentIds(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        arrayContains: arrayContains != null
            ? (_$SchoolClassPerFieldToJson.studentIds({arrayContains})
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$SchoolClassPerFieldToJson.studentIds(arrayContainsAny)
                as Iterable<Object>?
            : null,
      ),
      $queryCursor: $queryCursor,
    );
  }

  SchoolClassQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
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

    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  SchoolClassQuery orderBySubjectCode({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$SchoolClassFieldMap['subjectCode']!, descending: descending);
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

    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  SchoolClassQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$SchoolClassFieldMap['name']!, descending: descending);
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

    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  SchoolClassQuery orderBySection({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$SchoolClassFieldMap['section']!, descending: descending);
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

    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  SchoolClassQuery orderBySchedule({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$SchoolClassFieldMap['schedule']!, descending: descending);
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

    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  SchoolClassQuery orderByTeacherId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$SchoolClassFieldMap['teacherId']!, descending: descending);
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

    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  SchoolClassQuery orderByMaxAbsences({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$SchoolClassFieldMap['maxAbsences']!, descending: descending);
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

    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  SchoolClassQuery orderByStudentIds({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    SchoolClassDocumentSnapshot? startAtDocument,
    SchoolClassDocumentSnapshot? endAtDocument,
    SchoolClassDocumentSnapshot? endBeforeDocument,
    SchoolClassDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$SchoolClassFieldMap['studentIds']!, descending: descending);
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

    return _$SchoolClassQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$SchoolClassQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class SchoolClassDocumentSnapshot
    extends FirestoreDocumentSnapshot<SchoolClass> {
  SchoolClassDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<SchoolClass> snapshot;

  @override
  SchoolClassDocumentReference get reference {
    return SchoolClassDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final SchoolClass? data;
}

class SchoolClassQuerySnapshot extends FirestoreQuerySnapshot<SchoolClass,
    SchoolClassQueryDocumentSnapshot> {
  SchoolClassQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory SchoolClassQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<SchoolClass> snapshot,
  ) {
    final docs = snapshot.docs.map(SchoolClassQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        SchoolClassDocumentSnapshot._,
      );
    }).toList();

    return SchoolClassQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<SchoolClassDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    SchoolClassDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<SchoolClassDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<SchoolClass> snapshot;

  @override
  final List<SchoolClassQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<SchoolClassDocumentSnapshot>> docChanges;
}

class SchoolClassQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<SchoolClass>
    implements SchoolClassDocumentSnapshot {
  SchoolClassQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<SchoolClass> snapshot;

  @override
  final SchoolClass data;

  @override
  SchoolClassDocumentReference get reference {
    return SchoolClassDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ClassScheduleCollectionReference
    implements
        ClassScheduleQuery,
        FirestoreCollectionReference<ClassSchedule,
            ClassScheduleQuerySnapshot> {
  factory ClassScheduleCollectionReference(
    DocumentReference<SchoolClass> parent,
  ) = _$ClassScheduleCollectionReference;

  static ClassSchedule fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return ClassSchedule.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    ClassSchedule value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<ClassSchedule> get reference;

  /// A reference to the containing [SchoolClassDocumentReference] if this is a subcollection.
  SchoolClassDocumentReference get parent;

  @override
  ClassScheduleDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ClassScheduleDocumentReference> add(ClassSchedule value);
}

class _$ClassScheduleCollectionReference extends _$ClassScheduleQuery
    implements ClassScheduleCollectionReference {
  factory _$ClassScheduleCollectionReference(
    DocumentReference<SchoolClass> parent,
  ) {
    return _$ClassScheduleCollectionReference._(
      SchoolClassDocumentReference(parent),
      parent.collection('schedule').withConverter(
            fromFirestore: ClassScheduleCollectionReference.fromFirestore,
            toFirestore: ClassScheduleCollectionReference.toFirestore,
          ),
    );
  }

  _$ClassScheduleCollectionReference._(
    this.parent,
    CollectionReference<ClassSchedule> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final SchoolClassDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<ClassSchedule> get reference =>
      super.reference as CollectionReference<ClassSchedule>;

  @override
  ClassScheduleDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ClassScheduleDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ClassScheduleDocumentReference> add(ClassSchedule value) {
    return reference
        .add(value)
        .then((ref) => ClassScheduleDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ClassScheduleCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ClassScheduleDocumentReference
    extends FirestoreDocumentReference<ClassSchedule,
        ClassScheduleDocumentSnapshot> {
  factory ClassScheduleDocumentReference(
          DocumentReference<ClassSchedule> reference) =
      _$ClassScheduleDocumentReference;

  DocumentReference<ClassSchedule> get reference;

  /// A reference to the [ClassScheduleCollectionReference] containing this document.
  ClassScheduleCollectionReference get parent {
    return _$ClassScheduleCollectionReference(
      reference.parent.parent!.withConverter<SchoolClass>(
        fromFirestore: SchoolClassCollectionReference.fromFirestore,
        toFirestore: SchoolClassCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ClassScheduleDocumentSnapshot> snapshots();

  @override
  Future<ClassScheduleDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    int weekday,
    FieldValue weekdayFieldValue,
    int startTimeHour,
    FieldValue startTimeHourFieldValue,
    int startTimeMinute,
    FieldValue startTimeMinuteFieldValue,
    int endTimeHour,
    FieldValue endTimeHourFieldValue,
    int endTimeMinute,
    FieldValue endTimeMinuteFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    int weekday,
    FieldValue weekdayFieldValue,
    int startTimeHour,
    FieldValue startTimeHourFieldValue,
    int startTimeMinute,
    FieldValue startTimeMinuteFieldValue,
    int endTimeHour,
    FieldValue endTimeHourFieldValue,
    int endTimeMinute,
    FieldValue endTimeMinuteFieldValue,
  });
}

class _$ClassScheduleDocumentReference extends FirestoreDocumentReference<
    ClassSchedule,
    ClassScheduleDocumentSnapshot> implements ClassScheduleDocumentReference {
  _$ClassScheduleDocumentReference(this.reference);

  @override
  final DocumentReference<ClassSchedule> reference;

  /// A reference to the [ClassScheduleCollectionReference] containing this document.
  ClassScheduleCollectionReference get parent {
    return _$ClassScheduleCollectionReference(
      reference.parent.parent!.withConverter<SchoolClass>(
        fromFirestore: SchoolClassCollectionReference.fromFirestore,
        toFirestore: SchoolClassCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ClassScheduleDocumentSnapshot> snapshots() {
    return reference.snapshots().map(ClassScheduleDocumentSnapshot._);
  }

  @override
  Future<ClassScheduleDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ClassScheduleDocumentSnapshot._);
  }

  @override
  Future<ClassScheduleDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(ClassScheduleDocumentSnapshot._);
  }

  Future<void> update({
    Object? weekday = _sentinel,
    FieldValue? weekdayFieldValue,
    Object? startTimeHour = _sentinel,
    FieldValue? startTimeHourFieldValue,
    Object? startTimeMinute = _sentinel,
    FieldValue? startTimeMinuteFieldValue,
    Object? endTimeHour = _sentinel,
    FieldValue? endTimeHourFieldValue,
    Object? endTimeMinute = _sentinel,
    FieldValue? endTimeMinuteFieldValue,
  }) async {
    assert(
      weekday == _sentinel || weekdayFieldValue == null,
      "Cannot specify both weekday and weekdayFieldValue",
    );
    assert(
      startTimeHour == _sentinel || startTimeHourFieldValue == null,
      "Cannot specify both startTimeHour and startTimeHourFieldValue",
    );
    assert(
      startTimeMinute == _sentinel || startTimeMinuteFieldValue == null,
      "Cannot specify both startTimeMinute and startTimeMinuteFieldValue",
    );
    assert(
      endTimeHour == _sentinel || endTimeHourFieldValue == null,
      "Cannot specify both endTimeHour and endTimeHourFieldValue",
    );
    assert(
      endTimeMinute == _sentinel || endTimeMinuteFieldValue == null,
      "Cannot specify both endTimeMinute and endTimeMinuteFieldValue",
    );
    final json = {
      if (weekday != _sentinel)
        _$ClassScheduleFieldMap['weekday']!:
            _$ClassSchedulePerFieldToJson.weekday(weekday as int),
      if (weekdayFieldValue != null)
        _$ClassScheduleFieldMap['weekday']!: weekdayFieldValue,
      if (startTimeHour != _sentinel)
        _$ClassScheduleFieldMap['startTimeHour']!:
            _$ClassSchedulePerFieldToJson.startTimeHour(startTimeHour as int),
      if (startTimeHourFieldValue != null)
        _$ClassScheduleFieldMap['startTimeHour']!: startTimeHourFieldValue,
      if (startTimeMinute != _sentinel)
        _$ClassScheduleFieldMap['startTimeMinute']!:
            _$ClassSchedulePerFieldToJson
                .startTimeMinute(startTimeMinute as int),
      if (startTimeMinuteFieldValue != null)
        _$ClassScheduleFieldMap['startTimeMinute']!: startTimeMinuteFieldValue,
      if (endTimeHour != _sentinel)
        _$ClassScheduleFieldMap['endTimeHour']!:
            _$ClassSchedulePerFieldToJson.endTimeHour(endTimeHour as int),
      if (endTimeHourFieldValue != null)
        _$ClassScheduleFieldMap['endTimeHour']!: endTimeHourFieldValue,
      if (endTimeMinute != _sentinel)
        _$ClassScheduleFieldMap['endTimeMinute']!:
            _$ClassSchedulePerFieldToJson.endTimeMinute(endTimeMinute as int),
      if (endTimeMinuteFieldValue != null)
        _$ClassScheduleFieldMap['endTimeMinute']!: endTimeMinuteFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? weekday = _sentinel,
    FieldValue? weekdayFieldValue,
    Object? startTimeHour = _sentinel,
    FieldValue? startTimeHourFieldValue,
    Object? startTimeMinute = _sentinel,
    FieldValue? startTimeMinuteFieldValue,
    Object? endTimeHour = _sentinel,
    FieldValue? endTimeHourFieldValue,
    Object? endTimeMinute = _sentinel,
    FieldValue? endTimeMinuteFieldValue,
  }) {
    assert(
      weekday == _sentinel || weekdayFieldValue == null,
      "Cannot specify both weekday and weekdayFieldValue",
    );
    assert(
      startTimeHour == _sentinel || startTimeHourFieldValue == null,
      "Cannot specify both startTimeHour and startTimeHourFieldValue",
    );
    assert(
      startTimeMinute == _sentinel || startTimeMinuteFieldValue == null,
      "Cannot specify both startTimeMinute and startTimeMinuteFieldValue",
    );
    assert(
      endTimeHour == _sentinel || endTimeHourFieldValue == null,
      "Cannot specify both endTimeHour and endTimeHourFieldValue",
    );
    assert(
      endTimeMinute == _sentinel || endTimeMinuteFieldValue == null,
      "Cannot specify both endTimeMinute and endTimeMinuteFieldValue",
    );
    final json = {
      if (weekday != _sentinel)
        _$ClassScheduleFieldMap['weekday']!:
            _$ClassSchedulePerFieldToJson.weekday(weekday as int),
      if (weekdayFieldValue != null)
        _$ClassScheduleFieldMap['weekday']!: weekdayFieldValue,
      if (startTimeHour != _sentinel)
        _$ClassScheduleFieldMap['startTimeHour']!:
            _$ClassSchedulePerFieldToJson.startTimeHour(startTimeHour as int),
      if (startTimeHourFieldValue != null)
        _$ClassScheduleFieldMap['startTimeHour']!: startTimeHourFieldValue,
      if (startTimeMinute != _sentinel)
        _$ClassScheduleFieldMap['startTimeMinute']!:
            _$ClassSchedulePerFieldToJson
                .startTimeMinute(startTimeMinute as int),
      if (startTimeMinuteFieldValue != null)
        _$ClassScheduleFieldMap['startTimeMinute']!: startTimeMinuteFieldValue,
      if (endTimeHour != _sentinel)
        _$ClassScheduleFieldMap['endTimeHour']!:
            _$ClassSchedulePerFieldToJson.endTimeHour(endTimeHour as int),
      if (endTimeHourFieldValue != null)
        _$ClassScheduleFieldMap['endTimeHour']!: endTimeHourFieldValue,
      if (endTimeMinute != _sentinel)
        _$ClassScheduleFieldMap['endTimeMinute']!:
            _$ClassSchedulePerFieldToJson.endTimeMinute(endTimeMinute as int),
      if (endTimeMinuteFieldValue != null)
        _$ClassScheduleFieldMap['endTimeMinute']!: endTimeMinuteFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is ClassScheduleDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class ClassScheduleQuery
    implements QueryReference<ClassSchedule, ClassScheduleQuerySnapshot> {
  @override
  ClassScheduleQuery limit(int limit);

  @override
  ClassScheduleQuery limitToLast(int limit);

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
  ClassScheduleQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
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
  ClassScheduleQuery whereFieldPath(
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

  ClassScheduleQuery whereDocumentId({
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
  ClassScheduleQuery whereWeekday({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  ClassScheduleQuery whereStartTimeHour({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  ClassScheduleQuery whereStartTimeMinute({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  ClassScheduleQuery whereEndTimeHour({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  ClassScheduleQuery whereEndTimeMinute({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });

  ClassScheduleQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
  });

  ClassScheduleQuery orderByWeekday({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
  });

  ClassScheduleQuery orderByStartTimeHour({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
  });

  ClassScheduleQuery orderByStartTimeMinute({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
  });

  ClassScheduleQuery orderByEndTimeHour({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
  });

  ClassScheduleQuery orderByEndTimeMinute({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
  });
}

class _$ClassScheduleQuery
    extends QueryReference<ClassSchedule, ClassScheduleQuerySnapshot>
    implements ClassScheduleQuery {
  _$ClassScheduleQuery(
    this._collection, {
    required Query<ClassSchedule> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<ClassScheduleQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(ClassScheduleQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<ClassScheduleQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(ClassScheduleQuerySnapshot._fromQuerySnapshot);
  }

  @override
  ClassScheduleQuery limit(int limit) {
    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ClassScheduleQuery limitToLast(int limit) {
    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  ClassScheduleQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
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
    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ClassScheduleQuery whereFieldPath(
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
    return _$ClassScheduleQuery(
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

  ClassScheduleQuery whereDocumentId({
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
    return _$ClassScheduleQuery(
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

  ClassScheduleQuery whereWeekday({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ClassScheduleFieldMap['weekday']!,
        isEqualTo: isEqualTo != null
            ? _$ClassSchedulePerFieldToJson.weekday(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$ClassSchedulePerFieldToJson.weekday(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$ClassSchedulePerFieldToJson.weekday(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ClassSchedulePerFieldToJson.weekday(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ClassSchedulePerFieldToJson.weekday(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ClassSchedulePerFieldToJson.weekday(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$ClassSchedulePerFieldToJson.weekday(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$ClassSchedulePerFieldToJson.weekday(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  ClassScheduleQuery whereStartTimeHour({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ClassScheduleFieldMap['startTimeHour']!,
        isEqualTo: isEqualTo != null
            ? _$ClassSchedulePerFieldToJson.startTimeHour(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$ClassSchedulePerFieldToJson.startTimeHour(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$ClassSchedulePerFieldToJson.startTimeHour(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ClassSchedulePerFieldToJson.startTimeHour(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ClassSchedulePerFieldToJson.startTimeHour(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ClassSchedulePerFieldToJson
                .startTimeHour(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn:
            whereIn?.map((e) => _$ClassSchedulePerFieldToJson.startTimeHour(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$ClassSchedulePerFieldToJson.startTimeHour(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  ClassScheduleQuery whereStartTimeMinute({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ClassScheduleFieldMap['startTimeMinute']!,
        isEqualTo: isEqualTo != null
            ? _$ClassSchedulePerFieldToJson.startTimeMinute(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$ClassSchedulePerFieldToJson.startTimeMinute(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$ClassSchedulePerFieldToJson.startTimeMinute(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ClassSchedulePerFieldToJson.startTimeMinute(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ClassSchedulePerFieldToJson.startTimeMinute(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ClassSchedulePerFieldToJson
                .startTimeMinute(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn
            ?.map((e) => _$ClassSchedulePerFieldToJson.startTimeMinute(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$ClassSchedulePerFieldToJson.startTimeMinute(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  ClassScheduleQuery whereEndTimeHour({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ClassScheduleFieldMap['endTimeHour']!,
        isEqualTo: isEqualTo != null
            ? _$ClassSchedulePerFieldToJson.endTimeHour(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$ClassSchedulePerFieldToJson.endTimeHour(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$ClassSchedulePerFieldToJson.endTimeHour(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ClassSchedulePerFieldToJson.endTimeHour(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ClassSchedulePerFieldToJson.endTimeHour(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ClassSchedulePerFieldToJson.endTimeHour(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn:
            whereIn?.map((e) => _$ClassSchedulePerFieldToJson.endTimeHour(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$ClassSchedulePerFieldToJson.endTimeHour(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  ClassScheduleQuery whereEndTimeMinute({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$ClassScheduleFieldMap['endTimeMinute']!,
        isEqualTo: isEqualTo != null
            ? _$ClassSchedulePerFieldToJson.endTimeMinute(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$ClassSchedulePerFieldToJson.endTimeMinute(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$ClassSchedulePerFieldToJson.endTimeMinute(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$ClassSchedulePerFieldToJson.endTimeMinute(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$ClassSchedulePerFieldToJson.endTimeMinute(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$ClassSchedulePerFieldToJson
                .endTimeMinute(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn:
            whereIn?.map((e) => _$ClassSchedulePerFieldToJson.endTimeMinute(e)),
        whereNotIn: whereNotIn
            ?.map((e) => _$ClassSchedulePerFieldToJson.endTimeMinute(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  ClassScheduleQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
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

    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ClassScheduleQuery orderByWeekday({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$ClassScheduleFieldMap['weekday']!, descending: descending);
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

    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ClassScheduleQuery orderByStartTimeHour({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ClassScheduleFieldMap['startTimeHour']!,
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

    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ClassScheduleQuery orderByStartTimeMinute({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ClassScheduleFieldMap['startTimeMinute']!,
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

    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ClassScheduleQuery orderByEndTimeHour({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ClassScheduleFieldMap['endTimeHour']!,
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

    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  ClassScheduleQuery orderByEndTimeMinute({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ClassScheduleDocumentSnapshot? startAtDocument,
    ClassScheduleDocumentSnapshot? endAtDocument,
    ClassScheduleDocumentSnapshot? endBeforeDocument,
    ClassScheduleDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(
        _$ClassScheduleFieldMap['endTimeMinute']!,
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

    return _$ClassScheduleQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$ClassScheduleQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ClassScheduleDocumentSnapshot
    extends FirestoreDocumentSnapshot<ClassSchedule> {
  ClassScheduleDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<ClassSchedule> snapshot;

  @override
  ClassScheduleDocumentReference get reference {
    return ClassScheduleDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ClassSchedule? data;
}

class ClassScheduleQuerySnapshot extends FirestoreQuerySnapshot<ClassSchedule,
    ClassScheduleQueryDocumentSnapshot> {
  ClassScheduleQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory ClassScheduleQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<ClassSchedule> snapshot,
  ) {
    final docs =
        snapshot.docs.map(ClassScheduleQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        ClassScheduleDocumentSnapshot._,
      );
    }).toList();

    return ClassScheduleQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<ClassScheduleDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    ClassScheduleDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<ClassScheduleDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<ClassSchedule> snapshot;

  @override
  final List<ClassScheduleQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ClassScheduleDocumentSnapshot>> docChanges;
}

class ClassScheduleQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<ClassSchedule>
    implements ClassScheduleDocumentSnapshot {
  ClassScheduleQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<ClassSchedule> snapshot;

  @override
  final ClassSchedule data;

  @override
  ClassScheduleDocumentReference get reference {
    return ClassScheduleDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolClass _$SchoolClassFromJson(Map<String, dynamic> json) => SchoolClass(
      id: json['id'] as String,
      subjectCode: json['subjectCode'] as String,
      name: json['name'] as String,
      section: json['section'] as String,
      schedule: (json['schedule'] as List<dynamic>)
          .map((e) => ClassSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      teacherId: json['teacherId'] as String,
      studentIds: (json['studentIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet(),
      maxAbsences: json['maxAbsences'] as int?,
    );

const _$SchoolClassFieldMap = <String, String>{
  'id': 'id',
  'subjectCode': 'subjectCode',
  'name': 'name',
  'section': 'section',
  'schedule': 'schedule',
  'teacherId': 'teacherId',
  'maxAbsences': 'maxAbsences',
  'studentIds': 'studentIds',
};

// ignore: unused_element
abstract class _$SchoolClassPerFieldToJson {
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? subjectCode(String instance) => instance;
  // ignore: unused_element
  static Object? name(String instance) => instance;
  // ignore: unused_element
  static Object? section(String instance) => instance;
  // ignore: unused_element
  static Object? schedule(List<ClassSchedule> instance) =>
      instance.map((e) => e.toJson()).toList();
  // ignore: unused_element
  static Object? teacherId(String instance) => instance;
  // ignore: unused_element
  static Object? maxAbsences(int instance) => instance;
  // ignore: unused_element
  static Object? studentIds(Set<String> instance) => instance.toList();
}

Map<String, dynamic> _$SchoolClassToJson(SchoolClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectCode': instance.subjectCode,
      'name': instance.name,
      'section': instance.section,
      'schedule': instance.schedule.map((e) => e.toJson()).toList(),
      'teacherId': instance.teacherId,
      'maxAbsences': instance.maxAbsences,
      'studentIds': instance.studentIds.toList(),
    };

ClassSchedule _$ClassScheduleFromJson(Map<String, dynamic> json) =>
    ClassSchedule(
      weekday: json['weekday'] as int,
      startTimeHour: json['startTimeHour'] as int,
      startTimeMinute: json['startTimeMinute'] as int,
      endTimeHour: json['endTimeHour'] as int,
      endTimeMinute: json['endTimeMinute'] as int,
    );

const _$ClassScheduleFieldMap = <String, String>{
  'weekday': 'weekday',
  'startTimeHour': 'startTimeHour',
  'startTimeMinute': 'startTimeMinute',
  'endTimeHour': 'endTimeHour',
  'endTimeMinute': 'endTimeMinute',
};

// ignore: unused_element
abstract class _$ClassSchedulePerFieldToJson {
  // ignore: unused_element
  static Object? weekday(int instance) => instance;
  // ignore: unused_element
  static Object? startTimeHour(int instance) => instance;
  // ignore: unused_element
  static Object? startTimeMinute(int instance) => instance;
  // ignore: unused_element
  static Object? endTimeHour(int instance) => instance;
  // ignore: unused_element
  static Object? endTimeMinute(int instance) => instance;
}

Map<String, dynamic> _$ClassScheduleToJson(ClassSchedule instance) =>
    <String, dynamic>{
      'weekday': instance.weekday,
      'startTimeHour': instance.startTimeHour,
      'startTimeMinute': instance.startTimeMinute,
      'endTimeHour': instance.endTimeHour,
      'endTimeMinute': instance.endTimeMinute,
    };

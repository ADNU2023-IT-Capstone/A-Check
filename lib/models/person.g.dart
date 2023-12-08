// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

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
abstract class StudentCollectionReference
    implements
        StudentQuery,
        FirestoreCollectionReference<Student, StudentQuerySnapshot> {
  factory StudentCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$StudentCollectionReference;

  static Student fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Student.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Student value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<Student> get reference;

  @override
  StudentDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<StudentDocumentReference> add(Student value);
}

class _$StudentCollectionReference extends _$StudentQuery
    implements StudentCollectionReference {
  factory _$StudentCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$StudentCollectionReference._(
      firestore.collection('students').withConverter(
            fromFirestore: StudentCollectionReference.fromFirestore,
            toFirestore: StudentCollectionReference.toFirestore,
          ),
    );
  }

  _$StudentCollectionReference._(
    CollectionReference<Student> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Student> get reference =>
      super.reference as CollectionReference<Student>;

  @override
  StudentDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return StudentDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<StudentDocumentReference> add(Student value) {
    return reference.add(value).then((ref) => StudentDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$StudentCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class StudentDocumentReference
    extends FirestoreDocumentReference<Student, StudentDocumentSnapshot> {
  factory StudentDocumentReference(DocumentReference<Student> reference) =
      _$StudentDocumentReference;

  DocumentReference<Student> get reference;

  /// A reference to the [StudentCollectionReference] containing this document.
  StudentCollectionReference get parent {
    return _$StudentCollectionReference(reference.firestore);
  }

  @override
  Stream<StudentDocumentSnapshot> snapshots();

  @override
  Future<StudentDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String photoPath,
    FieldValue photoPathFieldValue,
    List<String> guardianIds,
    FieldValue guardianIdsFieldValue,
    List<dynamic> faceArray,
    FieldValue faceArrayFieldValue,
    String firstName,
    FieldValue firstNameFieldValue,
    String middleName,
    FieldValue middleNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? phoneNumber,
    FieldValue phoneNumberFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String photoPath,
    FieldValue photoPathFieldValue,
    List<String> guardianIds,
    FieldValue guardianIdsFieldValue,
    List<dynamic> faceArray,
    FieldValue faceArrayFieldValue,
    String firstName,
    FieldValue firstNameFieldValue,
    String middleName,
    FieldValue middleNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? phoneNumber,
    FieldValue phoneNumberFieldValue,
  });
}

class _$StudentDocumentReference
    extends FirestoreDocumentReference<Student, StudentDocumentSnapshot>
    implements StudentDocumentReference {
  _$StudentDocumentReference(this.reference);

  @override
  final DocumentReference<Student> reference;

  /// A reference to the [StudentCollectionReference] containing this document.
  StudentCollectionReference get parent {
    return _$StudentCollectionReference(reference.firestore);
  }

  @override
  Stream<StudentDocumentSnapshot> snapshots() {
    return reference.snapshots().map(StudentDocumentSnapshot._);
  }

  @override
  Future<StudentDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(StudentDocumentSnapshot._);
  }

  @override
  Future<StudentDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(StudentDocumentSnapshot._);
  }

  Future<void> update({
    Object? photoPath = _sentinel,
    FieldValue? photoPathFieldValue,
    Object? guardianIds = _sentinel,
    FieldValue? guardianIdsFieldValue,
    Object? faceArray = _sentinel,
    FieldValue? faceArrayFieldValue,
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? middleName = _sentinel,
    FieldValue? middleNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? phoneNumber = _sentinel,
    FieldValue? phoneNumberFieldValue,
  }) async {
    assert(
      photoPath == _sentinel || photoPathFieldValue == null,
      "Cannot specify both photoPath and photoPathFieldValue",
    );
    assert(
      guardianIds == _sentinel || guardianIdsFieldValue == null,
      "Cannot specify both guardianIds and guardianIdsFieldValue",
    );
    assert(
      faceArray == _sentinel || faceArrayFieldValue == null,
      "Cannot specify both faceArray and faceArrayFieldValue",
    );
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      middleName == _sentinel || middleNameFieldValue == null,
      "Cannot specify both middleName and middleNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      phoneNumber == _sentinel || phoneNumberFieldValue == null,
      "Cannot specify both phoneNumber and phoneNumberFieldValue",
    );
    final json = {
      if (photoPath != _sentinel)
        _$StudentFieldMap['photoPath']!:
            _$StudentPerFieldToJson.photoPath(photoPath as String),
      if (photoPathFieldValue != null)
        _$StudentFieldMap['photoPath']!: photoPathFieldValue,
      if (guardianIds != _sentinel)
        _$StudentFieldMap['guardianIds']!:
            _$StudentPerFieldToJson.guardianIds(guardianIds as List<String>),
      if (guardianIdsFieldValue != null)
        _$StudentFieldMap['guardianIds']!: guardianIdsFieldValue,
      if (faceArray != _sentinel)
        _$StudentFieldMap['faceArray']!:
            _$StudentPerFieldToJson.faceArray(faceArray as List<dynamic>),
      if (faceArrayFieldValue != null)
        _$StudentFieldMap['faceArray']!: faceArrayFieldValue,
      if (firstName != _sentinel)
        _$StudentFieldMap['firstName']!:
            _$StudentPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$StudentFieldMap['firstName']!: firstNameFieldValue,
      if (middleName != _sentinel)
        _$StudentFieldMap['middleName']!:
            _$StudentPerFieldToJson.middleName(middleName as String),
      if (middleNameFieldValue != null)
        _$StudentFieldMap['middleName']!: middleNameFieldValue,
      if (lastName != _sentinel)
        _$StudentFieldMap['lastName']!:
            _$StudentPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$StudentFieldMap['lastName']!: lastNameFieldValue,
      if (email != _sentinel)
        _$StudentFieldMap['email']!:
            _$StudentPerFieldToJson.email(email as String?),
      if (emailFieldValue != null) _$StudentFieldMap['email']!: emailFieldValue,
      if (phoneNumber != _sentinel)
        _$StudentFieldMap['phoneNumber']!:
            _$StudentPerFieldToJson.phoneNumber(phoneNumber as String?),
      if (phoneNumberFieldValue != null)
        _$StudentFieldMap['phoneNumber']!: phoneNumberFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? photoPath = _sentinel,
    FieldValue? photoPathFieldValue,
    Object? guardianIds = _sentinel,
    FieldValue? guardianIdsFieldValue,
    Object? faceArray = _sentinel,
    FieldValue? faceArrayFieldValue,
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? middleName = _sentinel,
    FieldValue? middleNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? phoneNumber = _sentinel,
    FieldValue? phoneNumberFieldValue,
  }) {
    assert(
      photoPath == _sentinel || photoPathFieldValue == null,
      "Cannot specify both photoPath and photoPathFieldValue",
    );
    assert(
      guardianIds == _sentinel || guardianIdsFieldValue == null,
      "Cannot specify both guardianIds and guardianIdsFieldValue",
    );
    assert(
      faceArray == _sentinel || faceArrayFieldValue == null,
      "Cannot specify both faceArray and faceArrayFieldValue",
    );
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      middleName == _sentinel || middleNameFieldValue == null,
      "Cannot specify both middleName and middleNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      phoneNumber == _sentinel || phoneNumberFieldValue == null,
      "Cannot specify both phoneNumber and phoneNumberFieldValue",
    );
    final json = {
      if (photoPath != _sentinel)
        _$StudentFieldMap['photoPath']!:
            _$StudentPerFieldToJson.photoPath(photoPath as String),
      if (photoPathFieldValue != null)
        _$StudentFieldMap['photoPath']!: photoPathFieldValue,
      if (guardianIds != _sentinel)
        _$StudentFieldMap['guardianIds']!:
            _$StudentPerFieldToJson.guardianIds(guardianIds as List<String>),
      if (guardianIdsFieldValue != null)
        _$StudentFieldMap['guardianIds']!: guardianIdsFieldValue,
      if (faceArray != _sentinel)
        _$StudentFieldMap['faceArray']!:
            _$StudentPerFieldToJson.faceArray(faceArray as List<dynamic>),
      if (faceArrayFieldValue != null)
        _$StudentFieldMap['faceArray']!: faceArrayFieldValue,
      if (firstName != _sentinel)
        _$StudentFieldMap['firstName']!:
            _$StudentPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$StudentFieldMap['firstName']!: firstNameFieldValue,
      if (middleName != _sentinel)
        _$StudentFieldMap['middleName']!:
            _$StudentPerFieldToJson.middleName(middleName as String),
      if (middleNameFieldValue != null)
        _$StudentFieldMap['middleName']!: middleNameFieldValue,
      if (lastName != _sentinel)
        _$StudentFieldMap['lastName']!:
            _$StudentPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$StudentFieldMap['lastName']!: lastNameFieldValue,
      if (email != _sentinel)
        _$StudentFieldMap['email']!:
            _$StudentPerFieldToJson.email(email as String?),
      if (emailFieldValue != null) _$StudentFieldMap['email']!: emailFieldValue,
      if (phoneNumber != _sentinel)
        _$StudentFieldMap['phoneNumber']!:
            _$StudentPerFieldToJson.phoneNumber(phoneNumber as String?),
      if (phoneNumberFieldValue != null)
        _$StudentFieldMap['phoneNumber']!: phoneNumberFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is StudentDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class StudentQuery
    implements QueryReference<Student, StudentQuerySnapshot> {
  @override
  StudentQuery limit(int limit);

  @override
  StudentQuery limitToLast(int limit);

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
  StudentQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
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
  StudentQuery whereFieldPath(
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

  StudentQuery whereDocumentId({
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
  StudentQuery wherePhotoPath({
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
  StudentQuery whereGuardianIds({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  });
  StudentQuery whereFaceArray({
    List<dynamic>? isEqualTo,
    List<dynamic>? isNotEqualTo,
    List<dynamic>? isLessThan,
    List<dynamic>? isLessThanOrEqualTo,
    List<dynamic>? isGreaterThan,
    List<dynamic>? isGreaterThanOrEqualTo,
    bool? isNull,
    dynamic arrayContains,
    List<dynamic>? arrayContainsAny,
  });
  StudentQuery whereFirstName({
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
  StudentQuery whereMiddleName({
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
  StudentQuery whereLastName({
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
  StudentQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  StudentQuery wherePhoneNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  StudentQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  });

  StudentQuery orderByPhotoPath({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  });

  StudentQuery orderByGuardianIds({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  });

  StudentQuery orderByFaceArray({
    bool descending = false,
    List<dynamic> startAt,
    List<dynamic> startAfter,
    List<dynamic> endAt,
    List<dynamic> endBefore,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  });

  StudentQuery orderByFirstName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  });

  StudentQuery orderByMiddleName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  });

  StudentQuery orderByLastName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  });

  StudentQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  });

  StudentQuery orderByPhoneNumber({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  });
}

class _$StudentQuery extends QueryReference<Student, StudentQuerySnapshot>
    implements StudentQuery {
  _$StudentQuery(
    this._collection, {
    required Query<Student> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<StudentQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(StudentQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<StudentQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(StudentQuerySnapshot._fromQuerySnapshot);
  }

  @override
  StudentQuery limit(int limit) {
    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  StudentQuery limitToLast(int limit) {
    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  StudentQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
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
    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  StudentQuery whereFieldPath(
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
    return _$StudentQuery(
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

  StudentQuery whereDocumentId({
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
    return _$StudentQuery(
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

  StudentQuery wherePhotoPath({
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
    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$StudentFieldMap['photoPath']!,
        isEqualTo: isEqualTo != null
            ? _$StudentPerFieldToJson.photoPath(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$StudentPerFieldToJson.photoPath(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$StudentPerFieldToJson.photoPath(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$StudentPerFieldToJson.photoPath(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$StudentPerFieldToJson.photoPath(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$StudentPerFieldToJson.photoPath(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$StudentPerFieldToJson.photoPath(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$StudentPerFieldToJson.photoPath(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  StudentQuery whereGuardianIds({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  }) {
    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$StudentFieldMap['guardianIds']!,
        isEqualTo: isEqualTo != null
            ? _$StudentPerFieldToJson.guardianIds(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$StudentPerFieldToJson.guardianIds(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$StudentPerFieldToJson.guardianIds(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$StudentPerFieldToJson.guardianIds(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$StudentPerFieldToJson.guardianIds(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$StudentPerFieldToJson.guardianIds(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        arrayContains: arrayContains != null
            ? (_$StudentPerFieldToJson.guardianIds([arrayContains]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$StudentPerFieldToJson.guardianIds(arrayContainsAny)
                as Iterable<Object>?
            : null,
      ),
      $queryCursor: $queryCursor,
    );
  }

  StudentQuery whereFaceArray({
    List<dynamic>? isEqualTo,
    List<dynamic>? isNotEqualTo,
    List<dynamic>? isLessThan,
    List<dynamic>? isLessThanOrEqualTo,
    List<dynamic>? isGreaterThan,
    List<dynamic>? isGreaterThanOrEqualTo,
    bool? isNull,
    dynamic arrayContains,
    List<dynamic>? arrayContainsAny,
  }) {
    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$StudentFieldMap['faceArray']!,
        isEqualTo: isEqualTo != null
            ? _$StudentPerFieldToJson.faceArray(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$StudentPerFieldToJson.faceArray(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$StudentPerFieldToJson.faceArray(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$StudentPerFieldToJson.faceArray(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$StudentPerFieldToJson.faceArray(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$StudentPerFieldToJson.faceArray(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        arrayContains: arrayContains != null
            ? (_$StudentPerFieldToJson.faceArray([arrayContains]) as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$StudentPerFieldToJson.faceArray(arrayContainsAny)
                as Iterable<Object>?
            : null,
      ),
      $queryCursor: $queryCursor,
    );
  }

  StudentQuery whereFirstName({
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
    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$StudentFieldMap['firstName']!,
        isEqualTo: isEqualTo != null
            ? _$StudentPerFieldToJson.firstName(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$StudentPerFieldToJson.firstName(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$StudentPerFieldToJson.firstName(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$StudentPerFieldToJson.firstName(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$StudentPerFieldToJson.firstName(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$StudentPerFieldToJson.firstName(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$StudentPerFieldToJson.firstName(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$StudentPerFieldToJson.firstName(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  StudentQuery whereMiddleName({
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
    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$StudentFieldMap['middleName']!,
        isEqualTo: isEqualTo != null
            ? _$StudentPerFieldToJson.middleName(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$StudentPerFieldToJson.middleName(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$StudentPerFieldToJson.middleName(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$StudentPerFieldToJson.middleName(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$StudentPerFieldToJson.middleName(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$StudentPerFieldToJson.middleName(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$StudentPerFieldToJson.middleName(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$StudentPerFieldToJson.middleName(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  StudentQuery whereLastName({
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
    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$StudentFieldMap['lastName']!,
        isEqualTo: isEqualTo != null
            ? _$StudentPerFieldToJson.lastName(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$StudentPerFieldToJson.lastName(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$StudentPerFieldToJson.lastName(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$StudentPerFieldToJson.lastName(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$StudentPerFieldToJson.lastName(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$StudentPerFieldToJson.lastName(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$StudentPerFieldToJson.lastName(e)),
        whereNotIn: whereNotIn?.map((e) => _$StudentPerFieldToJson.lastName(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  StudentQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$StudentFieldMap['email']!,
        isEqualTo:
            isEqualTo != null ? _$StudentPerFieldToJson.email(isEqualTo) : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$StudentPerFieldToJson.email(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$StudentPerFieldToJson.email(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$StudentPerFieldToJson.email(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$StudentPerFieldToJson.email(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$StudentPerFieldToJson.email(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$StudentPerFieldToJson.email(e)),
        whereNotIn: whereNotIn?.map((e) => _$StudentPerFieldToJson.email(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  StudentQuery wherePhoneNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$StudentFieldMap['phoneNumber']!,
        isEqualTo: isEqualTo != null
            ? _$StudentPerFieldToJson.phoneNumber(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$StudentPerFieldToJson.phoneNumber(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$StudentPerFieldToJson.phoneNumber(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$StudentPerFieldToJson.phoneNumber(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$StudentPerFieldToJson.phoneNumber(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$StudentPerFieldToJson.phoneNumber(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$StudentPerFieldToJson.phoneNumber(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$StudentPerFieldToJson.phoneNumber(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  StudentQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
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

    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  StudentQuery orderByPhotoPath({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$StudentFieldMap['photoPath']!, descending: descending);
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

    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  StudentQuery orderByGuardianIds({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$StudentFieldMap['guardianIds']!, descending: descending);
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

    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  StudentQuery orderByFaceArray({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$StudentFieldMap['faceArray']!, descending: descending);
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

    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  StudentQuery orderByFirstName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$StudentFieldMap['firstName']!, descending: descending);
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

    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  StudentQuery orderByMiddleName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$StudentFieldMap['middleName']!, descending: descending);
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

    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  StudentQuery orderByLastName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$StudentFieldMap['lastName']!, descending: descending);
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

    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  StudentQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$StudentFieldMap['email']!,
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

    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  StudentQuery orderByPhoneNumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    StudentDocumentSnapshot? startAtDocument,
    StudentDocumentSnapshot? endAtDocument,
    StudentDocumentSnapshot? endBeforeDocument,
    StudentDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$StudentFieldMap['phoneNumber']!, descending: descending);
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

    return _$StudentQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$StudentQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class StudentDocumentSnapshot extends FirestoreDocumentSnapshot<Student> {
  StudentDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Student> snapshot;

  @override
  StudentDocumentReference get reference {
    return StudentDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Student? data;
}

class StudentQuerySnapshot
    extends FirestoreQuerySnapshot<Student, StudentQueryDocumentSnapshot> {
  StudentQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory StudentQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Student> snapshot,
  ) {
    final docs = snapshot.docs.map(StudentQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        StudentDocumentSnapshot._,
      );
    }).toList();

    return StudentQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<StudentDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    StudentDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<StudentDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Student> snapshot;

  @override
  final List<StudentQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<StudentDocumentSnapshot>> docChanges;
}

class StudentQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Student>
    implements StudentDocumentSnapshot {
  StudentQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Student> snapshot;

  @override
  final Student data;

  @override
  StudentDocumentReference get reference {
    return StudentDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class GuardianCollectionReference
    implements
        GuardianQuery,
        FirestoreCollectionReference<Guardian, GuardianQuerySnapshot> {
  factory GuardianCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$GuardianCollectionReference;

  static Guardian fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Guardian.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Guardian value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<Guardian> get reference;

  @override
  GuardianDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<GuardianDocumentReference> add(Guardian value);
}

class _$GuardianCollectionReference extends _$GuardianQuery
    implements GuardianCollectionReference {
  factory _$GuardianCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$GuardianCollectionReference._(
      firestore.collection('guardians').withConverter(
            fromFirestore: GuardianCollectionReference.fromFirestore,
            toFirestore: GuardianCollectionReference.toFirestore,
          ),
    );
  }

  _$GuardianCollectionReference._(
    CollectionReference<Guardian> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Guardian> get reference =>
      super.reference as CollectionReference<Guardian>;

  @override
  GuardianDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return GuardianDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<GuardianDocumentReference> add(Guardian value) {
    return reference.add(value).then((ref) => GuardianDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$GuardianCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class GuardianDocumentReference
    extends FirestoreDocumentReference<Guardian, GuardianDocumentSnapshot> {
  factory GuardianDocumentReference(DocumentReference<Guardian> reference) =
      _$GuardianDocumentReference;

  DocumentReference<Guardian> get reference;

  /// A reference to the [GuardianCollectionReference] containing this document.
  GuardianCollectionReference get parent {
    return _$GuardianCollectionReference(reference.firestore);
  }

  @override
  Stream<GuardianDocumentSnapshot> snapshots();

  @override
  Future<GuardianDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String firstName,
    FieldValue firstNameFieldValue,
    String middleName,
    FieldValue middleNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? phoneNumber,
    FieldValue phoneNumberFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String firstName,
    FieldValue firstNameFieldValue,
    String middleName,
    FieldValue middleNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? phoneNumber,
    FieldValue phoneNumberFieldValue,
  });
}

class _$GuardianDocumentReference
    extends FirestoreDocumentReference<Guardian, GuardianDocumentSnapshot>
    implements GuardianDocumentReference {
  _$GuardianDocumentReference(this.reference);

  @override
  final DocumentReference<Guardian> reference;

  /// A reference to the [GuardianCollectionReference] containing this document.
  GuardianCollectionReference get parent {
    return _$GuardianCollectionReference(reference.firestore);
  }

  @override
  Stream<GuardianDocumentSnapshot> snapshots() {
    return reference.snapshots().map(GuardianDocumentSnapshot._);
  }

  @override
  Future<GuardianDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(GuardianDocumentSnapshot._);
  }

  @override
  Future<GuardianDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(GuardianDocumentSnapshot._);
  }

  Future<void> update({
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? middleName = _sentinel,
    FieldValue? middleNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? phoneNumber = _sentinel,
    FieldValue? phoneNumberFieldValue,
  }) async {
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      middleName == _sentinel || middleNameFieldValue == null,
      "Cannot specify both middleName and middleNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      phoneNumber == _sentinel || phoneNumberFieldValue == null,
      "Cannot specify both phoneNumber and phoneNumberFieldValue",
    );
    final json = {
      if (firstName != _sentinel)
        _$GuardianFieldMap['firstName']!:
            _$GuardianPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$GuardianFieldMap['firstName']!: firstNameFieldValue,
      if (middleName != _sentinel)
        _$GuardianFieldMap['middleName']!:
            _$GuardianPerFieldToJson.middleName(middleName as String),
      if (middleNameFieldValue != null)
        _$GuardianFieldMap['middleName']!: middleNameFieldValue,
      if (lastName != _sentinel)
        _$GuardianFieldMap['lastName']!:
            _$GuardianPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$GuardianFieldMap['lastName']!: lastNameFieldValue,
      if (email != _sentinel)
        _$GuardianFieldMap['email']!:
            _$GuardianPerFieldToJson.email(email as String?),
      if (emailFieldValue != null)
        _$GuardianFieldMap['email']!: emailFieldValue,
      if (phoneNumber != _sentinel)
        _$GuardianFieldMap['phoneNumber']!:
            _$GuardianPerFieldToJson.phoneNumber(phoneNumber as String?),
      if (phoneNumberFieldValue != null)
        _$GuardianFieldMap['phoneNumber']!: phoneNumberFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? middleName = _sentinel,
    FieldValue? middleNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? phoneNumber = _sentinel,
    FieldValue? phoneNumberFieldValue,
  }) {
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      middleName == _sentinel || middleNameFieldValue == null,
      "Cannot specify both middleName and middleNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      phoneNumber == _sentinel || phoneNumberFieldValue == null,
      "Cannot specify both phoneNumber and phoneNumberFieldValue",
    );
    final json = {
      if (firstName != _sentinel)
        _$GuardianFieldMap['firstName']!:
            _$GuardianPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$GuardianFieldMap['firstName']!: firstNameFieldValue,
      if (middleName != _sentinel)
        _$GuardianFieldMap['middleName']!:
            _$GuardianPerFieldToJson.middleName(middleName as String),
      if (middleNameFieldValue != null)
        _$GuardianFieldMap['middleName']!: middleNameFieldValue,
      if (lastName != _sentinel)
        _$GuardianFieldMap['lastName']!:
            _$GuardianPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$GuardianFieldMap['lastName']!: lastNameFieldValue,
      if (email != _sentinel)
        _$GuardianFieldMap['email']!:
            _$GuardianPerFieldToJson.email(email as String?),
      if (emailFieldValue != null)
        _$GuardianFieldMap['email']!: emailFieldValue,
      if (phoneNumber != _sentinel)
        _$GuardianFieldMap['phoneNumber']!:
            _$GuardianPerFieldToJson.phoneNumber(phoneNumber as String?),
      if (phoneNumberFieldValue != null)
        _$GuardianFieldMap['phoneNumber']!: phoneNumberFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is GuardianDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class GuardianQuery
    implements QueryReference<Guardian, GuardianQuerySnapshot> {
  @override
  GuardianQuery limit(int limit);

  @override
  GuardianQuery limitToLast(int limit);

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
  GuardianQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
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
  GuardianQuery whereFieldPath(
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

  GuardianQuery whereDocumentId({
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
  GuardianQuery whereFirstName({
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
  GuardianQuery whereMiddleName({
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
  GuardianQuery whereLastName({
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
  GuardianQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  GuardianQuery wherePhoneNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  GuardianQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
  });

  GuardianQuery orderByFirstName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
  });

  GuardianQuery orderByMiddleName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
  });

  GuardianQuery orderByLastName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
  });

  GuardianQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
  });

  GuardianQuery orderByPhoneNumber({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
  });
}

class _$GuardianQuery extends QueryReference<Guardian, GuardianQuerySnapshot>
    implements GuardianQuery {
  _$GuardianQuery(
    this._collection, {
    required Query<Guardian> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<GuardianQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(GuardianQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<GuardianQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(GuardianQuerySnapshot._fromQuerySnapshot);
  }

  @override
  GuardianQuery limit(int limit) {
    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  GuardianQuery limitToLast(int limit) {
    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  GuardianQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
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
    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GuardianQuery whereFieldPath(
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
    return _$GuardianQuery(
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

  GuardianQuery whereDocumentId({
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
    return _$GuardianQuery(
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

  GuardianQuery whereFirstName({
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
    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GuardianFieldMap['firstName']!,
        isEqualTo: isEqualTo != null
            ? _$GuardianPerFieldToJson.firstName(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$GuardianPerFieldToJson.firstName(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$GuardianPerFieldToJson.firstName(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$GuardianPerFieldToJson.firstName(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$GuardianPerFieldToJson.firstName(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$GuardianPerFieldToJson.firstName(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$GuardianPerFieldToJson.firstName(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$GuardianPerFieldToJson.firstName(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  GuardianQuery whereMiddleName({
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
    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GuardianFieldMap['middleName']!,
        isEqualTo: isEqualTo != null
            ? _$GuardianPerFieldToJson.middleName(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$GuardianPerFieldToJson.middleName(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$GuardianPerFieldToJson.middleName(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$GuardianPerFieldToJson.middleName(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$GuardianPerFieldToJson.middleName(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$GuardianPerFieldToJson.middleName(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$GuardianPerFieldToJson.middleName(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$GuardianPerFieldToJson.middleName(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  GuardianQuery whereLastName({
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
    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GuardianFieldMap['lastName']!,
        isEqualTo: isEqualTo != null
            ? _$GuardianPerFieldToJson.lastName(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$GuardianPerFieldToJson.lastName(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$GuardianPerFieldToJson.lastName(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$GuardianPerFieldToJson.lastName(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$GuardianPerFieldToJson.lastName(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$GuardianPerFieldToJson.lastName(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$GuardianPerFieldToJson.lastName(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$GuardianPerFieldToJson.lastName(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  GuardianQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GuardianFieldMap['email']!,
        isEqualTo: isEqualTo != null
            ? _$GuardianPerFieldToJson.email(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$GuardianPerFieldToJson.email(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$GuardianPerFieldToJson.email(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$GuardianPerFieldToJson.email(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$GuardianPerFieldToJson.email(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$GuardianPerFieldToJson.email(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$GuardianPerFieldToJson.email(e)),
        whereNotIn: whereNotIn?.map((e) => _$GuardianPerFieldToJson.email(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  GuardianQuery wherePhoneNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$GuardianFieldMap['phoneNumber']!,
        isEqualTo: isEqualTo != null
            ? _$GuardianPerFieldToJson.phoneNumber(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$GuardianPerFieldToJson.phoneNumber(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$GuardianPerFieldToJson.phoneNumber(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$GuardianPerFieldToJson.phoneNumber(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$GuardianPerFieldToJson.phoneNumber(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$GuardianPerFieldToJson.phoneNumber(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$GuardianPerFieldToJson.phoneNumber(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$GuardianPerFieldToJson.phoneNumber(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  GuardianQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
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

    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GuardianQuery orderByFirstName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$GuardianFieldMap['firstName']!, descending: descending);
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

    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GuardianQuery orderByMiddleName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$GuardianFieldMap['middleName']!, descending: descending);
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

    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GuardianQuery orderByLastName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$GuardianFieldMap['lastName']!, descending: descending);
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

    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GuardianQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$GuardianFieldMap['email']!,
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

    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  GuardianQuery orderByPhoneNumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GuardianDocumentSnapshot? startAtDocument,
    GuardianDocumentSnapshot? endAtDocument,
    GuardianDocumentSnapshot? endBeforeDocument,
    GuardianDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$GuardianFieldMap['phoneNumber']!, descending: descending);
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

    return _$GuardianQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$GuardianQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class GuardianDocumentSnapshot extends FirestoreDocumentSnapshot<Guardian> {
  GuardianDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Guardian> snapshot;

  @override
  GuardianDocumentReference get reference {
    return GuardianDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Guardian? data;
}

class GuardianQuerySnapshot
    extends FirestoreQuerySnapshot<Guardian, GuardianQueryDocumentSnapshot> {
  GuardianQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory GuardianQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Guardian> snapshot,
  ) {
    final docs = snapshot.docs.map(GuardianQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        GuardianDocumentSnapshot._,
      );
    }).toList();

    return GuardianQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<GuardianDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    GuardianDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<GuardianDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Guardian> snapshot;

  @override
  final List<GuardianQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<GuardianDocumentSnapshot>> docChanges;
}

class GuardianQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Guardian>
    implements GuardianDocumentSnapshot {
  GuardianQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Guardian> snapshot;

  @override
  final Guardian data;

  @override
  GuardianDocumentReference get reference {
    return GuardianDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class TeacherCollectionReference
    implements
        TeacherQuery,
        FirestoreCollectionReference<Teacher, TeacherQuerySnapshot> {
  factory TeacherCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$TeacherCollectionReference;

  static Teacher fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Teacher.fromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    Teacher value,
    SetOptions? options,
  ) {
    return {...value.toJson()}..remove('id');
  }

  @override
  CollectionReference<Teacher> get reference;

  @override
  TeacherDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TeacherDocumentReference> add(Teacher value);
}

class _$TeacherCollectionReference extends _$TeacherQuery
    implements TeacherCollectionReference {
  factory _$TeacherCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$TeacherCollectionReference._(
      firestore.collection('teachers').withConverter(
            fromFirestore: TeacherCollectionReference.fromFirestore,
            toFirestore: TeacherCollectionReference.toFirestore,
          ),
    );
  }

  _$TeacherCollectionReference._(
    CollectionReference<Teacher> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<Teacher> get reference =>
      super.reference as CollectionReference<Teacher>;

  @override
  TeacherDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return TeacherDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<TeacherDocumentReference> add(Teacher value) {
    return reference.add(value).then((ref) => TeacherDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$TeacherCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class TeacherDocumentReference
    extends FirestoreDocumentReference<Teacher, TeacherDocumentSnapshot> {
  factory TeacherDocumentReference(DocumentReference<Teacher> reference) =
      _$TeacherDocumentReference;

  DocumentReference<Teacher> get reference;

  /// A reference to the [TeacherCollectionReference] containing this document.
  TeacherCollectionReference get parent {
    return _$TeacherCollectionReference(reference.firestore);
  }

  @override
  Stream<TeacherDocumentSnapshot> snapshots();

  @override
  Future<TeacherDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String photoPath,
    FieldValue photoPathFieldValue,
    String firstName,
    FieldValue firstNameFieldValue,
    String middleName,
    FieldValue middleNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? phoneNumber,
    FieldValue phoneNumberFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String photoPath,
    FieldValue photoPathFieldValue,
    String firstName,
    FieldValue firstNameFieldValue,
    String middleName,
    FieldValue middleNameFieldValue,
    String lastName,
    FieldValue lastNameFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? phoneNumber,
    FieldValue phoneNumberFieldValue,
  });
}

class _$TeacherDocumentReference
    extends FirestoreDocumentReference<Teacher, TeacherDocumentSnapshot>
    implements TeacherDocumentReference {
  _$TeacherDocumentReference(this.reference);

  @override
  final DocumentReference<Teacher> reference;

  /// A reference to the [TeacherCollectionReference] containing this document.
  TeacherCollectionReference get parent {
    return _$TeacherCollectionReference(reference.firestore);
  }

  @override
  Stream<TeacherDocumentSnapshot> snapshots() {
    return reference.snapshots().map(TeacherDocumentSnapshot._);
  }

  @override
  Future<TeacherDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(TeacherDocumentSnapshot._);
  }

  @override
  Future<TeacherDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(TeacherDocumentSnapshot._);
  }

  Future<void> update({
    Object? photoPath = _sentinel,
    FieldValue? photoPathFieldValue,
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? middleName = _sentinel,
    FieldValue? middleNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? phoneNumber = _sentinel,
    FieldValue? phoneNumberFieldValue,
  }) async {
    assert(
      photoPath == _sentinel || photoPathFieldValue == null,
      "Cannot specify both photoPath and photoPathFieldValue",
    );
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      middleName == _sentinel || middleNameFieldValue == null,
      "Cannot specify both middleName and middleNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      phoneNumber == _sentinel || phoneNumberFieldValue == null,
      "Cannot specify both phoneNumber and phoneNumberFieldValue",
    );
    final json = {
      if (photoPath != _sentinel)
        _$TeacherFieldMap['photoPath']!:
            _$TeacherPerFieldToJson.photoPath(photoPath as String),
      if (photoPathFieldValue != null)
        _$TeacherFieldMap['photoPath']!: photoPathFieldValue,
      if (firstName != _sentinel)
        _$TeacherFieldMap['firstName']!:
            _$TeacherPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$TeacherFieldMap['firstName']!: firstNameFieldValue,
      if (middleName != _sentinel)
        _$TeacherFieldMap['middleName']!:
            _$TeacherPerFieldToJson.middleName(middleName as String),
      if (middleNameFieldValue != null)
        _$TeacherFieldMap['middleName']!: middleNameFieldValue,
      if (lastName != _sentinel)
        _$TeacherFieldMap['lastName']!:
            _$TeacherPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$TeacherFieldMap['lastName']!: lastNameFieldValue,
      if (email != _sentinel)
        _$TeacherFieldMap['email']!:
            _$TeacherPerFieldToJson.email(email as String?),
      if (emailFieldValue != null) _$TeacherFieldMap['email']!: emailFieldValue,
      if (phoneNumber != _sentinel)
        _$TeacherFieldMap['phoneNumber']!:
            _$TeacherPerFieldToJson.phoneNumber(phoneNumber as String?),
      if (phoneNumberFieldValue != null)
        _$TeacherFieldMap['phoneNumber']!: phoneNumberFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? photoPath = _sentinel,
    FieldValue? photoPathFieldValue,
    Object? firstName = _sentinel,
    FieldValue? firstNameFieldValue,
    Object? middleName = _sentinel,
    FieldValue? middleNameFieldValue,
    Object? lastName = _sentinel,
    FieldValue? lastNameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? phoneNumber = _sentinel,
    FieldValue? phoneNumberFieldValue,
  }) {
    assert(
      photoPath == _sentinel || photoPathFieldValue == null,
      "Cannot specify both photoPath and photoPathFieldValue",
    );
    assert(
      firstName == _sentinel || firstNameFieldValue == null,
      "Cannot specify both firstName and firstNameFieldValue",
    );
    assert(
      middleName == _sentinel || middleNameFieldValue == null,
      "Cannot specify both middleName and middleNameFieldValue",
    );
    assert(
      lastName == _sentinel || lastNameFieldValue == null,
      "Cannot specify both lastName and lastNameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      phoneNumber == _sentinel || phoneNumberFieldValue == null,
      "Cannot specify both phoneNumber and phoneNumberFieldValue",
    );
    final json = {
      if (photoPath != _sentinel)
        _$TeacherFieldMap['photoPath']!:
            _$TeacherPerFieldToJson.photoPath(photoPath as String),
      if (photoPathFieldValue != null)
        _$TeacherFieldMap['photoPath']!: photoPathFieldValue,
      if (firstName != _sentinel)
        _$TeacherFieldMap['firstName']!:
            _$TeacherPerFieldToJson.firstName(firstName as String),
      if (firstNameFieldValue != null)
        _$TeacherFieldMap['firstName']!: firstNameFieldValue,
      if (middleName != _sentinel)
        _$TeacherFieldMap['middleName']!:
            _$TeacherPerFieldToJson.middleName(middleName as String),
      if (middleNameFieldValue != null)
        _$TeacherFieldMap['middleName']!: middleNameFieldValue,
      if (lastName != _sentinel)
        _$TeacherFieldMap['lastName']!:
            _$TeacherPerFieldToJson.lastName(lastName as String),
      if (lastNameFieldValue != null)
        _$TeacherFieldMap['lastName']!: lastNameFieldValue,
      if (email != _sentinel)
        _$TeacherFieldMap['email']!:
            _$TeacherPerFieldToJson.email(email as String?),
      if (emailFieldValue != null) _$TeacherFieldMap['email']!: emailFieldValue,
      if (phoneNumber != _sentinel)
        _$TeacherFieldMap['phoneNumber']!:
            _$TeacherPerFieldToJson.phoneNumber(phoneNumber as String?),
      if (phoneNumberFieldValue != null)
        _$TeacherFieldMap['phoneNumber']!: phoneNumberFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is TeacherDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class TeacherQuery
    implements QueryReference<Teacher, TeacherQuerySnapshot> {
  @override
  TeacherQuery limit(int limit);

  @override
  TeacherQuery limitToLast(int limit);

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
  TeacherQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
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
  TeacherQuery whereFieldPath(
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

  TeacherQuery whereDocumentId({
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
  TeacherQuery wherePhotoPath({
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
  TeacherQuery whereFirstName({
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
  TeacherQuery whereMiddleName({
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
  TeacherQuery whereLastName({
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
  TeacherQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  TeacherQuery wherePhoneNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  TeacherQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  });

  TeacherQuery orderByPhotoPath({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  });

  TeacherQuery orderByFirstName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  });

  TeacherQuery orderByMiddleName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  });

  TeacherQuery orderByLastName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  });

  TeacherQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  });

  TeacherQuery orderByPhoneNumber({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  });
}

class _$TeacherQuery extends QueryReference<Teacher, TeacherQuerySnapshot>
    implements TeacherQuery {
  _$TeacherQuery(
    this._collection, {
    required Query<Teacher> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<TeacherQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(TeacherQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<TeacherQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(TeacherQuerySnapshot._fromQuerySnapshot);
  }

  @override
  TeacherQuery limit(int limit) {
    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  TeacherQuery limitToLast(int limit) {
    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  TeacherQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
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
    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  TeacherQuery whereFieldPath(
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
    return _$TeacherQuery(
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

  TeacherQuery whereDocumentId({
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
    return _$TeacherQuery(
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

  TeacherQuery wherePhotoPath({
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
    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TeacherFieldMap['photoPath']!,
        isEqualTo: isEqualTo != null
            ? _$TeacherPerFieldToJson.photoPath(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$TeacherPerFieldToJson.photoPath(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$TeacherPerFieldToJson.photoPath(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TeacherPerFieldToJson.photoPath(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TeacherPerFieldToJson.photoPath(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TeacherPerFieldToJson.photoPath(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$TeacherPerFieldToJson.photoPath(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$TeacherPerFieldToJson.photoPath(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  TeacherQuery whereFirstName({
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
    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TeacherFieldMap['firstName']!,
        isEqualTo: isEqualTo != null
            ? _$TeacherPerFieldToJson.firstName(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$TeacherPerFieldToJson.firstName(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$TeacherPerFieldToJson.firstName(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TeacherPerFieldToJson.firstName(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TeacherPerFieldToJson.firstName(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TeacherPerFieldToJson.firstName(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$TeacherPerFieldToJson.firstName(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$TeacherPerFieldToJson.firstName(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  TeacherQuery whereMiddleName({
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
    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TeacherFieldMap['middleName']!,
        isEqualTo: isEqualTo != null
            ? _$TeacherPerFieldToJson.middleName(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$TeacherPerFieldToJson.middleName(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$TeacherPerFieldToJson.middleName(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TeacherPerFieldToJson.middleName(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TeacherPerFieldToJson.middleName(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TeacherPerFieldToJson.middleName(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$TeacherPerFieldToJson.middleName(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$TeacherPerFieldToJson.middleName(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  TeacherQuery whereLastName({
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
    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TeacherFieldMap['lastName']!,
        isEqualTo: isEqualTo != null
            ? _$TeacherPerFieldToJson.lastName(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$TeacherPerFieldToJson.lastName(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$TeacherPerFieldToJson.lastName(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TeacherPerFieldToJson.lastName(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TeacherPerFieldToJson.lastName(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TeacherPerFieldToJson.lastName(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$TeacherPerFieldToJson.lastName(e)),
        whereNotIn: whereNotIn?.map((e) => _$TeacherPerFieldToJson.lastName(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  TeacherQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TeacherFieldMap['email']!,
        isEqualTo:
            isEqualTo != null ? _$TeacherPerFieldToJson.email(isEqualTo) : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$TeacherPerFieldToJson.email(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$TeacherPerFieldToJson.email(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TeacherPerFieldToJson.email(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TeacherPerFieldToJson.email(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TeacherPerFieldToJson.email(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$TeacherPerFieldToJson.email(e)),
        whereNotIn: whereNotIn?.map((e) => _$TeacherPerFieldToJson.email(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  TeacherQuery wherePhoneNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$TeacherFieldMap['phoneNumber']!,
        isEqualTo: isEqualTo != null
            ? _$TeacherPerFieldToJson.phoneNumber(isEqualTo)
            : null,
        isNotEqualTo: isNotEqualTo != null
            ? _$TeacherPerFieldToJson.phoneNumber(isNotEqualTo)
            : null,
        isLessThan: isLessThan != null
            ? _$TeacherPerFieldToJson.phoneNumber(isLessThan)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$TeacherPerFieldToJson.phoneNumber(isLessThanOrEqualTo)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$TeacherPerFieldToJson.phoneNumber(isGreaterThan)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$TeacherPerFieldToJson.phoneNumber(isGreaterThanOrEqualTo)
            : null,
        isNull: isNull,
        whereIn: whereIn?.map((e) => _$TeacherPerFieldToJson.phoneNumber(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$TeacherPerFieldToJson.phoneNumber(e)),
      ),
      $queryCursor: $queryCursor,
    );
  }

  TeacherQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
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

    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  TeacherQuery orderByPhotoPath({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TeacherFieldMap['photoPath']!, descending: descending);
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

    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  TeacherQuery orderByFirstName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TeacherFieldMap['firstName']!, descending: descending);
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

    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  TeacherQuery orderByMiddleName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TeacherFieldMap['middleName']!, descending: descending);
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

    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  TeacherQuery orderByLastName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TeacherFieldMap['lastName']!, descending: descending);
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

    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  TeacherQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$TeacherFieldMap['email']!,
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

    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  TeacherQuery orderByPhoneNumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeacherDocumentSnapshot? startAtDocument,
    TeacherDocumentSnapshot? endAtDocument,
    TeacherDocumentSnapshot? endBeforeDocument,
    TeacherDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$TeacherFieldMap['phoneNumber']!, descending: descending);
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

    return _$TeacherQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$TeacherQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class TeacherDocumentSnapshot extends FirestoreDocumentSnapshot<Teacher> {
  TeacherDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<Teacher> snapshot;

  @override
  TeacherDocumentReference get reference {
    return TeacherDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Teacher? data;
}

class TeacherQuerySnapshot
    extends FirestoreQuerySnapshot<Teacher, TeacherQueryDocumentSnapshot> {
  TeacherQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory TeacherQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Teacher> snapshot,
  ) {
    final docs = snapshot.docs.map(TeacherQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        TeacherDocumentSnapshot._,
      );
    }).toList();

    return TeacherQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<TeacherDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    TeacherDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<TeacherDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Teacher> snapshot;

  @override
  final List<TeacherQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<TeacherDocumentSnapshot>> docChanges;
}

class TeacherQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Teacher>
    implements TeacherDocumentSnapshot {
  TeacherQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Teacher> snapshot;

  @override
  final Teacher data;

  @override
  TeacherDocumentReference get reference {
    return TeacherDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

const _$PersonFieldMap = <String, String>{
  'firstName': 'firstName',
  'middleName': 'middleName',
  'lastName': 'lastName',
  'email': 'email',
  'phoneNumber': 'phoneNumber',
};

// ignore: unused_element
abstract class _$PersonPerFieldToJson {
  // ignore: unused_element
  static Object? firstName(String instance) => instance;
  // ignore: unused_element
  static Object? middleName(String instance) => instance;
  // ignore: unused_element
  static Object? lastName(String instance) => instance;
  // ignore: unused_element
  static Object? email(String? instance) => instance;
  // ignore: unused_element
  static Object? phoneNumber(String? instance) => instance;
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      guardianIds: (json['guardianIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      faceArray: json['faceArray'] as List<dynamic>?,
      photoPath: json['photoPath'] as String?,
    );

const _$StudentFieldMap = <String, String>{
  'firstName': 'firstName',
  'middleName': 'middleName',
  'lastName': 'lastName',
  'email': 'email',
  'phoneNumber': 'phoneNumber',
  'id': 'id',
  'photoPath': 'photoPath',
  'guardianIds': 'guardianIds',
  'faceArray': 'faceArray',
};

// ignore: unused_element
abstract class _$StudentPerFieldToJson {
  // ignore: unused_element
  static Object? firstName(String instance) => instance;
  // ignore: unused_element
  static Object? middleName(String instance) => instance;
  // ignore: unused_element
  static Object? lastName(String instance) => instance;
  // ignore: unused_element
  static Object? email(String? instance) => instance;
  // ignore: unused_element
  static Object? phoneNumber(String? instance) => instance;
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? photoPath(String instance) => instance;
  // ignore: unused_element
  static Object? guardianIds(List<String> instance) => instance;
  // ignore: unused_element
  static Object? faceArray(List<dynamic> instance) => instance;
}

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'id': instance.id,
      'photoPath': instance.photoPath,
      'guardianIds': instance.guardianIds,
      'faceArray': instance.faceArray,
    };

Guardian _$GuardianFromJson(Map<String, dynamic> json) => Guardian(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

const _$GuardianFieldMap = <String, String>{
  'firstName': 'firstName',
  'middleName': 'middleName',
  'lastName': 'lastName',
  'email': 'email',
  'phoneNumber': 'phoneNumber',
  'id': 'id',
};

// ignore: unused_element
abstract class _$GuardianPerFieldToJson {
  // ignore: unused_element
  static Object? firstName(String instance) => instance;
  // ignore: unused_element
  static Object? middleName(String instance) => instance;
  // ignore: unused_element
  static Object? lastName(String instance) => instance;
  // ignore: unused_element
  static Object? email(String? instance) => instance;
  // ignore: unused_element
  static Object? phoneNumber(String? instance) => instance;
  // ignore: unused_element
  static Object? id(String instance) => instance;
}

Map<String, dynamic> _$GuardianToJson(Guardian instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'id': instance.id,
    };

Teacher _$TeacherFromJson(Map<String, dynamic> json) => Teacher(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      photoPath: json['photoPath'] as String?,
    );

const _$TeacherFieldMap = <String, String>{
  'firstName': 'firstName',
  'middleName': 'middleName',
  'lastName': 'lastName',
  'email': 'email',
  'phoneNumber': 'phoneNumber',
  'id': 'id',
  'photoPath': 'photoPath',
};

// ignore: unused_element
abstract class _$TeacherPerFieldToJson {
  // ignore: unused_element
  static Object? firstName(String instance) => instance;
  // ignore: unused_element
  static Object? middleName(String instance) => instance;
  // ignore: unused_element
  static Object? lastName(String instance) => instance;
  // ignore: unused_element
  static Object? email(String? instance) => instance;
  // ignore: unused_element
  static Object? phoneNumber(String? instance) => instance;
  // ignore: unused_element
  static Object? id(String instance) => instance;
  // ignore: unused_element
  static Object? photoPath(String instance) => instance;
}

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'id': instance.id,
      'photoPath': instance.photoPath,
    };

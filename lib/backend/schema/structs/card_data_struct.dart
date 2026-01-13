// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

/// بيانات بطاقة إيتمانية
class CardDataStruct extends FFFirebaseStruct {
  CardDataStruct({
    String? name,
    String? number,
    String? month,
    String? year,
    String? cvc,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _number = number,
        _month = month,
        _year = year,
        _cvc = cvc,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  set number(String? val) => _number = val;

  bool hasNumber() => _number != null;

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  set month(String? val) => _month = val;

  bool hasMonth() => _month != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  set year(String? val) => _year = val;

  bool hasYear() => _year != null;

  // "cvc" field.
  String? _cvc;
  String get cvc => _cvc ?? '';
  set cvc(String? val) => _cvc = val;

  bool hasCvc() => _cvc != null;

  static CardDataStruct fromMap(Map<String, dynamic> data) => CardDataStruct(
        name: data['name'] as String?,
        number: data['number'] as String?,
        month: data['month'] as String?,
        year: data['year'] as String?,
        cvc: data['cvc'] as String?,
      );

  static CardDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? CardDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'number': _number,
        'month': _month,
        'year': _year,
        'cvc': _cvc,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.String,
        ),
        'month': serializeParam(
          _month,
          ParamType.String,
        ),
        'year': serializeParam(
          _year,
          ParamType.String,
        ),
        'cvc': serializeParam(
          _cvc,
          ParamType.String,
        ),
      }.withoutNulls;

  static CardDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      CardDataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.String,
          false,
        ),
        month: deserializeParam(
          data['month'],
          ParamType.String,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.String,
          false,
        ),
        cvc: deserializeParam(
          data['cvc'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CardDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CardDataStruct &&
        name == other.name &&
        number == other.number &&
        month == other.month &&
        year == other.year &&
        cvc == other.cvc;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, number, month, year, cvc]);
}

CardDataStruct createCardDataStruct({
  String? name,
  String? number,
  String? month,
  String? year,
  String? cvc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CardDataStruct(
      name: name,
      number: number,
      month: month,
      year: year,
      cvc: cvc,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CardDataStruct? updateCardDataStruct(
  CardDataStruct? cardData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cardData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCardDataStructData(
  Map<String, dynamic> firestoreData,
  CardDataStruct? cardData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cardData == null) {
    return;
  }
  if (cardData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cardData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cardDataData = getCardDataFirestoreData(cardData, forFieldValue);
  final nestedData = cardDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cardData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCardDataFirestoreData(
  CardDataStruct? cardData, [
  bool forFieldValue = false,
]) {
  if (cardData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cardData.toMap());

  // Add any Firestore field values
  cardData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCardDataListFirestoreData(
  List<CardDataStruct>? cardDatas,
) =>
    cardDatas?.map((e) => getCardDataFirestoreData(e, true)).toList() ?? [];

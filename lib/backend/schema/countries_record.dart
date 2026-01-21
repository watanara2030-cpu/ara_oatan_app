import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CountriesRecord extends FirestoreRecord {
  CountriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "naim" field.
  String? _naim;
  String get naim => _naim ?? '';
  bool hasNaim() => _naim != null;

  // "osf" field.
  String? _osf;
  String get osf => _osf ?? '';
  bool hasOsf() => _osf != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "acctev" field.
  bool? _acctev;
  bool get acctev => _acctev ?? false;
  bool hasAcctev() => _acctev != null;

  // "num_trteb" field.
  int? _numTrteb;
  int get numTrteb => _numTrteb ?? 0;
  bool hasNumTrteb() => _numTrteb != null;

  // "saudi" field.
  bool? _saudi;
  bool get saudi => _saudi ?? false;
  bool hasSaudi() => _saudi != null;

  // "hederImg" field.
  String? _hederImg;
  String get hederImg => _hederImg ?? '';
  bool hasHederImg() => _hederImg != null;

  // "naimEnglesh" field.
  String? _naimEnglesh;
  String get naimEnglesh => _naimEnglesh ?? '';
  bool hasNaimEnglesh() => _naimEnglesh != null;

  // "isvat" field.
  bool? _isvat;
  bool get isvat => _isvat ?? false;
  bool hasIsvat() => _isvat != null;

  // "vat" field.
  int? _vat;
  int get vat => _vat ?? 0;
  bool hasVat() => _vat != null;

  // "CurrencySymbol" field.
  String? _currencySymbol;
  String get currencySymbol => _currencySymbol ?? '';
  bool hasCurrencySymbol() => _currencySymbol != null;

  // "CurrencyFRG" field.
  double? _currencyFRG;
  double get currencyFRG => _currencyFRG ?? 0.0;
  bool hasCurrencyFRG() => _currencyFRG != null;

  void _initializeFields() {
    _naim = snapshotData['naim'] as String?;
    _osf = snapshotData['osf'] as String?;
    _img = snapshotData['img'] as String?;
    _acctev = snapshotData['acctev'] as bool?;
    _numTrteb = castToType<int>(snapshotData['num_trteb']);
    _saudi = snapshotData['saudi'] as bool?;
    _hederImg = snapshotData['hederImg'] as String?;
    _naimEnglesh = snapshotData['naimEnglesh'] as String?;
    _isvat = snapshotData['isvat'] as bool?;
    _vat = castToType<int>(snapshotData['vat']);
    _currencySymbol = snapshotData['CurrencySymbol'] as String?;
    _currencyFRG = castToType<double>(snapshotData['CurrencyFRG']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('countries');

  static Stream<CountriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CountriesRecord.fromSnapshot(s));

  static Future<CountriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CountriesRecord.fromSnapshot(s));

  static CountriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CountriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CountriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CountriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CountriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CountriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCountriesRecordData({
  String? naim,
  String? osf,
  String? img,
  bool? acctev,
  int? numTrteb,
  bool? saudi,
  String? hederImg,
  String? naimEnglesh,
  bool? isvat,
  int? vat,
  String? currencySymbol,
  double? currencyFRG,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'naim': naim,
      'osf': osf,
      'img': img,
      'acctev': acctev,
      'num_trteb': numTrteb,
      'saudi': saudi,
      'hederImg': hederImg,
      'naimEnglesh': naimEnglesh,
      'isvat': isvat,
      'vat': vat,
      'CurrencySymbol': currencySymbol,
      'CurrencyFRG': currencyFRG,
    }.withoutNulls,
  );

  return firestoreData;
}

class CountriesRecordDocumentEquality implements Equality<CountriesRecord> {
  const CountriesRecordDocumentEquality();

  @override
  bool equals(CountriesRecord? e1, CountriesRecord? e2) {
    return e1?.naim == e2?.naim &&
        e1?.osf == e2?.osf &&
        e1?.img == e2?.img &&
        e1?.acctev == e2?.acctev &&
        e1?.numTrteb == e2?.numTrteb &&
        e1?.saudi == e2?.saudi &&
        e1?.hederImg == e2?.hederImg &&
        e1?.naimEnglesh == e2?.naimEnglesh &&
        e1?.isvat == e2?.isvat &&
        e1?.vat == e2?.vat &&
        e1?.currencySymbol == e2?.currencySymbol &&
        e1?.currencyFRG == e2?.currencyFRG;
  }

  @override
  int hash(CountriesRecord? e) => const ListEquality().hash([
        e?.naim,
        e?.osf,
        e?.img,
        e?.acctev,
        e?.numTrteb,
        e?.saudi,
        e?.hederImg,
        e?.naimEnglesh,
        e?.isvat,
        e?.vat,
        e?.currencySymbol,
        e?.currencyFRG
      ]);

  @override
  bool isValidKey(Object? o) => o is CountriesRecord;
}

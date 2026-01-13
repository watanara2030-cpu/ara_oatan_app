import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _dolh = prefs.getString('ff_dolh')?.ref ?? _dolh;
    });
    _safeInit(() {
      _mdenh = prefs.getString('ff_mdenh')?.ref ?? _mdenh;
    });
    _safeInit(() {
      _naimdolh = prefs.getString('ff_naimdolh') ?? _naimdolh;
    });
    _safeInit(() {
      _naimmdenh = prefs.getString('ff_naimmdenh') ?? _naimmdenh;
    });
    _safeInit(() {
      _vil = prefs.getString('ff_vil')?.ref ?? _vil;
    });
    _safeInit(() {
      _cartsum = prefs.getDouble('ff_cartsum') ?? _cartsum;
    });
    _safeInit(() {
      _addcart = prefs.getInt('ff_addcart') ?? _addcart;
    });
    _safeInit(() {
      _cartItems = prefs
              .getStringList('ff_cartItems')
              ?.map((x) {
                try {
                  return CartItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cartItems;
    });
    _safeInit(() {
      _cart =
          prefs.getStringList('ff_cart')?.map((path) => path.ref).toList() ??
              _cart;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_tmaddrhlh')) {
        try {
          final serializedData = prefs.getString('ff_tmaddrhlh') ?? '{}';
          _tmaddrhlh =
              IsAddRhlhStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _villa = prefs.getString('ff_villa')?.ref ?? _villa;
    });
    _safeInit(() {
      _naimvillatext = prefs.getString('ff_naimvillatext') ?? _naimvillatext;
    });
    _safeInit(() {
      _tebycar = prefs.getString('ff_tebycar') ?? _tebycar;
    });
    _safeInit(() {
      _mapNEW = latLngFromString(prefs.getString('ff_mapNEW')) ?? _mapNEW;
    });
    _safeInit(() {
      _autostate = prefs.getString('ff_autostate')?.ref ?? _autostate;
    });
    _safeInit(() {
      _typecarRev = prefs.getString('ff_typecarRev')?.ref ?? _typecarRev;
    });
    _safeInit(() {
      _IMGVILL = prefs.getString('ff_IMGVILL') ?? _IMGVILL;
    });
    _safeInit(() {
      _cartmkss = prefs
              .getStringList('ff_cartmkss')
              ?.map((x) {
                try {
                  return AmaknCostmStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cartmkss;
    });
    _safeInit(() {
      _latlngvill =
          latLngFromString(prefs.getString('ff_latlngvill')) ?? _latlngvill;
    });
    _safeInit(() {
      _ismapview = prefs.getBool('ff_ismapview') ?? _ismapview;
    });
    _safeInit(() {
      _srtypecar = prefs.getInt('ff_srtypecar') ?? _srtypecar;
    });
    _safeInit(() {
      _totalsaatandcar = prefs.getInt('ff_totalsaatandcar') ?? _totalsaatandcar;
    });
    _safeInit(() {
      _isbas = prefs.getBool('ff_isbas') ?? _isbas;
    });
    _safeInit(() {
      _notcar = prefs.getString('ff_notcar') ?? _notcar;
    });
    _safeInit(() {
      _saatcar = prefs.getInt('ff_saatcar') ?? _saatcar;
    });
    _safeInit(() {
      _nodelet = prefs.getBool('ff_nodelet') ?? _nodelet;
    });
    _safeInit(() {
      _villnow = prefs.getString('ff_villnow')?.ref ?? _villnow;
    });
    _safeInit(() {
      _villtextnow = prefs.getString('ff_villtextnow') ?? _villtextnow;
    });
    _safeInit(() {
      _addhors = prefs.getInt('ff_addhors') ?? _addhors;
    });
    _safeInit(() {
      _onsaahcar = prefs.getInt('ff_onsaahcar') ?? _onsaahcar;
    });
    _safeInit(() {
      _totalsaat = prefs.getInt('ff_totalsaat') ?? _totalsaat;
    });
    _safeInit(() {
      _adressSelection =
          prefs.getString('ff_adressSelection')?.ref ?? _adressSelection;
    });
    _safeInit(() {
      _adressNaim = prefs.getString('ff_adressNaim') ?? _adressNaim;
    });
    _safeInit(() {
      _mkanuserorder = latLngFromString(prefs.getString('ff_mkanuserorder')) ??
          _mkanuserorder;
    });
    _safeInit(() {
      _akridorder = prefs.getInt('ff_akridorder') ?? _akridorder;
    });
    _safeInit(() {
      _akridorder2 = prefs.getInt('ff_akridorder2') ?? _akridorder2;
    });
    _safeInit(() {
      _dataSchedule = prefs.containsKey('ff_dataSchedule')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_dataSchedule')!)
          : _dataSchedule;
    });
    _safeInit(() {
      _taimSchedule = prefs.getString('ff_taimSchedule') ?? _taimSchedule;
    });
    _safeInit(() {
      _fulltextSchedule =
          prefs.getString('ff_fulltextSchedule') ?? _fulltextSchedule;
    });
    _safeInit(() {
      _payth = prefs.getString('ff_payth') ?? _payth;
    });
    _safeInit(() {
      _darkmode = prefs.getBool('ff_darkmode') ?? _darkmode;
    });
    _safeInit(() {
      _msegAi = prefs.getString('ff_msegAi') ?? _msegAi;
    });
    _safeInit(() {
      _MyserStartPay = prefs.getBool('ff_MyserStartPay') ?? _MyserStartPay;
    });
    _safeInit(() {
      _DonePay = prefs.getBool('ff_DonePay') ?? _DonePay;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _dolh;
  DocumentReference? get dolh => _dolh;
  set dolh(DocumentReference? value) {
    _dolh = value;
    value != null
        ? prefs.setString('ff_dolh', value.path)
        : prefs.remove('ff_dolh');
  }

  DocumentReference? _mdenh;
  DocumentReference? get mdenh => _mdenh;
  set mdenh(DocumentReference? value) {
    _mdenh = value;
    value != null
        ? prefs.setString('ff_mdenh', value.path)
        : prefs.remove('ff_mdenh');
  }

  String _naimdolh = '';
  String get naimdolh => _naimdolh;
  set naimdolh(String value) {
    _naimdolh = value;
    prefs.setString('ff_naimdolh', value);
  }

  String _naimmdenh = '';
  String get naimmdenh => _naimmdenh;
  set naimmdenh(String value) {
    _naimmdenh = value;
    prefs.setString('ff_naimmdenh', value);
  }

  DocumentReference? _vil;
  DocumentReference? get vil => _vil;
  set vil(DocumentReference? value) {
    _vil = value;
    value != null
        ? prefs.setString('ff_vil', value.path)
        : prefs.remove('ff_vil');
  }

  double _cartsum = 0.0;
  double get cartsum => _cartsum;
  set cartsum(double value) {
    _cartsum = value;
    prefs.setDouble('ff_cartsum', value);
  }

  int _addcart = 0;
  int get addcart => _addcart;
  set addcart(int value) {
    _addcart = value;
    prefs.setInt('ff_addcart', value);
  }

  List<CartItemStruct> _cartItems = [];
  List<CartItemStruct> get cartItems => _cartItems;
  set cartItems(List<CartItemStruct> value) {
    _cartItems = value;
    prefs.setStringList(
        'ff_cartItems', value.map((x) => x.serialize()).toList());
  }

  void addToCartItems(CartItemStruct value) {
    cartItems.add(value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  void removeFromCartItems(CartItemStruct value) {
    cartItems.remove(value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCartItems(int index) {
    cartItems.removeAt(index);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  void updateCartItemsAtIndex(
    int index,
    CartItemStruct Function(CartItemStruct) updateFn,
  ) {
    cartItems[index] = updateFn(_cartItems[index]);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCartItems(int index, CartItemStruct value) {
    cartItems.insert(index, value);
    prefs.setStringList(
        'ff_cartItems', _cartItems.map((x) => x.serialize()).toList());
  }

  List<double> _cartPriceSummary = [];
  List<double> get cartPriceSummary => _cartPriceSummary;
  set cartPriceSummary(List<double> value) {
    _cartPriceSummary = value;
  }

  void addToCartPriceSummary(double value) {
    cartPriceSummary.add(value);
  }

  void removeFromCartPriceSummary(double value) {
    cartPriceSummary.remove(value);
  }

  void removeAtIndexFromCartPriceSummary(int index) {
    cartPriceSummary.removeAt(index);
  }

  void updateCartPriceSummaryAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    cartPriceSummary[index] = updateFn(_cartPriceSummary[index]);
  }

  void insertAtIndexInCartPriceSummary(int index, double value) {
    cartPriceSummary.insert(index, value);
  }

  List<DocumentReference> _cart = [
    FirebaseFirestore.instance.doc('/mkan/example')
  ];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> value) {
    _cart = value;
    prefs.setStringList('ff_cart', value.map((x) => x.path).toList());
  }

  void addToCart(DocumentReference value) {
    cart.add(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeFromCart(DocumentReference value) {
    cart.remove(value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeAtIndexFromCart(int index) {
    cart.removeAt(index);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void updateCartAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    cart[index] = updateFn(_cart[index]);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void insertAtIndexInCart(int index, DocumentReference value) {
    cart.insert(index, value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  bool _tm = false;
  bool get tm => _tm;
  set tm(bool value) {
    _tm = value;
  }

  IsAddRhlhStruct _tmaddrhlh =
      IsAddRhlhStruct.fromSerializableMap(jsonDecode('{\"Rhlh\":\"[]\"}'));
  IsAddRhlhStruct get tmaddrhlh => _tmaddrhlh;
  set tmaddrhlh(IsAddRhlhStruct value) {
    _tmaddrhlh = value;
    prefs.setString('ff_tmaddrhlh', value.serialize());
  }

  void updateTmaddrhlhStruct(Function(IsAddRhlhStruct) updateFn) {
    updateFn(_tmaddrhlh);
    prefs.setString('ff_tmaddrhlh', _tmaddrhlh.serialize());
  }

  DocumentReference? _villa;
  DocumentReference? get villa => _villa;
  set villa(DocumentReference? value) {
    _villa = value;
    value != null
        ? prefs.setString('ff_villa', value.path)
        : prefs.remove('ff_villa');
  }

  String _naimvillatext = '';
  String get naimvillatext => _naimvillatext;
  set naimvillatext(String value) {
    _naimvillatext = value;
    prefs.setString('ff_naimvillatext', value);
  }

  String _tebycar = '';
  String get tebycar => _tebycar;
  set tebycar(String value) {
    _tebycar = value;
    prefs.setString('ff_tebycar', value);
  }

  LatLng? _mapNEW;
  LatLng? get mapNEW => _mapNEW;
  set mapNEW(LatLng? value) {
    _mapNEW = value;
    value != null
        ? prefs.setString('ff_mapNEW', value.serialize())
        : prefs.remove('ff_mapNEW');
  }

  DocumentReference? _autostate;
  DocumentReference? get autostate => _autostate;
  set autostate(DocumentReference? value) {
    _autostate = value;
    value != null
        ? prefs.setString('ff_autostate', value.path)
        : prefs.remove('ff_autostate');
  }

  DocumentReference? _typecarRev;
  DocumentReference? get typecarRev => _typecarRev;
  set typecarRev(DocumentReference? value) {
    _typecarRev = value;
    value != null
        ? prefs.setString('ff_typecarRev', value.path)
        : prefs.remove('ff_typecarRev');
  }

  String _IMGVILL = '';
  String get IMGVILL => _IMGVILL;
  set IMGVILL(String value) {
    _IMGVILL = value;
    prefs.setString('ff_IMGVILL', value);
  }

  List<AmaknCostmStruct> _cartmkss = [];
  List<AmaknCostmStruct> get cartmkss => _cartmkss;
  set cartmkss(List<AmaknCostmStruct> value) {
    _cartmkss = value;
    prefs.setStringList(
        'ff_cartmkss', value.map((x) => x.serialize()).toList());
  }

  void addToCartmkss(AmaknCostmStruct value) {
    cartmkss.add(value);
    prefs.setStringList(
        'ff_cartmkss', _cartmkss.map((x) => x.serialize()).toList());
  }

  void removeFromCartmkss(AmaknCostmStruct value) {
    cartmkss.remove(value);
    prefs.setStringList(
        'ff_cartmkss', _cartmkss.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCartmkss(int index) {
    cartmkss.removeAt(index);
    prefs.setStringList(
        'ff_cartmkss', _cartmkss.map((x) => x.serialize()).toList());
  }

  void updateCartmkssAtIndex(
    int index,
    AmaknCostmStruct Function(AmaknCostmStruct) updateFn,
  ) {
    cartmkss[index] = updateFn(_cartmkss[index]);
    prefs.setStringList(
        'ff_cartmkss', _cartmkss.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCartmkss(int index, AmaknCostmStruct value) {
    cartmkss.insert(index, value);
    prefs.setStringList(
        'ff_cartmkss', _cartmkss.map((x) => x.serialize()).toList());
  }

  LatLng? _latlngvill;
  LatLng? get latlngvill => _latlngvill;
  set latlngvill(LatLng? value) {
    _latlngvill = value;
    value != null
        ? prefs.setString('ff_latlngvill', value.serialize())
        : prefs.remove('ff_latlngvill');
  }

  bool _ismapview = false;
  bool get ismapview => _ismapview;
  set ismapview(bool value) {
    _ismapview = value;
    prefs.setBool('ff_ismapview', value);
  }

  int _srtypecar = 0;
  int get srtypecar => _srtypecar;
  set srtypecar(int value) {
    _srtypecar = value;
    prefs.setInt('ff_srtypecar', value);
  }

  int _totalsaatandcar = 0;
  int get totalsaatandcar => _totalsaatandcar;
  set totalsaatandcar(int value) {
    _totalsaatandcar = value;
    prefs.setInt('ff_totalsaatandcar', value);
  }

  bool _isbas = false;
  bool get isbas => _isbas;
  set isbas(bool value) {
    _isbas = value;
    prefs.setBool('ff_isbas', value);
  }

  String _notcar = '';
  String get notcar => _notcar;
  set notcar(String value) {
    _notcar = value;
    prefs.setString('ff_notcar', value);
  }

  int _saatcar = 0;
  int get saatcar => _saatcar;
  set saatcar(int value) {
    _saatcar = value;
    prefs.setInt('ff_saatcar', value);
  }

  bool _nodelet = false;
  bool get nodelet => _nodelet;
  set nodelet(bool value) {
    _nodelet = value;
    prefs.setBool('ff_nodelet', value);
  }

  DocumentReference? _villnow;
  DocumentReference? get villnow => _villnow;
  set villnow(DocumentReference? value) {
    _villnow = value;
    value != null
        ? prefs.setString('ff_villnow', value.path)
        : prefs.remove('ff_villnow');
  }

  String _villtextnow = '';
  String get villtextnow => _villtextnow;
  set villtextnow(String value) {
    _villtextnow = value;
    prefs.setString('ff_villtextnow', value);
  }

  int _addhors = 0;
  int get addhors => _addhors;
  set addhors(int value) {
    _addhors = value;
    prefs.setInt('ff_addhors', value);
  }

  int _onsaahcar = 0;
  int get onsaahcar => _onsaahcar;
  set onsaahcar(int value) {
    _onsaahcar = value;
    prefs.setInt('ff_onsaahcar', value);
  }

  int _totalsaat = 0;
  int get totalsaat => _totalsaat;
  set totalsaat(int value) {
    _totalsaat = value;
    prefs.setInt('ff_totalsaat', value);
  }

  DocumentReference? _adressSelection;
  DocumentReference? get adressSelection => _adressSelection;
  set adressSelection(DocumentReference? value) {
    _adressSelection = value;
    value != null
        ? prefs.setString('ff_adressSelection', value.path)
        : prefs.remove('ff_adressSelection');
  }

  String _adressNaim = '';
  String get adressNaim => _adressNaim;
  set adressNaim(String value) {
    _adressNaim = value;
    prefs.setString('ff_adressNaim', value);
  }

  LatLng? _mkanuserorder;
  LatLng? get mkanuserorder => _mkanuserorder;
  set mkanuserorder(LatLng? value) {
    _mkanuserorder = value;
    value != null
        ? prefs.setString('ff_mkanuserorder', value.serialize())
        : prefs.remove('ff_mkanuserorder');
  }

  int _akridorder = 0;
  int get akridorder => _akridorder;
  set akridorder(int value) {
    _akridorder = value;
    prefs.setInt('ff_akridorder', value);
  }

  int _akridorder2 = 0;
  int get akridorder2 => _akridorder2;
  set akridorder2(int value) {
    _akridorder2 = value;
    prefs.setInt('ff_akridorder2', value);
  }

  DateTime? _dataSchedule;
  DateTime? get dataSchedule => _dataSchedule;
  set dataSchedule(DateTime? value) {
    _dataSchedule = value;
    value != null
        ? prefs.setInt('ff_dataSchedule', value.millisecondsSinceEpoch)
        : prefs.remove('ff_dataSchedule');
  }

  String _taimSchedule = '';
  String get taimSchedule => _taimSchedule;
  set taimSchedule(String value) {
    _taimSchedule = value;
    prefs.setString('ff_taimSchedule', value);
  }

  String _fulltextSchedule = '';
  String get fulltextSchedule => _fulltextSchedule;
  set fulltextSchedule(String value) {
    _fulltextSchedule = value;
    prefs.setString('ff_fulltextSchedule', value);
  }

  /// طريقة الدفع
  String _payth = '';
  String get payth => _payth;
  set payth(String value) {
    _payth = value;
    prefs.setString('ff_payth', value);
  }

  bool _darkmode = false;
  bool get darkmode => _darkmode;
  set darkmode(bool value) {
    _darkmode = value;
    prefs.setBool('ff_darkmode', value);
  }

  String _imgDolh = '';
  String get imgDolh => _imgDolh;
  set imgDolh(String value) {
    _imgDolh = value;
  }

  String _textallAlmdn = '';
  String get textallAlmdn => _textallAlmdn;
  set textallAlmdn(String value) {
    _textallAlmdn = value;
  }

  String _msegAi = '';
  String get msegAi => _msegAi;
  set msegAi(String value) {
    _msegAi = value;
    prefs.setString('ff_msegAi', value);
  }

  bool _aiRow = false;
  bool get aiRow => _aiRow;
  set aiRow(bool value) {
    _aiRow = value;
  }

  double _TOTALmndob = 0.0;
  double get TOTALmndob => _TOTALmndob;
  set TOTALmndob(double value) {
    _TOTALmndob = value;
  }

  double _totalApp = 0.0;
  double get totalApp => _totalApp;
  set totalApp(double value) {
    _totalApp = value;
  }

  double _vat = 0.0;
  double get vat => _vat;
  set vat(double value) {
    _vat = value;
  }

  double _totalAllNew = 0.0;
  double get totalAllNew => _totalAllNew;
  set totalAllNew(double value) {
    _totalAllNew = value;
  }

  int _totalapp2 = 0;
  int get totalapp2 => _totalapp2;
  set totalapp2(int value) {
    _totalapp2 = value;
  }

  int _TOTALmndob2 = 0;
  int get TOTALmndob2 => _TOTALmndob2;
  set TOTALmndob2(int value) {
    _TOTALmndob2 = value;
  }

  int _vat2 = 0;
  int get vat2 => _vat2;
  set vat2(int value) {
    _vat2 = value;
  }

  String _totalAllnowPrent = '';
  String get totalAllnowPrent => _totalAllnowPrent;
  set totalAllnowPrent(String value) {
    _totalAllnowPrent = value;
  }

  int _totalAllNow2 = 0;
  int get totalAllNow2 => _totalAllNow2;
  set totalAllNow2(int value) {
    _totalAllNow2 = value;
  }

  String _adressVillTEXT = '';
  String get adressVillTEXT => _adressVillTEXT;
  set adressVillTEXT(String value) {
    _adressVillTEXT = value;
  }

  DocumentReference? _adressVillRev;
  DocumentReference? get adressVillRev => _adressVillRev;
  set adressVillRev(DocumentReference? value) {
    _adressVillRev = value;
  }

  int _VatDolh = 0;
  int get VatDolh => _VatDolh;
  set VatDolh(int value) {
    _VatDolh = value;
  }

  bool _isVat = false;
  bool get isVat => _isVat;
  set isVat(bool value) {
    _isVat = value;
  }

  String _RMZCurrency = '';
  String get RMZCurrency => _RMZCurrency;
  set RMZCurrency(String value) {
    _RMZCurrency = value;
  }

  TypeShrek? _type;
  TypeShrek? get type => _type;
  set type(TypeShrek? value) {
    _type = value;
  }

  DocumentReference? _ShrekNCountry;
  DocumentReference? get ShrekNCountry => _ShrekNCountry;
  set ShrekNCountry(DocumentReference? value) {
    _ShrekNCountry = value;
  }

  DocumentReference? _ShrekNCite;
  DocumentReference? get ShrekNCite => _ShrekNCite;
  set ShrekNCite(DocumentReference? value) {
    _ShrekNCite = value;
  }

  String _ShrekNCountryText = '';
  String get ShrekNCountryText => _ShrekNCountryText;
  set ShrekNCountryText(String value) {
    _ShrekNCountryText = value;
  }

  String _ShrekNCiteText = '';
  String get ShrekNCiteText => _ShrekNCiteText;
  set ShrekNCiteText(String value) {
    _ShrekNCiteText = value;
  }

  String _ShrekNRegionText = '';
  String get ShrekNRegionText => _ShrekNRegionText;
  set ShrekNRegionText(String value) {
    _ShrekNRegionText = value;
  }

  DocumentReference? _ShrekNRegionRev;
  DocumentReference? get ShrekNRegionRev => _ShrekNRegionRev;
  set ShrekNRegionRev(DocumentReference? value) {
    _ShrekNRegionRev = value;
  }

  int _totalKsm = 0;
  int get totalKsm => _totalKsm;
  set totalKsm(int value) {
    _totalKsm = value;
  }

  int _UbKsm = 0;
  int get UbKsm => _UbKsm;
  set UbKsm(int value) {
    _UbKsm = value;
  }

  double _NsbhKsm = 0.0;
  double get NsbhKsm => _NsbhKsm;
  set NsbhKsm(double value) {
    _NsbhKsm = value;
  }

  double _totalKsm2 = 0.0;
  double get totalKsm2 => _totalKsm2;
  set totalKsm2(double value) {
    _totalKsm2 = value;
  }

  double _totalmndob3 = 0.0;
  double get totalmndob3 => _totalmndob3;
  set totalmndob3(double value) {
    _totalmndob3 = value;
  }

  double _totalAllnow3 = 0.0;
  double get totalAllnow3 => _totalAllnow3;
  set totalAllnow3(double value) {
    _totalAllnow3 = value;
  }

  /// 1 لاماكن المضافة
  /// 2 معرفة السائق
  int _typeHgz = 0;
  int get typeHgz => _typeHgz;
  set typeHgz(int value) {
    _typeHgz = value;
  }

  /// يوضح هل يمكنة الحجز وفق الخيار المختار ام لا
  bool _AllowBooking = false;
  bool get AllowBooking => _AllowBooking;
  set AllowBooking(bool value) {
    _AllowBooking = value;
  }

  bool _DriverGuideState = false;
  bool get DriverGuideState => _DriverGuideState;
  set DriverGuideState(bool value) {
    _DriverGuideState = value;
  }

  LatLng? _mapSuggestaNewPlace;
  LatLng? get mapSuggestaNewPlace => _mapSuggestaNewPlace;
  set mapSuggestaNewPlace(LatLng? value) {
    _mapSuggestaNewPlace = value;
  }

  String _AdressTelet = '';
  String get AdressTelet => _AdressTelet;
  set AdressTelet(String value) {
    _AdressTelet = value;
  }

  String _LOceshtoaddAdress = '';
  String get LOceshtoaddAdress => _LOceshtoaddAdress;
  set LOceshtoaddAdress(String value) {
    _LOceshtoaddAdress = value;
  }

  /// اذا العنوان فوري
  bool _IsLnstantAddress = false;
  bool get IsLnstantAddress => _IsLnstantAddress;
  set IsLnstantAddress(bool value) {
    _IsLnstantAddress = value;
  }

  String _fullAdress = '';
  String get fullAdress => _fullAdress;
  set fullAdress(String value) {
    _fullAdress = value;
  }

  CardDataStruct _CardData = CardDataStruct();
  CardDataStruct get CardData => _CardData;
  set CardData(CardDataStruct value) {
    _CardData = value;
  }

  void updateCardDataStruct(Function(CardDataStruct) updateFn) {
    updateFn(_CardData);
  }

  /// إذا تم إختيار طريقة دفع الكترونية
  bool _ElectronicPayment = false;
  bool get ElectronicPayment => _ElectronicPayment;
  set ElectronicPayment(bool value) {
    _ElectronicPayment = value;
  }

  String _PayMyserid = '';
  String get PayMyserid => _PayMyserid;
  set PayMyserid(String value) {
    _PayMyserid = value;
  }

  /// إذا بدا بالدفع في ميسر تكون حالة true حتى عرض صفحة نتيجة الدفع
  bool _MyserStartPay = false;
  bool get MyserStartPay => _MyserStartPay;
  set MyserStartPay(bool value) {
    _MyserStartPay = value;
    prefs.setBool('ff_MyserStartPay', value);
  }

  bool _DonePay = false;
  bool get DonePay => _DonePay;
  set DonePay(bool value) {
    _DonePay = value;
    prefs.setBool('ff_DonePay', value);
  }

  TypeHgz? _TypeHgzPAYMOYSER;
  TypeHgz? get TypeHgzPAYMOYSER => _TypeHgzPAYMOYSER;
  set TypeHgzPAYMOYSER(TypeHgz? value) {
    _TypeHgzPAYMOYSER = value;
  }

  DocumentReference? _revOrderSaatExtr;
  DocumentReference? get revOrderSaatExtr => _revOrderSaatExtr;
  set revOrderSaatExtr(DocumentReference? value) {
    _revOrderSaatExtr = value;
  }

  DocumentReference? _RevMndonSaatExtra;
  DocumentReference? get RevMndonSaatExtra => _RevMndonSaatExtra;
  set RevMndonSaatExtra(DocumentReference? value) {
    _RevMndonSaatExtra = value;
  }

  String _idOrderSaatEXtra = '';
  String get idOrderSaatEXtra => _idOrderSaatEXtra;
  set idOrderSaatEXtra(String value) {
    _idOrderSaatEXtra = value;
  }

  int _NumberSaatExtra = 0;
  int get NumberSaatExtra => _NumberSaatExtra;
  set NumberSaatExtra(int value) {
    _NumberSaatExtra = value;
  }

  double _totalSaatEXTRA = 0.0;
  double get totalSaatEXTRA => _totalSaatEXTRA;
  set totalSaatEXTRA(double value) {
    _totalSaatEXTRA = value;
  }

  List<DocumentReference> _mkan = [];
  List<DocumentReference> get mkan => _mkan;
  set mkan(List<DocumentReference> value) {
    _mkan = value;
  }

  void addToMkan(DocumentReference value) {
    mkan.add(value);
  }

  void removeFromMkan(DocumentReference value) {
    mkan.remove(value);
  }

  void removeAtIndexFromMkan(int index) {
    mkan.removeAt(index);
  }

  void updateMkanAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    mkan[index] = updateFn(_mkan[index]);
  }

  void insertAtIndexInMkan(int index, DocumentReference value) {
    mkan.insert(index, value);
  }

  double _totalKM = 0.0;
  double get totalKM => _totalKM;
  set totalKM(double value) {
    _totalKM = value;
  }

  double _totalSaatKM = 0.0;
  double get totalSaatKM => _totalSaatKM;
  set totalSaatKM(double value) {
    _totalSaatKM = value;
  }

  LatLng? _akrLoceshn;
  LatLng? get akrLoceshn => _akrLoceshn;
  set akrLoceshn(LatLng? value) {
    _akrLoceshn = value;
  }

  int _Minimumhours = 0;
  int get Minimumhours => _Minimumhours;
  set Minimumhours(int value) {
    _Minimumhours = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

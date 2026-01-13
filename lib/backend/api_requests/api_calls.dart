import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreateInvoiceCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    int? number,
    String? amountFormat = '',
    String? osf = '',
    String? yarsCARD = '',
    String? monthCard = '',
    String? ccv = '',
  }) async {
    const ffApiRequestBody = '''
{
  "identityNumber": "7006309764",
  "commercialRecordNumber": "4031224235",
  "commercialRecordIssueDateHijri": "1440-07-07",
  "phoneNumber": "+966506279585",
  "extensionNumber": "1",
  "emailAddress": "ahmdrr777@gmail.com",
  "managerName": "محمد احمد امين عدنان جوير",
  "managerPhoneNumber": "+966506279585",
  "managerMobileNumber": "+966506279585",
  "activity": "SPECIALITY_TRANSPORT"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Invoice',
      apiUrl: 'https://wasl.tga.gov.sa/api/tracking/v1/operating-companies',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': '460303a1-49bd-446b-b3ac-2f2f0e37ea23',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? sum(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.amount_format''',
      ));
}

class ApiWasalCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "sequenceNumber": "609281120",
  "driverId": "1098876947",
  "tripId": "4",
  "distanceInMeters": 5100,
  "durationInSeconds": 3600,
  "customerRating": 1,
  "customerWaitingTimeInSeconds": 5,
  "originCityNameInArabic": "حائل",
  "destinationCityNameInArabic": "حائل",
  "originLatitude": 27.499814978014555,
  "originLongitude": 41.71623955619158,
  "destinationLatitude": 27.49288666817404,
  "destinationLongitude": 41.72284851910663,
  "pickupTimestamp": "2024-11-21T12:35:00.000",
  "dropoffTimestamp": "2024-11-21T13:35:00.000",  
  "tripCost": 300,
  "startedWhen": "2024-11-20T12:35:05.000"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'api wasal',
      apiUrl: 'https://wasl.api.elm.sa/api/dispatching/v2/trips',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'client-id': 'fd504148-a9c4-407d-9397-1b6577307517',
        'app-id': 'aa9bbe27',
        'app-key': '08de13da121531a8c259f60f10748e03',
        'Access-Control-Allow-Origin': '*',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class WatcCall {
  static Future<ApiCallResponse> call({
    String? to = '',
    String? msg = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'watc',
      apiUrl:
          'https://api.ultramsg.com/instance120084/messages/chat?token=60yms85dzyy07i56&to=$to&body=$msg',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PENmdenhCall {
  static Future<ApiCallResponse> call({
    String? io = '27.48390907229549,41.ئ728493419120994',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PENmdenh',
      apiUrl: 'https://api.opencagedata.com/geocode/v1/json',
      callType: ApiCallType.GET,
      headers: {
        'Accept-Language': 'ar',
      },
      params: {
        'q': io,
        'key': "7b09fd58649a4320b408791bcde56dec",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[:].components.city''',
      ));
  static String? address(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[:].components.road''',
      ));
  static String? add(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[:].components.neighbourhood''',
      ));
  static String? dolh(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.results[:].components.country''',
      ));
  static String? fullAdress(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results[:].formatted''',
      ));
}

class MyserCall {
  static Future<ApiCallResponse> call({
    String? description = 'Thamer',
    int? amount,
    String? name = '',
    String? number = '',
    String? cvc = '',
    String? year = '',
    String? month = '',
  }) async {
    final ffApiRequestBody = '''
{
  "amount": $amount,
  "currency": "SAR",
  "description": "${escapeStringForJson(description)}",
  "callback_url": "https://touritaxi.odoo.com/tmt-lm-lj",
  "source": {
    "type": "creditcard",
    "name": "${escapeStringForJson(name)}",
    "number": "${escapeStringForJson(number)}",
    "cvc": "${escapeStringForJson(cvc)}",
    "month": "${escapeStringForJson(month)}",
    "year": "${escapeStringForJson(year)}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Myser',
      apiUrl: 'https://api.moyasar.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic c2tfbGl2ZV9GRm1FZlhibVhucXB0NHhUNk1GUjNBc1p3WVFvQ2o1Y0g0S21qMVpXOg==',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.source.transaction_url''',
      ));
  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class MyserGetCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'myserGet',
      apiUrl: 'https://api.moyasar.com/v1/payments/',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic c2tfbGl2ZV9GRm1FZlhibVhucXB0NHhUNk1GUjNBc1p3WVFvQ2o1Y0g0S21qMVpXOg==',
        'Content-Type': 'application/json',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? halh(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.payments[:].status''',
      ));
  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.payments[:].id''',
      ));
}

class MyserRefundCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'myserRefund',
      apiUrl: 'https://api.moyasar.com/v1/payments/$id/void',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic c2tfbGl2ZV9GRm1FZlhibVhucXB0NHhUNk1GUjNBc1p3WVFvQ2o1Y0g0S21qMVpXOg==',
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}

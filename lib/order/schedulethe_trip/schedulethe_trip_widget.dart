import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'schedulethe_trip_model.dart';
export 'schedulethe_trip_model.dart';

/// Create a Flutter page for scheduling a trip.
///
/// The page should include the following elements:
///
/// Title: Display "Schedule Your Trip" at the top.
/// Date Picker:
/// A widget that allows the user to select a trip date (using a
/// calendar-style date picker).
/// Time Picker:
/// A widget that allows the user to select the trip time (using a time
/// picker).
/// Save Button:
/// A button labeled "Save Trip" to save the selected date and time.
/// Layout:
/// Arrange the date picker and time picker vertically using a column layout.
/// Add spacing between the widgets for better clarity and usability.
/// Ensure the save button is placed below the pickers for easy access.
/// Optional Features:
///
/// Display the selected date and time in a readable format once the user
/// selects them.
/// Consider adding a confirmation message or screen after the trip is
/// scheduled.
class ScheduletheTripWidget extends StatefulWidget {
  const ScheduletheTripWidget({super.key});

  static String routeName = 'ScheduletheTrip';
  static String routePath = '/scheduletheTrip';

  @override
  State<ScheduletheTripWidget> createState() => _ScheduletheTripWidgetState();
}

class _ScheduletheTripWidgetState extends State<ScheduletheTripWidget> {
  late ScheduletheTripModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduletheTripModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'aauqih1n' /* Schedule the Trip */,
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).labelMediumIsCustom,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 0.25,
                    decoration: const BoxDecoration(
                      color: Color(0xFFB7B5B7),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.25,
                    decoration: const BoxDecoration(
                      color: Color(0xFFB7B5B7),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 28.0, 0.0, 0.0),
                    child: FlutterFlowCalendar(
                      color: FlutterFlowTheme.of(context).primary,
                      iconColor: const Color(0xFF3F393F),
                      weekFormat: true,
                      weekStartsMonday: false,
                      initialDate: getCurrentTimestamp,
                      rowHeight: 44.75,
                      onChange: (DateTimeRange? newSelectedDate) {
                        safeSetState(
                            () => _model.calendarSelectedDay = newSelectedDate);
                      },
                      titleStyle:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                color: const Color(0xFF828282),
                                fontSize: 15.5,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                      dayOfWeekStyle:
                          FlutterFlowTheme.of(context).labelLarge.override(
                                font: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                                color: Colors.black,
                                fontSize: 9.3,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontStyle,
                              ),
                      dateStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color: Colors.black,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      selectedDateStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                font: GoogleFonts.lato(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                      inactiveDateStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                                font: GoogleFonts.lato(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                                color: const Color(0xFF3F393F),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .fontStyle,
                              ),
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 22.0, 0.0, 33.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '0m6rs2gg' /* Select the Time */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FlutterFlowDropDown<String>(
                              controller: _model.hoValueController ??=
                                  FormFieldController<String>(null),
                              options: [
                                FFLocalizations.of(context).getText(
                                  'txzd7ud0' /* 1 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'xpwy17eh' /* 2 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '59v6qu8e' /* 3 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'yjyjwoh9' /* 4 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'jmmnf4gl' /* 5 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '4qeacvin' /* 6 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'eosmry97' /* 7 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'oimc0hsy' /* 8 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  's769e4aj' /* 9 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  '0wkssu4g' /* 10 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'dsaod397' /* 11 */,
                                ),
                                FFLocalizations.of(context).getText(
                                  'k95rciu3' /* 12 */,
                                )
                              ],
                              onChanged: (val) =>
                                  safeSetState(() => _model.hoValue = val),
                              width: 100.0,
                              height: 40.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                '1q75q567' /* Hour */,
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: false,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  22.0, 0.0, 22.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.miValueController ??=
                                    FormFieldController<String>(
                                  _model.miValue ??=
                                      FFLocalizations.of(context).getText(
                                    'ikoasx9i' /* 00 */,
                                  ),
                                ),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    'pbd2uvr1' /* 00 */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'lpbwk788' /* 15 */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    '8j3feh3d' /* 30 */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'uh51b3yo' /* 45 */,
                                  )
                                ],
                                onChanged: (val) =>
                                    safeSetState(() => _model.miValue = val),
                                width: 100.0,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  '8pmtkzbu' /* Minute */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  22.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowDropDown<String>(
                                controller: _model.ftrhValueController ??=
                                    FormFieldController<String>(
                                  _model.ftrhValue ??=
                                      FFLocalizations.of(context).getText(
                                    '7fvoygad' /* PM */,
                                  ),
                                ),
                                options: [
                                  FFLocalizations.of(context).getText(
                                    '86wk383c' /* AM */,
                                  ),
                                  FFLocalizations.of(context).getText(
                                    'c2vjf4gu' /* PM */,
                                  )
                                ],
                                onChanged: (val) =>
                                    safeSetState(() => _model.ftrhValue = val),
                                width: 100.0,
                                height: 40.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'qd7e7kdp' /* AM */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 14.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 331.0,
                          height: 81.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                offset: const Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(11.0),
                              bottomRight: Radius.circular(11.0),
                              topLeft: Radius.circular(11.0),
                              topRight: Radius.circular(11.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 11.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'cqytzsi1' /* The trip time is */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w300,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 6.0, 0.0, 30.0),
                                child: Text(
                                  dateTimeFormat(
                                    "d/M/y",
                                    _model.calendarSelectedDay!.start,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.nunito(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 30.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if ((_model.calendarSelectedDay == null) ||
                            ((_model.hoValue == null || _model.hoValue == '') ||
                                (_model.miValue == null ||
                                    _model.miValue == '') ||
                                (_model.ftrhValue == null ||
                                    _model.ftrhValue == ''))) {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text(
                                      'يرجى التحقق من التاريخ والوقت'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('Ok'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          FFAppState().dataSchedule =
                              _model.calendarSelectedDay?.start;
                          FFAppState().taimSchedule =
                              '${_model.ftrhValue}${_model.hoValue}: ${_model.miValue} ';
                          FFAppState().fulltextSchedule =
                              valueOrDefault<String>(
                            'مجدول بتاريخ ${dateTimeFormat(
                              "d/M/y",
                              FFAppState().dataSchedule,
                              locale: FFLocalizations.of(context).languageCode,
                            )}  الساعة:  ${FFAppState().taimSchedule}',
                            'إختياري ، يمكنك إختيار تاريخ ووقت بدء الرحلة',
                          );
                          FFAppState().update(() {});

                          context.pushNamed(Checkout66Widget.routeName);
                        }
                      },
                      text: FFLocalizations.of(context).getText(
                        '79mh13gj' /* Confirm */,
                      ),
                      icon: const Icon(
                        Icons.done_outline_sharp,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 53.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

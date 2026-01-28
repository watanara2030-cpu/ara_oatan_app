import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'chat2_model.dart';
export 'chat2_model.dart';

class Chat2Widget extends StatefulWidget {
  const Chat2Widget({
    super.key,
    required this.idorder,
    this.naimMndob,
    this.phoneMndob,
    this.imgMndob,
    required this.idmndob,
  });

  final DocumentReference? idorder;
  final String? naimMndob;
  final int? phoneMndob;
  final String? imgMndob;
  final DocumentReference? idmndob;

  static String routeName = 'chat2';
  static String routePath = '/chat2';

  @override
  State<Chat2Widget> createState() => _Chat2WidgetState();
}

class _Chat2WidgetState extends State<Chat2Widget> {
  late Chat2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Chat2Model());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OrderRecord>>(
      stream: queryOrderRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitChasingDots(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<OrderRecord> chat2OrderRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderRadius: 20.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              title: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 36.0,
                    height: 36.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    

                    child: Image(
  fit: BoxFit.cover,
  image: (widget.imgMndob != null && widget.imgMndob!.isNotEmpty)
      ? NetworkImage(widget.imgMndob!)
      : const AssetImage('assets/images/__2025-07-09_133622.png') as ImageProvider,
),

                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.naimMndob,
                          '-',
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleMediumIsCustom,
                                ),
                      ),
                    ],
                  ),
                ].divide(const SizedBox(width: 12.0)),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      16.0, 0.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.phone,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 20.0,
                        ),
                        onPressed: () async {
                          await launchUrl(Uri(
                            scheme: 'tel',
                            path: widget.phoneMndob!.toString(),
                          ));
                        },
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.location_on,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 20.0,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ].divide(const SizedBox(width: 8.0)),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 621.32,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: StreamBuilder<List<ChatRecord>>(
                          stream: queryChatRecord(
                            queryBuilder: (chatRecord) => chatRecord
                                .where(
                                  'idorder',
                                  isEqualTo: widget.idorder,
                                )
                                .orderBy('date', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitChasingDots(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<ChatRecord> listViewChatRecordList =
                                snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              reverse: true,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewChatRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewChatRecord =
                                    listViewChatRecordList[listViewIndex];
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Container(
                                              constraints: const BoxConstraints(
                                                maxWidth: 280.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: listViewChatRecord
                                                            .user1 ==
                                                        currentUserReference
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondary
                                                    : const Color(0xFFE2E3E3),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      listViewChatRecord.naim,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: listViewChatRecord
                                                                        .user1 ==
                                                                    currentUserReference
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                    Text(
                                                      listViewChatRecord.msg,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: listViewChatRecord
                                                                        .user1 ==
                                                                    currentUserReference
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat(
                                                        "jm",
                                                        listViewChatRecord
                                                            .date!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily,
                                                            color: listViewChatRecord
                                                                        .user1 ==
                                                                    currentUserReference
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallIsCustom,
                                                          ),
                                                    ),
                                                  ].divide(const SizedBox(
                                                      height: 4.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'yvnt7xqi' /* Type your message... */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 12.0, 16.0, 12.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                  maxLines: 3,
                                  minLines: 1,
                                  keyboardType: TextInputType.multiline,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.send,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  if (_model.textController.text != '') {
                                    await ChatRecord.collection
                                        .doc()
                                        .set(createChatRecordData(
                                          idorder: widget.idorder,
                                          user1: currentUserReference,
                                          msg: _model.textController.text,
                                          date: getCurrentTimestamp,
                                          naim: currentUserDisplayName,
                                        ));
                                    triggerPushNotification(
                                      notificationTitle: 'رسالة خاصة',
                                      notificationText:
                                          _model.textController.text,
                                      userRefs: [widget.idmndob!],
                                      initialPageName: 'List',
                                      parameterData: {},
                                    );
                                    safeSetState(() {
                                      _model.textController?.clear();
                                    });
                                    await WatcCall.call(
                                      to: widget.phoneMndob?.toString(),
                                      msg:
                                          '📩 تم استلام رسالة خاصة من العميل، يمكنك الاطلاع عليها في تفاصيل الطلب.',
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'اكتب رسالة',
                                          style: TextStyle(
                                            fontFamily: 'cairo',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        duration:
                                            const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ].divide(const SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

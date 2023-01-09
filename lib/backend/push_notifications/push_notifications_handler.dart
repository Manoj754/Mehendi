import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.black,
          child: Image.asset(
            'assets/images/Splash_Screen_(2).png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'loginregisterpage': (data) async => LoginregisterpageWidget(),
  'loginregisterpageCopy': (data) async => LoginregisterpageCopyWidget(
        emailentered: getParameter(data, 'emailentered'),
      ),
  'forgottenpassword': (data) async => ForgottenpasswordWidget(),
  'searchresultspage': (data) async => SearchresultspageWidget(
        searchbarinput: getParameter(data, 'searchbarinput'),
        searchresults: getParameter(data, 'searchresults'),
      ),
  'newvideo': (data) async => hasMatchingParameters(data, {
        'vidquery',
        'namequeryforvideo',
        'taglistforvideo',
        'thumbnailquery'
      })
          ? NewvideoWidget(
              vidquery: getParameter(data, 'vidquery'),
              namequeryforvideo: getParameter(data, 'namequeryforvideo'),
              taglistforvideo: getParameter(data, 'taglistforvideo'),
              thumbnailquery: getParameter(data, 'thumbnailquery'),
            )
          : NavBarPage(initialPage: 'newvideo'),
  'SearchPage': (data) async => NavBarPage(initialPage: 'SearchPage'),
  'EditProfile': (data) async => EditProfileWidget(),
  'SavedIdeas': (data) async => NavBarPage(initialPage: 'SavedIdeas'),
  'InfluencerRegister': (data) async => InfluencerRegisterWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}

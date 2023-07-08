// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:awesome_notifications/awesome_notifications.dart';

Future awesomeNotification(
    int? idMorning,
    String? morningTitle,
    String? morningMessage,
    int? morningHour,
    int? morningMinute,
    bool? morningturnedOn) async {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'tap_in_notification',
        channelName: 'TapIn Notification',
        channelDescription: 'tap_in',
        importance: NotificationImportance.High,
        channelShowBadge: true,
        locked: false,
      ),
    ],
  );
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });

  String localTimeZone =
      await AwesomeNotifications().getLocalTimeZoneIdentifier();

  if (morningturnedOn == true) {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: idMorning!,
            channelKey: 'tap_in_notification',
            title: morningTitle,
            body: morningMessage),
        schedule: NotificationCalendar(
            hour: morningHour,
            minute: morningMinute,
            second: 00,
            timeZone: localTimeZone,
            preciseAlarm: true,
            repeats: true));
  }
  if (morningturnedOn == false) {
    await AwesomeNotifications().cancel(idMorning!);
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_timezone/flutter_timezone.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class AndroidNotificationService {
//   static final AndroidNotificationService _instance =
//       AndroidNotificationService._internal();
//   factory AndroidNotificationService() => _instance;
//   AndroidNotificationService._internal();

//   final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
//     'daily_alert_channel',
//     'Daily Alerts',
//     description: 'Notifications scheduled for specific times of the day',
//     importance: Importance.max,
//     priority: Priority.high,
//   );

//   Future<void> initialize() async {
//     // 1. Initialize timezone database
//     tz.initializeTimeZones();

//     // 2. Set the device's native local timezone
//     final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
//     tz.setLocalLocation(tz.getLocation(currentTimeZone));

//     // 3. Android notification setup
//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initSettings = InitializationSettings(
//       android: androidSettings,
//     );

//     await _notificationsPlugin.initialize(initSettings);

//     final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
//         _notificationsPlugin
//             .resolvePlatformSpecificImplementation<
//               AndroidFlutterLocalNotificationsPlugin
//             >();

//     await androidImplementation?.createNotificationChannel(_channel);
//     await androidImplementation?.requestNotificationsPermission();
//   }

//   // Calculate the next occurrence of 7:42 PM
//   tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate = tz.TZDateTime(
//       tz.local,
//       now.year,
//       now.month,
//       now.day,
//       hour,
//       minute,
//     );

//     // If 7:42 PM has already passed today, schedule for tomorrow at 7:42 PM
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     return scheduledDate;
//   }

//   // Schedule notification for 7:42 PM (19:42)
//   Future<void> scheduleDaily742PMNotification({
//     required int id,
//     required String title,
//     required String body,
//     String? payload,
//   }) async {
//     final tz.TZDateTime scheduledTime = _nextInstanceOfTime(19, 42);

//     await _notificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       scheduledTime,
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           _channel.id,
//           _channel.name,
//           channelDescription: _channel.description,
//           importance: Importance.max,
//           priority: Priority.high,
//           icon: '@mipmap/ic_launcher',
//         ),
//       ),
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents:
//           DateTimeComponents.time, // Repeats daily at 7:42 PM
//       payload: payload,
//     );

//     print('Scheduled for: $scheduledTime in timezone: ${tz.local.name}');
//   }
// }

import 'dart:convert';
import 'dart:io' show Platform;

import 'package:ecommerce_mobile/data/base/utils/app_logger.dart';
import 'package:ecommerce_mobile/data/user/interactor/user_interactor.dart';
import 'package:ecommerce_mobile/presentation/notification/model/notification_channel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../base/model/constants.dart';
import 'model/notification_data.dart';
import 'model/notification_type_route.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    NotificationChannel.channelId, NotificationChannel.channelName);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class NotificationController extends GetxController {
  final UserInteractor userInteractor;

  Rx<NotificationData> notificationData = NotificationData().obs;

  NotificationController({required this.userInteractor});

  void configure() async {
    try {
      await _initializeFirebase();
      await _setupPushNotification();
      await _listenToNotifications();
    } catch (error, stack) {
      AppLogger.error(error: error, errorStack: stack);
    }
  }

  Future<void> _initializeFirebase() async {
    if (Platform.isIOS) {
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: firebaseApiKey,
              appId: firebaseAppId,
              messagingSenderId: firebaseMessagingSenderId,
              projectId: firebaseProjectId));
    } else {
      await Firebase.initializeApp();
    }
    final fcmToken = await FirebaseMessaging.instance.getToken();
    AppLogger.debug(message: 'FCM Token $fcmToken');
    userInteractor.saveFCMToken(fcmToken.toString());
  }

  Future<void> _setupPushNotification() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      const android = AndroidInitializationSettings('@mipmap/ic_launcher');
      const platformSettings = InitializationSettings(android: android);
      await flutterLocalNotificationsPlugin.initialize(platformSettings,
          onDidReceiveNotificationResponse: _onNotificationTap);
    }
  }

  Future<void> _listenToNotifications() async {
    /*
     For Android when notification is clicked (when app is killed)
    method onMessageOpenedApp will be triggered.
     */
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        _refreshNotificationData(message.data);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: '@mipmap/ic_launcher',
              ),
            ),
            payload: json.encode(message.data));
      }
    });

    /*
    For iOS, when notification is clicked (when app on background, terminated or foreground),
    method onMessageOpenedApp will be triggered.
    For Android when notification is clicked (when app on background)
    method onMessageOpenedApp will be triggered.
     */
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _refreshNotificationData(message.data);
    });
  }

  Future<dynamic> _onNotificationTap(NotificationResponse data) async {
    _refreshNotificationData(json.decode(data.payload.toString()));
  }

  void _refreshNotificationData(Map<String, dynamic> data) {
    AppLogger.debug(message: data.toString());
    notificationData.value.route = NotificationTypeNavigateRoutes.home;
    notificationData.refresh();
  }

  void sendPushNotificationToken() {
    userInteractor.sendPushNotificationToken();
  }
}

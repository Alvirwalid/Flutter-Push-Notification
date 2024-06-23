import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;

class FirebaseApiController extends GetxController{
  TextEditingController title=TextEditingController();
  final _firebaseMessage= FirebaseMessaging.instance;
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

  RxString notificationMessage=RxString("");

 Future<void> initNotification()async{
   await _firebaseMessage.requestPermission();

 }



  Future<String> getAccessToken() async {
    // Your client ID and client secret obtained from Google Cloud Console
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "pushnotification-f5369",
      "private_key_id": "6d06445a1ee5bb6d69f7a719dcd7a639e0840aea",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCPaT11bRdo2r+2\nwU/Sbk7Jobl/mb9Yn3rq8Dpt6E57tNZ7WBDm9OzfyvWR+mdHVE5fnjecIPPZ1b5d\n4WQaJa6P+cv1mmQrC1CMBonjF7FbEdy09/JTFk1LEup5ekfKH4Rcb7ORshWxo35i\nrhX9/Ha/NG64NVNGPwpMwAaqJCNb7OjIceSzv+zsTxtzX/Vk00biaqggO20z5dnY\n2GsoSmGevCECRrfbl0+ils4SvtVzbTU8LjzEUYHdU7CsdIycyzSb0FTdBItynzY6\ng2VbrDBItbn2ZVKGn6hNeyN5uG+imKYuo+zrlnzjygx/0cN/FegVsHyPlNS90jHA\nDf18U7xbAgMBAAECggEAFe6Dwh4FWvk9IW9NzEInVWmgqzVxkFWPYDeNz/obaoq8\n1E8jApcJVK4+wOzY940akT/qhDt731/zRXsvKlqB6C3M9cn/MKAB2PA1DSA19NX1\n+U0D55X9CxKg/iPnr68DOHmyrgDclXaJ4QB7h4ShCluz5QLuscr5QcSKIGH3cFq/\nkrWWtBcO2dUp256ZyQ7UWfSf7pUPXjKmJylLMBfUP/5/Os7mdbas441LpzPlRZrU\nuAV8fxx5wBZFEKmZDIjxX52m8rNCXIzwkmOCJsJr333OG9RMJ9ef4dFfxtJ4bmkP\nd+XYUr1El9K+cmMKwnCqt7ZZO4z+K7YAr/a71w7KGQKBgQDIZsvMNA8ER5ZS9oJS\nCkCOl8AMT8EdU6SuUN888H7Xi91rSeCVbwvikyIgkq+00/ze5P0ZIj7V1Gu7hSXf\nMooGIBLZo5DDFawDKriosOfrLVGGqxl9prp1iZpNUHQglwTTwrGiAT6v7dIPJSKN\nBmY9giF/IgUlObMPPDHZZempOQKBgQC3Msly46Uimiwg25DVinMdAufCpYCvp2V+\nzfyer0HOJik5dfwtXba3zgYclbE/G5kyccA9ogXGzUBBF9zav+lk7P69qhBh4Ohk\nT+OM7xqWaT2Qkm8/JAXZQ/44iII0YcIVI8sn5PoJzQCuFGREawkcuqMOFZMDZH7b\nqTSCpr02MwKBgFuIiGF3DbzYrdKrAY9TW3VF3tRAwWYRxFBSZATDnEv7eGD+13Op\nyvXsWlQia9reUMvGL8yBFc45PhPilw/BV8XAdJuv1/kjNvQjWUDDvMpwYqJuGDCK\nLPRuq2nQ65nPIMdQUC48/1L//0gnoAZl++DwRTh6Y3tDRYQZ7HLt17IRAoGAe3TR\nRwhcL65gEKCGwTE1FBbyIj0wNK+FeWfNVw7aNNeIrn1xPQ1LZiCEA91o/hNWMSVx\nHNfENs35ACTZo9zypx4DKcOimKNdWMRxn3c+nqA7aeMU7yMSgfENMAHmZPCAP4jI\njpEDY3lwfN+nFmhfUqn/2iz1zrJ5vwQPLAC7v/sCgYBiF/aPVZ04Iv1hldogGa23\n3BDbWNAZjGRLUsN9XSWzEmEPrP/iETAm76fqjVJbxIxp0Tc3BPvMslMzUhRy3u1j\nDrWgw+XsUova9LCdzXH/j5g6osv/1lnXbdfrloBioiAamgYG6cFdke3XyJWJc9Mz\naB6ZbY3aQ4tlVR+b2vd8ew==\n-----END PRIVATE KEY-----\n",
      "client_email": "firebase-adminsdk-ihdew@pushnotification-f5369.iam.gserviceaccount.com",
      "client_id": "106847295909641379272",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-ihdew%40pushnotification-f5369.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };

    List<String> scopes = [
      // "https://www.googleapis.com/auth/userinfo.email",
      // "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );
    // Obtain the access token
    auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        client
    );
    // Close the HTTP client
    client.close();

    return credentials.accessToken.data;

  }

  Future<void> sendFCMMessage() async {
    NotificationSettings settings = await _firebaseMessage.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,

    );



    final String serverKey = await getAccessToken() ; // Your FCM server key
    const String fcmEndpoint = 'https://fcm.googleapis.com/v1/projects/pushnotification-f5369/messages:send';
    final  currentFCMToken = await FirebaseMessaging.instance.getToken();
    final Map<String, dynamic> message = {
      'message': {
        'token': currentFCMToken, // Token of the device you want to send the message to
        'notification': {
          'body': 'This is an FCM notification message!',
          'title': title.text
        },
        'data': {
          'current_user_fcm_token': currentFCMToken, // Include the current user's FCM token in data payload
        },
      }
    };

    // print(message);

    final http.Response response = await http.post(
      Uri.parse(fcmEndpoint),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverKey',
      },
      body: jsonEncode(message),
    );

    // print(["Status Code : ",response.statusCode]);
    //
    if (response.statusCode == 200) {
      print('FCM message sent successfully');
    } else {
      print('Failed to send FCM message: ${response.statusCode}');
    }
  }
 onMassage(){
       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
               _handleMessage(message);

               if(Platform.isAndroid){
                 showNotification(message);
                 inItLocalNotification(message);


               }else{
                 showNotification(message);

               }
       });
     }

  onMessageOpenedApp(){
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    _handleMessage(message);
    });
  }

  inItLocalNotification(RemoteMessage message){

    var androidInitializationSetting=AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSetting=DarwinInitializationSettings();

    var initilizationSetting=InitializationSettings(
        android: androidInitializationSetting,
        iOS: iosInitializationSetting
    );
    _flutterLocalNotificationsPlugin.initialize(initilizationSetting,
        // onDidReceiveBackgroundNotificationResponse:(payload) {
        //   handleMessage(message);
        //
        // } ,
        onDidReceiveNotificationResponse: (payload) {
          _handleMessage(message);

        }
    );
  }
  void _handleMessage(RemoteMessage message) {
    notificationMessage.value=message.notification?.title??"";

    print([message.notification?.title," : notificationMessage"]);

    // print('Message data: ${message.data}');
    // Log the event to Firebase Analytics
    analytics.logEvent(
      name: 'notification_received',
      parameters: <String, Object>{
        'title': message.notification?.title ?? 'No Title',
        'body': message.notification?.body ?? 'No Body',
      },
    );

  }


  showNotification(message){

    AndroidNotificationChannel channel=AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),'channel name');


    AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails(
        channel.id, channel.name,
        priority: Priority.high,
        channelDescription: 'Your channel description',
        ticker: 'ticker'
    );

    DarwinNotificationDetails darwinNotificationDetails=const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true
    );

    NotificationDetails notificationDetails=NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
    Future.delayed(Duration.zero,(){
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails);
    });
  }
}
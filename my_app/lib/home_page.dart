import 'dart:convert';
import 'dart:developer';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;
import 'package:my_app/firebase_api.dart';
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   final controller=Get.put(FirebaseApiController());

  @override
  void initState() {
    super.initState();
    controller.onMassage();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),automaticallyImplyLeading: false, centerTitle: true,titleTextStyle: TextStyle(
          color: Colors.lightBlue[200],
          fontWeight: FontWeight.w800,
          fontSize: 28
      ),),
      body:GetX<FirebaseApiController>(
        init: FirebaseApiController(),
        builder: (_) {
          return ListView(
            padding: const EdgeInsets.all(30),
            children: [
              Text(_.notificationMessage.value),
              TextFormField(
                controller: _.title,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(10))
                ),


              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {
                  _.sendFCMMessage();
                  },

                child: const Text("Send Message"),
              ),

            ],
          );
        }
      ) ,
    );
  }
}
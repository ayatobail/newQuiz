import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:new_quiz/core/data/repositories/shared_preference_repositories.dart';
import 'package:new_quiz/core/services/location_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/my_app_controller.dart';
import 'core/services/cart_service.dart';
import 'app/my_app.dart';
import 'core/services/connectivity_service.dart';
import 'core/services/notification_service.dart';
import 'firebase_options.dart';
SharedPreferences? globalSharedPrefs;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(
        () async {
      var sharedPref = await SharedPreferences.getInstance();
      return sharedPref;
    },
  );

  Get.put(sharedPreferenceRepository());
  //Get.put(CartService());
  Get.put(ConnectivityService());
  Get.put(LocationService());
  Get.put(MyAppController());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(NotificationService());
  runApp(MyApp());
}


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frinfo/model/friend_model.dart';
import 'package:frinfo/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///This will create directory(Folder) at Application Document Directory
  //Directory directory = await getApplicationDocumentsDirectory();

  //Initialize Hive
  await Hive.initFlutter();

  //Register Hive Adapter to convert data into bytes
  Hive.registerAdapter<FriendModel>(FriendModelAdapter());

  //Open friends box to save friends of type FriendModel
  await Hive.openBox<FriendModel>('friends');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

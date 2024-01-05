import 'package:flutter/material.dart';
import 'package:frinfo/add_friends_screen.dart';
import 'package:frinfo/colors.dart';
import 'package:frinfo/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        title: const Text(
          'Home Screen',
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: greenColor,
        onPressed: () {
          goNextScreen(context, const AddFriendsScreen());
        },
        child: const Icon(
          Icons.add,
          color: whiteColor,
        ),
      ),
      body: const Center(
        child: Text(
          "You don't have any friends\npress (+) button to add one!",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

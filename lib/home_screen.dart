import 'package:flutter/material.dart';
import 'package:frinfo/add_friends_screen.dart';
import 'package:frinfo/colors.dart';
import 'package:frinfo/model/friend_model.dart';
import 'package:frinfo/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //An empty friends list
  List<FriendModel> friendList = [];

  @override
  void initState() {
    getFriendsFromDatabase();
    super.initState();
  }

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
      body:

          // const Center(
          //   child: Text(
          //     "You don't have any friends\npress (+) button to add one!",
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          ListView.builder(
        itemCount: friendList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.green,
              leading: CircleAvatar(
                backgroundImage: MemoryImage(friendList[index].image!),
              ),
              title: Text(
                friendList[index].name!,
                style: const TextStyle(
                  color: whiteColor,
                ),
              ),
              subtitle: Text(
                friendList[index].number!,
                style: const TextStyle(
                  color: whiteColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  //Function to get friends from Hive Database
  Future<void> getFriendsFromDatabase() async {

    //Accessed the box of Friends
    Box<FriendModel> friendsBox = Hive.box<FriendModel>('friends');

    //Converted all the box values to list and assigned them to our list
    friendList = friendsBox.values.toList().cast<FriendModel>();

    //Change Screen state to show data
    setState(() {});
  }
}

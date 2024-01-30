import 'package:flutter/material.dart';
import 'package:frinfo/add_friends_screen.dart';
import 'package:frinfo/colors.dart';
import 'package:frinfo/model/friend_model.dart';
import 'package:frinfo/routes.dart';
import 'package:frinfo/view_friend_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //An empty friends list
  List<FriendModel> friendList = [];
  Box<FriendModel>? friendsBox;

  @override
  void initState() {
    friendsBox = Hive.box<FriendModel>('friends');
    //getFriendsFromDatabase();
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
        body: ValueListenableBuilder(
            valueListenable: friendsBox!.listenable(),
            builder: (context, _, __) {
              friendList = friendsBox!.values.toList().cast<FriendModel>();
              return friendList.isEmpty
                  ? const Center(
                      child: Text(
                        "You don't have any friends\npress (+) button to add one!",
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView.builder(
                      itemCount: friendList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            tileColor: Colors.green,
                            onTap: () {
                              goNextScreen(
                                  context,
                                  ViewFriendScreen(
                                      friendName: friendList[index].name!,
                                      friendNumber: friendList[index].number!,
                                      friendDesc: friendList[index].desc!,
                                      friendImage: friendList[index].image!));
                            },
                            onLongPress: () {
                              callMyFriend(friendList[index].number!);
                            },
                            leading: CircleAvatar(
                              backgroundImage:
                                  MemoryImage(friendList[index].image!),
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
                            trailing: IconButton(
                                onPressed: () {
                                  deleteFriend(index);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: whiteColor,
                                )),
                          ),
                        );
                      },
                    );
            }));
  }

  // //Function to get friends from Hive Database
  // Future<void> getFriendsFromDatabase() async {
  //   //Accessed the box of Friends

  //   //Converted all the box values to list and assigned them to our list
  //   friendList = friendsBox!.values.toList().cast<FriendModel>();

  //   //Change Screen state to show data
  //   setState(() {});
  // }

  Future<void> deleteFriend(int index) async {
    friendList.removeAt(index);
    await friendsBox!.deleteAt(index);
    setState(() {});
  }

  Future<void> callMyFriend(String number) async {
    if (!await launchUrl(Uri.parse('tel:$number'))) {
      throw Exception('Could not launch');
    }
  }
}

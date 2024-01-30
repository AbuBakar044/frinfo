import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frinfo/colors.dart';

class ViewFriendScreen extends StatefulWidget {
  final String friendName;
  final String friendNumber;
  final String friendDesc;
  final Uint8List friendImage;

  const ViewFriendScreen(
      {super.key,
      required this.friendName,
      required this.friendNumber,
      required this.friendDesc,
      required this.friendImage});

  @override
  State<ViewFriendScreen> createState() => _ViewFriendScreenState();
}

class _ViewFriendScreenState extends State<ViewFriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
           title: Text(widget.friendName, style: TextStyle(color: whiteColor,),),
          ),
    );
  }
}

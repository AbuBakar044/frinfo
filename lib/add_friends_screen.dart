import 'package:flutter/material.dart';
import 'package:frinfo/colors.dart';
import 'package:frinfo/routes.dart';

class AddFriendsScreen extends StatefulWidget {
  const AddFriendsScreen({super.key});

  @override
  State<AddFriendsScreen> createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            removeRoute(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
        ),
        title: const Text(
          'Add Friends',
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              CircleAvatar(
                radius: 65.0,
                backgroundColor: Colors.amber,
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Add Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Add Number'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Add Description'),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(color: whiteColor),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    greenColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

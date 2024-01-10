import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frinfo/colors.dart';
import 'package:frinfo/routes.dart';
import 'package:image_picker/image_picker.dart';

class AddFriendsScreen extends StatefulWidget {
  const AddFriendsScreen({super.key});

  @override
  State<AddFriendsScreen> createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {
  Uint8List? friendImage;
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
          icon:  const Icon(
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
              InkWell(
                onTap: () {
                  showSheet();
                },
                child: CircleAvatar(
                  radius: 65.0,
                  backgroundColor: Colors.amber,
                  backgroundImage: friendImage == null
                      ? const AssetImage('assets/images/logo.jpg')
                      : MemoryImage(friendImage!) as ImageProvider,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Add Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Add Number'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                maxLines: 10,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Add Description'),
              ),
              const SizedBox(
                height: 40.0,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(color: whiteColor),
                ),
                style: const ButtonStyle(
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

  showSheet() {
    return showModalBottomSheet(
        context: context,
        backgroundColor: greenColor,
        builder: (context) {
          return Container(
            height: MediaQuery.sizeOf(context).height / 4,
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text(
                    'Choose Picture From',
                    style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                pickImage(ImageSource.camera);
                              },
                              icon: const Icon(
                                Icons.camera,
                                size: 34,
                                color: whiteColor,
                              ),
                            ),
                            const Text(
                              'Camera',
                              style: TextStyle(
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                pickImage(ImageSource.gallery);
                              },
                              icon: const Icon(
                                Icons.album,
                                size: 34,
                                color: whiteColor,
                              ),
                            ),
                            const Text(
                              'Gallery',
                              style: TextStyle(
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<void> pickImage(ImageSource source) async {
    XFile? choosedImage = await ImagePicker().pickImage(source: source);

    if (choosedImage == null) {
      return;
    } else {
      friendImage = await choosedImage.readAsBytes();
      setState(() {});

      print('.........................$friendImage');
      removeRoute(context);
    }
  }
}

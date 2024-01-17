import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'friend_model.g.dart';

@HiveType(typeId: 0)
class FriendModel {
  @HiveField(0)
  Uint8List? image;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? number;

  @HiveField(3)
  String? desc;

  //Constructor
  FriendModel({
    this.image,
    this.name,
    this.number,
    this.desc,
  });
}

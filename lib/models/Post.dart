import 'Item/item.dart';

class Post {
  Post({
    this.id,
    this.item,
    this.postCreateTime,
    this.postUpdateTime,
  });

  int? id;
  Item? item;
  DateTime? postCreateTime;
  DateTime? postUpdateTime;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"] == null ? null : json["id"],
        item: json["item"] == null ? null : Item.fromJson(json["item"]),
        postCreateTime: json["post_create_time"] == null
            ? null
            : DateTime.parse(json["post_create_time"]),
        postUpdateTime: json["post_update_time"] == null
            ? null
            : DateTime.parse(json["post_update_time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "item": item == null ? null : item?.toJson(),
        "post_create_time":
            postCreateTime == null ? null : postCreateTime?.toIso8601String(),
        "post_update_time":
            postUpdateTime == null ? null : postUpdateTime?.toIso8601String(),
      };
}

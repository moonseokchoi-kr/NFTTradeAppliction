import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    this.id,
    this.title,
    this.userId,
    this.sellState,
    this.price,
    this.createdDate,
    this.nftDescription,
    this.nftHash,
    this.tokenId,
    this.creator,
    this.imagePath,
    this.owner,
    this.modifiedDate,
  });

  int? id;
  String? title;
  int? userId;
  int? sellState;
  double? price;
  DateTime? createdDate;
  String? nftDescription;
  String? nftHash;
  String? tokenId;
  String? creator;
  String? imagePath;
  String? owner;
  DateTime? modifiedDate;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        userId: json["user_id"] == null ? null : json["user_id"],
        sellState: json["sell_state"] == null ? null : json["sell_state"],
        price: json["price"] == null ? null : json["price"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        nftDescription:
            json["nft_description"] == null ? null : json["nft_description"],
        nftHash: json["nft_hash"] == null ? null : json["nft_hash"],
        tokenId: json["token_id"] == null ? null : json["token_id"],
        creator: json["creator"] == null ? null : json["creator"],
        imagePath: json["image_path"] == null ? null : json["image_path"],
        owner: json["owner"] == null ? null : json["owner"],
        modifiedDate: json["modifiedDate"] == null
            ? null
            : DateTime.parse(json["modifiedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "user_id": userId == null ? null : userId,
        "sell_state": sellState == null ? null : sellState,
        "price": price == null ? null : price,
        "createdDate":
            createdDate == null ? null : createdDate!.toIso8601String(),
        "nft_description": nftDescription == null ? null : nftDescription,
        "nft_hash": nftHash == null ? null : nftHash,
        "token_id": tokenId == null ? null : tokenId,
        "creator": creator == null ? null : creator,
        "image_path": imagePath == null ? null : imagePath,
        "owner": owner == null ? null : owner,
        "modifiedDate":
            modifiedDate == null ? null : modifiedDate!.toIso8601String(),
      };
}

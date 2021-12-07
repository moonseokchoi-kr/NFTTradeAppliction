import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    this.id,
    this.tokenId,
    this.nftDescription,
    this.nftHash,
    this.title,
    this.creator,
    this.imagePath,
    this.owner,
    this.price,
    this.createDate,
    this.sellState,
  });

  String? id;
  String? tokenId;
  String? nftDescription;
  String? nftHash;
  String? title;
  String? creator;
  String? imagePath;
  String? owner;
  int? price;
  String? createDate;
  int? sellState;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] == null ? null : json["id"],
        tokenId: json["token_id"] == null ? null : json["token_id"],
        nftDescription:
            json["nft_description"] == null ? null : json["nft_description"],
        nftHash: json["nft_hash"] == null ? null : json["nft_hash"],
        title: json["title"] == null ? null : json["title"],
        creator: json["creator"] == null ? null : json["creator"],
        imagePath: json["image_path"] == null ? null : json["image_path"],
        owner: json["owner"] == null ? null : json["owner"],
        price: json["price"] == null ? null : json["price"],
        createDate: json["create_date"] == null ? null : json["create_date"],
        sellState: json["sell_state"] == null ? null : json["sell_state"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "token_id": tokenId == null ? null : tokenId,
        "nft_description": nftDescription == null ? null : nftDescription,
        "nft_hash": nftHash == null ? null : nftHash,
        "title": title == null ? null : title,
        "creator": creator == null ? null : creator,
        "image_path": imagePath == null ? null : imagePath,
        "owner": owner == null ? null : owner,
        "price": price == null ? null : price,
        "create_date": createDate == null ? null : createDate,
        "sell_state": sellState == null ? null : sellState,
      };
}

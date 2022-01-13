import 'dart:convert';

TransferRequest transferRequestFromJson(String str) =>
    TransferRequest.fromJson(json.decode(str));

String transferRequestToJson(TransferRequest data) =>
    json.encode(data.toJson());

class TransferRequest {
  TransferRequest({
    this.sender,
    this.owner,
    this.to,
    this.tokenId,
  });

  String? sender;
  String? owner;
  String? to;
  String? tokenId;

  factory TransferRequest.fromJson(Map<String, dynamic> json) =>
      TransferRequest(
        sender: json["sender"] == null ? null : json["sender"],
        owner: json["owner"] == null ? null : json["owner"],
        to: json["to"] == null ? null : json["to"],
        tokenId: json["token_id"] == null ? null : json["token_id"],
      );

  Map<String, dynamic> toJson() => {
        "sender": sender == null ? null : sender,
        "owner": owner == null ? null : owner,
        "to": to == null ? null : to,
        "token_id": tokenId == null ? null : tokenId,
      };
}

import 'dart:convert';

import 'package:application/models/Post/post_response.dart';
import 'package:application/models/transfer/transfer_request.dart';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' show Client;

final token = Hive.box('initApp').get('moonstone_access_token').toString();

class MoonStonePostServiceProvider {
  Client client = Client();
  String _url = "http://13.125.152.144:5555";

  final header = {
    HttpHeaders.authorizationHeader: token,
    "Content-type": "application/json",
  };
  Future<PostResponse> getPostList() async {
    print('entered Get');
    final uri = Uri.parse(_url + "/posts/page?page=0");
    final response = await client.get(uri, headers: header);
    print(response.body.toString());
    if (200 == response.statusCode) {
      return postResponseFromJson(response.body);
    } else {
      return postResponseFromJson(response.body);
    }
  }

  Future<PostResponse> getPostListWithPage(int page) async {
    print('entered get page');
    final uri = Uri.parse(_url + "/posts/page?page=$page");

    final response = await client.get(uri, headers: header);
    print(response.body.toString());
    if (200 == response.statusCode) {
      return postResponseFromJson(response.body);
    } else {
      return postResponseFromJson(response.body);
    }
  }

  Future<PostResponse> getUserItemListWithPage(String address, int page) async {
    print('entered get page');
    final uri = Uri.parse(_url + "/posts/page/$address?page=$page");

    final response = await client.get(uri, headers: header);
    print(response.body.toString());
    if (200 == response.statusCode) {
      return postResponseFromJson(response.body);
    } else {
      return postResponseFromJson(response.body);
    }
  }

  Future<PostResponse> getMarketItemList(String address, int page) async {
    print('entered get page');
    final uri = Uri.parse(
        _url + "/posts/Market/$address?page=$page&size=10&sort=id,desc");
    final response = await client.post(uri, headers: header);
    print(response.body.toString());
    if (200 == response.statusCode) {
      return postResponseFromJson(response.body);
    } else {
      return postResponseFromJson(response.body);
    }
  }

  Future<bool> changeSellState(String tokenId) async {
    print('entered Get');
    final uri = Uri.parse(_url + "/posts/sell_state/$tokenId");
    final response = await client.put(uri, headers: header);
    print(response.body.toString());
    if (200 == response.statusCode) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> changePrice(String tokenId, double price) async {
    print('tokenId:$tokenId, price:$price');
    final uri = Uri.parse(_url + "/posts/price/$tokenId");
    final body = jsonEncode({"price": "$price"});
    final response = await client.put(uri, headers: header, body: body);
    print(response.body.toString());
    if (200 == response.statusCode) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> tradeItem(TransferRequest request) async {
    print(
        'sender:${request.sender}, to:${request.to}, token:${request.tokenId}');
    final uri = Uri.parse(_url + "/posts/trade");
    final body = transferRequestToJson(request);
    final response = await client.post(uri, headers: header, body: body);
    print(response.body.toString());
    if (200 == response.statusCode) {
      return response.body.toString();
    } else {
      return response.body.toString();
    }
  }
}

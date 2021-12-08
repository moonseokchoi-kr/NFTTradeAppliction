import 'package:application/models/Post/post_response.dart';
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
    //final test =
    //    """{ "platform" : "google", "userinfo" :{ "token" : "", "email" : "hellssowordsdld@bye.com", "user_id" : "10101023112323", "password" : "email" }}""";
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
}

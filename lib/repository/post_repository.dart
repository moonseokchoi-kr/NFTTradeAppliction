import 'package:application/models/Post/post_response.dart';
import 'package:application/repository/provider/post_provider.dart';

class MoonstonePostRepository {
  final provider = MoonStonePostServiceProvider();
  Future<PostResponse> getPostList() => provider.getPostList();
  Future<PostResponse> getPostListWithPage(int page) =>
      provider.getPostListWithPage(page);
  Future<PostResponse> getPostListWithUserAndPage(String address, int page) =>
      provider.getUserItemListWithPage(address, page);
}

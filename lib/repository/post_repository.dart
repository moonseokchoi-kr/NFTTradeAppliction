import 'package:application/models/Post/post_response.dart';
import 'package:application/models/transfer/transfer_request.dart';
import 'package:application/repository/provider/post_provider.dart';

class MoonstonePostRepository {
  final provider = MoonStonePostServiceProvider();
  Future<PostResponse> getPostList() => provider.getPostList();
  Future<PostResponse> getPostListWithPage(int page) =>
      provider.getPostListWithPage(page);
  Future<PostResponse> getPostListWithUserAndPage(String address, int page) =>
      provider.getUserItemListWithPage(address, page);
  Future<PostResponse> getMarketItemList(String address, int page) =>
      provider.getMarketItemList(address, page);
  Future<bool> changeSellState(String tokenId) =>
      provider.changeSellState(tokenId);
  Future<bool> changePrice(String tokenId, double price) =>
      provider.changePrice(tokenId, price);
  Future<String> tradeItem(TransferRequest request) =>
      provider.tradeItem(request);
}

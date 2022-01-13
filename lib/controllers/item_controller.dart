import 'package:application/models/item.dart';
import 'package:application/models/transfer/transfer_request.dart';
import 'package:application/repository/post_repository.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ItemController extends GetxController {
  final _repository = MoonstonePostRepository();

  Future<bool> changeSellState(String tokenId) async {
    bool res = await _repository.changeSellState(tokenId);
    return res;
  }

  Future<bool> changePrice(String tokenId, double price) async {
    bool res = await _repository.changePrice(tokenId, price);
    return res;
  }

  Future<bool> changeItemSell(String tokenId, double price) async {
    bool res = await changePrice(tokenId, price);
    res = await changeSellState(tokenId);
    return res;
  }

  Future<String> tradeItem(Item item) async {
    final wallet = Hive.box('initApp').get('user_wallet');
    final req = TransferRequest();
    req.sender = item.owner;
    req.owner = item.owner;
    req.to = wallet;
    req.tokenId = item.tokenId;
    String res = await _repository.tradeItem(req);
    return res;
  }
}

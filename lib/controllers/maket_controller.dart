import 'package:application/models/Post/post_response.dart';
import 'package:application/repository/post_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

int page = 0;

class MarketController extends GetxController {
  final _repository = MoonstonePostRepository();
  final _address = Hive.box('initApp').get('user_wallet');

  final items = PostResponse().obs;
  ScrollController scrollController = ScrollController();

  _fetchPostList() async {
    PostResponse itemModel = await _repository.getMarketItemList(
        "0xbc7cc9517400cff0ec953efb585e424301a395b0", page);
    items.update((val) {
      if (val != null) val.content.addAll(itemModel.content);
    });
  }

  _refreshEvent() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        items.update((val) {
          if (val != null) val.content.clear();
          page = 0;
          _fetchPostList();
        });
      }
    });
  }

  _updateEvent() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ++page;
        _fetchPostList();
      }
    });
  }

  @override
  void onInit() {
    _fetchPostList();
    _refreshEvent();
    _updateEvent();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

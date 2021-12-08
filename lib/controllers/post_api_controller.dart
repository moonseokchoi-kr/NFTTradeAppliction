import 'package:application/models/Post/post_response.dart';
import 'package:application/repository/post_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

int page = 0;

class PostController extends GetxController {
  final items = PostResponse().obs;
  final _repository = MoonstonePostRepository();
  ScrollController scrollController = ScrollController();

  _fetchPostList() async {
    PostResponse itemModel = await _repository.getPostListWithPage(page);
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

  void onReady() {
    _fetchPostList();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

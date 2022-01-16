import 'package:application/models/Post/post_response.dart';
import 'package:application/repository/post_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

int userPage = 0;

class UserPostController extends GetxController {
  final items = PostResponse().obs;
  final _repository = MoonstonePostRepository();
  final _user = Hive.box('initApp').get('user_wallet');
  ScrollController scrollController = ScrollController();

  initUserPostList() async {
    items.update((val) {
      if (val != null) val.content.clear();
      userPage = 0;
      _fetchUserPostList();
    });
  }

  _fetchUserPostList() async {
    PostResponse itemModel =
        await _repository.getPostListWithUserAndPage(_user, userPage);
    items.update((val) {
      if (val != null) val.content.addAll(itemModel.content);
    });
  }

  _refreshUserEvent() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        initUserPostList();
      }
    });
  }

  _updateUserEvent() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        ++userPage;
        _fetchUserPostList();
      }
    });
  }

  @override
  void onInit() {
    _refreshUserEvent();
    _updateUserEvent();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

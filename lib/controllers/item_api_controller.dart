import 'package:application/models/test_model.dart';
import 'package:application/repository/test_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

int page = 1;

class ItemControll extends GetxController {
  final items = ItemModel().obs;
  final _repository = Repository();
  ScrollController scrollController = ScrollController();

  _fetchNextMovies() async {
    ItemModel itemModel = await _repository.fetchNextMovies(page);
    ++page;
    items.update((val) {
      if (val != null) val.results.addAll(itemModel.results);
    });
  }

  _refreshEvent() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        items.update((val) {
          if (val != null) val.results.clear();
          page = 1;
          _fetchNextMovies();
        });
      }
    });
  }

  _updateEvent() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _fetchNextMovies();
      }
    });
  }

  @override
  void onInit() {
    _fetchNextMovies();
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

import 'package:application/enums.dart';

class Post {
  final int id;
  final int itemId;
  final int userId;
  final SellState sellSate;
  final DateTime createTime;
  final DateTime updateTime;

  Post({
    required this.id,
    required this.itemId,
    required this.sellSate,
    required this.createTime,
    required this.updateTime,
    required this.userId,
  });
}

class Item {
  late int _itemId;
  late String _tokenID;
  late String _creator;
  late String _itemTitle;
  late String _createDate;
  late String _imagePath;

  Item(int id, String tokenID, String creator, String itemTitle,
      String createDate, String imagePath) {
    _itemId = id;
    _tokenID = tokenID;
    _creator = creator;
    _itemTitle = itemTitle;
    _createDate = createDate;
    _imagePath = imagePath;
  }

  int get itemID => _itemId;

  String get tokenID => _tokenID;
  String get creator => _creator;
  String get itemTitle => _itemTitle;
  String get createDate => _createDate;
  String get imagePath => _imagePath;
}

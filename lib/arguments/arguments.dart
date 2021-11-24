import 'package:application/models/Token.dart';

class TokenDetailArguments {
  final Token token;
  String? title;

  TokenDetailArguments({required this.token, this.title});
}

class NFTDetailArguments {
  final NFT nft;
  String? title;

  NFTDetailArguments({
    required this.nft,
    this.title,
  });
}

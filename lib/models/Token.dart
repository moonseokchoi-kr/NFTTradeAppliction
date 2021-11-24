class Token {
  final String tokenAddress, tokenName, tokenImage;
  final double tokenAmount;

  const Token(
      this.tokenAddress, this.tokenName, this.tokenImage, this.tokenAmount);
}

class NFT {
  late String _nftName, _address, _imagePath;
  late int _itemAmount;

  NFT(String nftName, address, imagePath, int itemAmount) {
    _nftName = nftName;
    _address = address;
    _imagePath = imagePath;
    _itemAmount = itemAmount;
  }

  String get nftName => _nftName;
  String get address => _address;
  String get imagePath => _imagePath;
  int get itemAmount => _itemAmount;
  void setItemAmount(int amount) {
    _itemAmount = amount;
  }
}

List<Token> demoToken = [
  Token("0x103293i9439201", "KLAY", "test", 1999.3),
  Token("0x103293i9134451", "MST", "test", 132.3)
];

List<NFT> demoNFT = [
  NFT("MSGT", "0x103293i9439201", "test", 5),
  NFT("MGAT", "0x21293sqidj1013", "test", 4),
];

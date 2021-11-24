//인용이가 jwt를 어떻게 넘겨줄지 상의해서 수정할것
class WalletUser {
  final int id;
  final String email, name, date;

  WalletUser({
    required this.id,
    required this.email,
    required this.name,
    required this.date,
  });
}

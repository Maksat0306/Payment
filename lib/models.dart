class CardInfo {
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String bankName;

  CardInfo({
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.bankName,
  });

  // JSON'a dönüştürme
  Map<String, dynamic> toJson() => {
    'cardHolderName': cardHolderName,
    'cardNumber': cardNumber,
    'expiryDate': expiryDate,
    'bankName': bankName,
  };

  // JSON'dan nesneye dönüştürme
  factory CardInfo.fromJson(Map<String, dynamic> json) {
    return CardInfo(
      cardHolderName: json['cardHolderName'],
      cardNumber: json['cardNumber'],
      expiryDate: json['expiryDate'],
      bankName: json['bankName'],
    );
  }
}

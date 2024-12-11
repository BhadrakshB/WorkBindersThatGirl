class SizeOption {
  final String sizeName;
  final String sizeCode;
  final bool available;

  SizeOption({required this.sizeName, required this.sizeCode, required this.available});

  factory SizeOption.fromJson(Map<String, dynamic> json) {
    return SizeOption(
      sizeName: json['sizeName'],
      sizeCode: json['sizeCode'],
      available: json['available'],
    );
  }
}

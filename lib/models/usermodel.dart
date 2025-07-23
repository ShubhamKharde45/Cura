class Patient {
  final String uid;
  final String name;
  final String phone;
  final String aadhaar;
  final DateTime registeredAt;

  Patient({
    required this.uid,
    required this.name,
    required this.phone,
    required this.aadhaar,
    required this.registeredAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phone': phone,
      'aadhaar': aadhaar,
      'registeredAt': registeredAt,
    };
  }
}

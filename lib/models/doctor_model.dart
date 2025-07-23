import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  final String uid;
  final String name;
  final String specialization;
  final String phone;
  final String email;
  final String hospital;
  final String experience;
  final String profileImageUrl;
  final List<String> availableDays;
  final Map<String, String> timeSlots;

  Doctor({
    required this.uid,
    required this.name,
    required this.specialization,
    required this.phone,
    required this.email,
    required this.hospital,
    required this.experience,
    required this.profileImageUrl,
    required this.availableDays,
    required this.timeSlots,
  });

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      specialization: map['specialization'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      hospital: map['hospital'] ?? '',
      experience: map['experience'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      availableDays: List<String>.from(map['availableDays'] ?? []),
      timeSlots: Map<String, String>.from(map['timeSlots'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'specialization': specialization,
      'phone': phone,
      'email': email,
      'hospital': hospital,
      'experience': experience,
      'profileImageUrl': profileImageUrl,
      'availableDays': availableDays,
      'timeSlots': timeSlots,
    };
  }

  factory Doctor.fromFirestore(DocumentSnapshot doc) {
  final data = doc.data() as Map<String, dynamic>;

  return Doctor(
    uid: data['uid'] ?? '',
    name: data['name'] ?? '',
    specialization: data['specialization'] ?? '',
    phone: data['phone'] ?? '',
    email: data['email'] ?? '',
    hospital: data['hospital'] ?? '',
    experience: data['experience'] ?? '',
    profileImageUrl: data['profileImageUrl'] ?? '',
    availableDays: List<String>.from(data['availableDays'] ?? []),
    timeSlots: Map<String, String>.from(data['timeSlots'] ?? {}),
  );
}

}

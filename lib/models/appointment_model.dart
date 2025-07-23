import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  final String doctorId;
  final String patientId;
  final String date;
  final String time;
  final String status;
  final Timestamp createdAt;
  final bool isEmergency;

  Appointment({
    required this.doctorId,
    required this.patientId,
    required this.date,
    required this.time,
    required this.status,
    required this.createdAt,
    required this.isEmergency,
  });

  factory Appointment.fromMap(Map<String, dynamic> map, {required String id}) {
    return Appointment(
      doctorId: map['doctorId'] ?? '',
      patientId: map['patientId'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      status: map['status'] ?? 'pending',
      createdAt: map['createdAt'] ?? Timestamp.now(),
      isEmergency: map['isEmergency'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'doctorId': doctorId,
      'patientId': patientId,
      'date': date,
      'time': time,
      'status': status,
      'createdAt': createdAt,
      'isEmergency': isEmergency,
    };
  }

  factory Appointment.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Appointment(
      doctorId: data['doctorId'] ?? '',
      patientId: data['patientId'] ?? '',
      date: data['date'] ?? '',
      time: data['time'] ?? '',
      status: data['status'] ?? 'pending',
      createdAt: data['createdAt'] ?? Timestamp.now(),
      isEmergency: data['isEmergency'] ?? false,
    );
  }
}

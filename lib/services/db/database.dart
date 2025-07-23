import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cura/models/appointment_model.dart';
import 'package:cura/models/doctor_model.dart';
import 'package:cura/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updatePatientToFirestore(Patient patient) async {
    try {
      final response = await firestore
          .collection("doctor")
          .doc(patient.uid)
          .get();

      if (response.exists) {
        await firestore
            .collection("user")
            .doc(patient.uid)
            .update(patient.toMap());
      } else {
        await firestore
            .collection("user")
            .doc(patient.uid)
            .set(patient.toMap());
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateDoctorToFirestore(Doctor doctor) async {
    try {
      final response = await firestore
          .collection("doctor")
          .doc(doctor.uid)
          .get();
      if (response.exists) {
        await firestore
            .collection("doctor")
            .doc(doctor.uid)
            .update(doctor.toMap());
      } else {
        await firestore
            .collection("doctor")
            .doc(doctor.uid)
            .set(doctor.toMap());
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateAppointment(Patient patient) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await firestore.collection("user").doc(uid).update(patient.toMap());
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Doctor>> getAllDoctors() async {
    final snapshot = await firestore.collection("doctor").get();
    return snapshot.docs.map((e) => Doctor.fromFirestore(e)).toList();
  }

  Future<List<Appointment>> getAllAppointments(String uid) async {
    final snapshot = await firestore.collection("appointment").get();
    return snapshot.docs.map((e) => Appointment.fromFirestore(e)).toList();
  }

  Future<void> sendAppointmentRequest(Appointment appointment) async {
    try {
      await firestore
          .collection('appointments')
          .doc(appointment.doctorId)
          .set(appointment.toMap());
    } catch (e) {
      rethrow;
    }
  }
}

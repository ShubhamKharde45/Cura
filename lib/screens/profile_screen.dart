import 'package:cura/models/usermodel.dart';
import 'package:cura/services/db/db_provider.dart';
import 'package:cura/utils/app_btn.dart';
import 'package:cura/utils/app_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final nameController = TextEditingController();
  final aadhaarController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    aadhaarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppInputField(hint: "Enter name : ", controller: nameController,),
            SizedBox(height: 8),
            AppInputField(hint: "Enter aadhaar no : ", controller: aadhaarController,),
            SizedBox(height: 20),
            AppBtn(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Icon(Icons.arrow_forward_ios),
              onTap: () async {
                try {
                  Patient patient = Patient(
                    uid: FirebaseAuth.instance.currentUser!.uid,
                    name: nameController.text,
                    phone: FirebaseAuth.instance.currentUser!.phoneNumber ?? "",
                    aadhaar: aadhaarController.text,
                    registeredAt: DateTime.now(),
                  );

                  await ref.read(DbProvider).updatePatientToFirestore(patient);
                } catch (e) {
                  rethrow;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

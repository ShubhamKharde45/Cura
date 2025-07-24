import 'package:cura/models/doctor_model.dart';
import 'package:cura/models/usermodel.dart';
import 'package:cura/screens/main_screen.dart';
import 'package:cura/services/db/db_provider.dart';
import 'package:cura/utils/app_btn.dart';
import 'package:cura/utils/app_container.dart';
import 'package:cura/utils/app_input_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogInScreen extends ConsumerStatefulWidget {
  const LogInScreen({super.key, required this.isPatient});

  final bool isPatient;

  @override
  ConsumerState<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends ConsumerState<LogInScreen> {
  bool otpSent = false;
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  String verificationId = '';

  void sendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${_phoneController.text}",
      verificationCompleted: (PhoneAuthCredential cred) async {
        await FirebaseAuth.instance.signInWithCredential(cred);
      },
      verificationFailed: (FirebaseAuthException ex) {
        setState(() {
          otpSent = false;
        });

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Failed: ${ex.message}")));
      },
      codeSent: (String verId, int? resendToken) {
        setState(() {
          verificationId = verId;
          otpSent = true;
        });
      },
      codeAutoRetrievalTimeout: (String verId) {
        verificationId = verId;
      },
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential cred = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: _otpController.text,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(cred);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Phone verified!")));

      if (widget.isPatient) {
        Patient patient = Patient(
          uid: FirebaseAuth.instance.currentUser!.uid,
          name: "User",
          phone:
              FirebaseAuth.instance.currentUser!.phoneNumber ??
              _phoneController.text,
          aadhaar: "aadhaar",
          registeredAt: DateTime.now(),
        );
        await ref.read(DbProvider).updatePatientToFirestore(patient);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
          (route) => false,
        );
      } else {
        Doctor doctor = Doctor(
          uid: FirebaseAuth.instance.currentUser!.uid,
          name: "Doctor name",
          specialization: "specialization",
          phone:
              FirebaseAuth.instance.currentUser!.phoneNumber ??
              _phoneController.text,
          email: "email",
          hospital: "hospital",
          experience: "experience",
          profileImageUrl: "profileImageUrl",
          availableDays: ["Sunday"],
          timeSlots: {"10:30": "1:30"},
        );
        ref.read(DbProvider).updateDoctorToFirestore(doctor);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.shield_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Cura",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                AppContainer(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      otpSent
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 5,
                              ),
                              child: Text(
                                "Otp sent to your mobile no.",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 5,
                              ),
                              child: Text(
                                "LogIn",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                      otpSent
                          ? AppInputField(
                              hint: "Enter 6 digit OTP.",
                              controller: _otpController,
                            )
                          : AppInputField(
                              hint: "Enter no",
                              controller: _phoneController,
                            ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 5,
                        ),
                        child: Text(
                          "Your number is encrypted and secure.",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      otpSent
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 5,
                              ),
                              child: AppBtn(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                onTap: () async {
                                  verifyOTP();
                                },
                                child: Center(
                                  child: Text(
                                    "Verify & continue",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 5,
                              ),
                              child: AppBtn(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                onTap: () async {
                                  sendOTP();
                                  setState(() {
                                    otpSent = !otpSent;
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    "Get OTP",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                AppContainer(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Column(
                          children: [
                            Icon(
                              Icons.shield_outlined,
                              color: Colors.green,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Secure & Private.",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,

                            child: Text(
                              "Your data is encrypted end-to-end. We follow government healthcare data protection standards.",
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Need help? ",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Contact Support",
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

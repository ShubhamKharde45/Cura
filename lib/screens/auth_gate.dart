import 'package:cura/services/auth/auth_screens/log_in_screen.dart';
import 'package:cura/utils/app_btn.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBtn(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Text("Patient"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogInScreen(isPatient: true),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              AppBtn(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Text("Doctor"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogInScreen(isPatient: false),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

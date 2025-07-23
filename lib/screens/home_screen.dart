
import 'package:cura/utils/doctors_list.dart';
import 'package:cura/utils/home_box.dart';
import 'package:cura/utils/hospital_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HospitalCard(),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HomeBox(
                        iconData: Icons.shield_outlined,
                        text: "Book apointment",
                        color: Colors.blue,
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            elevation: 0,
                            enableDrag: true,
                            constraints: BoxConstraints.expand(),
                            builder: (BuildContext context) {
                              return Container(
                                height: MediaQuery.of(context).size.width * 0.9,
                                width: MediaQuery.of(context).size.width,
                                child: DoctorsList(
                                  "Waiting to approve your request.",
                                  false,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      HomeBox(
                        iconData: CupertinoIcons.line_horizontal_3,
                        text: "Health records",
                        color: Colors.blue.withAlpha(100),
                        onTap: () {},
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HomeBox(
                          iconData: Icons.shield_outlined,
                          text: "Wellness check",
                          color: Colors.green.withOpacity(0.5),
                          onTap: () {},
                        ),
                        HomeBox(
                          iconData: Icons.phone,
                          color: Colors.red.withOpacity(0.8),
                          text: "Emergency",
                          onTap: () {
                            showBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              elevation: 0,
                              enableDrag: true,
                              constraints: BoxConstraints.expand(),
                              builder: (BuildContext context) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.9,
                                  width: MediaQuery.of(context).size.width,
                                  child: DoctorsList(
                                    "Your request has been accepted.",
                                    true,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // PAGE VIEW
        ],
      ),
    );
  }
}

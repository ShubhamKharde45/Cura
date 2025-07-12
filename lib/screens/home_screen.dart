import 'package:cura/utils/app_container.dart';
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
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(height: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, " + "User",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Welcome back to your health portal",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: AppContainer(
            color: Colors.green.withOpacity(0.25),
            padding: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppColorContainer(
                  height: 60,
                  width: 60,
                  child: Icon(
                    CupertinoIcons.calendar,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      "Next Appointment",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Dr. Rajesh kumar",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "10:20",
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "-",
                          style: TextStyle(color: Colors.white60, fontSize: 25),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "12:70",
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                AppColorContainer(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Text(
                      "Confirmed",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppContainer(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.425,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppColorContainer(
                    height: 40,
                    width: 40,
                    child: Icon(CupertinoIcons.link, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3",
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Active",
                              style: TextStyle(
                                overflow: TextOverflow.visible,
                                color: Colors.white60,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Prescriptions",
                              style: TextStyle(
                                overflow: TextOverflow.visible,
                                color: Colors.white60,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AppContainer(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.425,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppColorContainer(
                    height: 40,
                    width: 40,
                    color: Colors.blue,
                    child: Icon(CupertinoIcons.link, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3",
                          style: TextStyle(
                            overflow: TextOverflow.visible,
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pending",
                              style: TextStyle(
                                overflow: TextOverflow.visible,
                                color: Colors.white60,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Reports",
                              style: TextStyle(
                                overflow: TextOverflow.visible,
                                color: Colors.white60,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "Quick Actions :",
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        AppContainer(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppColorContainer(
                    height: 40,
                    width: 40,
                    color: Colors.blue,
                    child: Icon(CupertinoIcons.calendar, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Book Appointment",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Dr. Rajesh kumar",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(CupertinoIcons.right_chevron, color: Colors.white),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: AppContainer(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColorContainer(
                      height: 40,
                      width: 40,
                      color: Colors.green,
                      child: Icon(CupertinoIcons.link, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Prescriptions",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "View medicinations",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(CupertinoIcons.right_chevron, color: Colors.white),
              ],
            ),
          ),
        ),
        AppContainer(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppColorContainer(
                    height: 40,
                    width: 40,
                    color: Colors.red,
                    child: Icon(CupertinoIcons.shield, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Emergency",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "24/7 helpline",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(CupertinoIcons.right_chevron, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }
}

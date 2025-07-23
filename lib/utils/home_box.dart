import 'package:cura/utils/app_container.dart';
import 'package:flutter/material.dart';

class HomeBox extends StatelessWidget {
  const HomeBox({
    super.key,
    required this.iconData,
    required this.text,
    this.onTap,
    this.color,
  });

  final IconData iconData;
  final String text;
  final Color? color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppContainer(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 35,
              width: 35,

              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Icon(iconData, color: Colors.white, size: 30),
              ),
            ),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

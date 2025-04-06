import 'package:flutter/material.dart';
import '../../../../domain/configuration/network_icons/network_icons.dart';
import '../../../../domain/constant/widgets/widgets.dart';

class MainInformationWidget extends StatelessWidget {
  const MainInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 55, vertical: 100),
      child: Container(
        height: 120,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  NetworkIcons.cloudIcons,
                  height: 70,
                  width: 80,
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  '18 C',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  'Odessa',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ],
            ),
            const Row(children: [
              SizedBox(
                width: 80,
              ),
              NetworkIconWidget(pathImage: NetworkIcons.prozentWater),
            ]),
          ],
        ),
      ),
    );
  }
}

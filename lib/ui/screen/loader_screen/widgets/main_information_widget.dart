import 'package:flutter/material.dart';

import '../../../../config/configuration/network_icons/network_icons.dart';


class MainInformationWidget extends StatelessWidget {
  const MainInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 100),
      child: Container(
        height: 120,
        width: 300,
        decoration: BoxDecoration(
          boxShadow: const [ BoxShadow(color: Colors.black45,
              blurRadius: 12),],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Image.network(
                  NetworkIcons.cloudIcons,
                  height: 70,
                  width: 60,
                ),
                const SizedBox(
                  width: 10,
                ),
                const SizedBox(
                  width: 15,
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      '18°',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w600),
                    )),
                const SizedBox(
                  width: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Odessa',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 21),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

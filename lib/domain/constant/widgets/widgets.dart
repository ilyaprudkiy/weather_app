import 'package:flutter/cupertino.dart';

class NetworkIconWidget extends StatelessWidget {
  final String pathImage;

  const NetworkIconWidget(
      {super.key,
      required this.pathImage,
   });

  @override
  Widget build(BuildContext context) {
    return    SizedBox( width: MediaQuery.of(context).size.width * 0.1,
        height: MediaQuery.of(context).size.width * 0.1,
        child: Image.network(
      pathImage,
    ));
  }
}

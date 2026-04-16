import 'package:flutter/material.dart';
import '../../../../../core/config/configuration/network_icons/network_icons.dart';


class FormContinueWithWidget extends StatelessWidget {
  const FormContinueWithWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
                child: Divider(
              thickness: 1,
            )),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'or continue with',
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
                child: Divider(
              thickness: 1,
            ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.network(NetworkIcons.googleIcon),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Sign in with Google')
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

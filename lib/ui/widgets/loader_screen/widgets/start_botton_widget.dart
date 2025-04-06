import 'package:flutter/material.dart';
import '../cubit/lodaer_cubit.dart';

class StartedWidget extends StatelessWidget {
  const StartedWidget({
    super.key,
    required this.cubit,
  });

  final LoaderCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 125, vertical: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                // Цвет текста
                backgroundColor: Colors.grey.withOpacity(0.5),
                // Цвет кнопки
                shadowColor: Colors.lightBlueAccent.withOpacity(0.7),
                // Тень кнопки
                padding: const EdgeInsets.all(25),
              ),
              onPressed: () {
                if (cubit.state.isLoading == false) {
                  cubit.start();
                }
              },
              child: const Text(
                'Get started',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )),
      ],
    );
  }
}

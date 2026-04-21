import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/feature/auth/presentation/welcome_screen/widgets/start_button_widget.dart';
import '../../../../core/config/configuration/network_icons/network_icons.dart';
import '../../../../navigation/navigation.dart';
import '../cubit/auth_cubit.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthCubit>();
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFE0EAFC), // верх
          Color(0xFFCFDEF3), // низ
        ],
      )),
      child: Scaffold(
        body: BlocListener<AuthCubit, AuthState>(
          listenWhen: (prev, current) => current is! UnKnownState,
          listener: _onChangeWelcomeState,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    NetworkIcons.cloudIcons,
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  LoginButtonWidget(cubit: cubit),
                  const SizedBox(
                    height: 10,
                  ),
                  SignUpButtonWidget(cubit: cubit),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.network(
                          NetworkIcons.googleIcon,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.network(
                          NetworkIcons.instagramIcon,
                          height: 20,
                          width: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.network(
                          NetworkIcons.facebookIcon,
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_right_alt_sharp,
                        color: Colors.lightBlue,
                      ),
                      label: const Text(
                        'or continue as guest',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onChangeWelcomeState(BuildContext context, AuthState state) {
    if (state is AuthorizedState) {
      Navigator.of(context)
          .pushReplacementNamed(MainNavigationRouteNames.weatherScreen);
    }
  }
}

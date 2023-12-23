import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_test/bloc/get_contacts/get_contacts_cubit.dart';
import 'package:suitmedia_test/bloc/set_username/set_username_cubit.dart';
import 'package:suitmedia_test/screens/first_screen.dart';
import 'package:suitmedia_test/screens/second_screen.dart';
import 'package:suitmedia_test/screens/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetContactsCubit()),
        BlocProvider(create: (_) => SetUsernameCubit())
      ],
      child: MaterialApp(
          title: 'Suitmedia Test',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const FirstScreen(),
            '/second-screen': (context) => const SecondScreen(),
            '/third-screen': (context) => const ThirdScreen()
          }),
    );
  }
}

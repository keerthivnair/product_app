import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/user_form_screen.dart';
import 'blocs/form_cubit.dart'; // Import the FormCubit
import 'screens/product_list_screen.dart'; // Import the ProductListScreen
import 'blocs/product_cubit.dart';
import 'screens/audio_player_screen.dart'; // Import the ProductCubit

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Providing FormCubit globally
        BlocProvider<FormCubit>(
          create: (_) => FormCubit(),
        ),
        // Providing ProductCubit globally
        BlocProvider<ProductCubit>(
          create: (_) => ProductCubit()..fetchProducts(), // Fetch products on app start
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => ProductListScreen(), // Product list as the home screen
          '/user-form': (context) => UserFormScreen(),
          '/audio-player': (context) => AudioPlayerScreen(), // Route for the user form
        },
      ),
    );
  }
}

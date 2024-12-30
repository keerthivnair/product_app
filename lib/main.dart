import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/form_cubit.dart'; // Import the FormCubit
import 'blocs/product_cubit.dart'; // Import the ProductCubit
import 'screens/home_page.dart'; // Import the HomePage
import 'screens/user_form_screen.dart'; // Import the UserFormScreen
import 'screens/audio_player_screen.dart'; // Import the AudioPlayerScreen
import 'screens/product_list_screen.dart'; // Import the ProductListScreen

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
          primarySwatch: Colors.teal, // Consistent teal theme
        ),
        initialRoute: '/', // Set HomePage as the default route
        routes: {
          '/': (context) => HomePage(), // HomePage is the landing screen
          '/product-list': (context) => ProductListScreen(category: "", products: []), // ProductListScreen route
          '/user-form': (context) => UserFormScreen(), // UserFormScreen route
          '/audio-player': (context) => AudioPlayerScreen(), // AudioPlayerScreen route
        },
      ),
    );
  }
}

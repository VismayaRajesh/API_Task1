import 'package:api_task/productBloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ProductBloc>(
        create: (BuildContext context) =>
        ProductBloc()
          ..add(fetchproducts()),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage()
    );
  }
}
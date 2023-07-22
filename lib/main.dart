import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'pages/bloc_builder_page.dart';
import 'pages/bloc_consumer_page.dart';
import 'pages/bloc_listener_page.dart';
import 'pages/bloc_provider_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProviderPage(), // latihan bloc provider
      ),
    );

    //* Menggunakan bloc tanpa bloc provider
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: BlocBuilderPage(), // latihan bloc builder
    //   home: BlocListenerPage(), // latihan bloc listener
    //   home: BlocConsumerPage(), // latihan bloc consumer
    // );
  }
}

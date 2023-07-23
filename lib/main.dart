import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/theme_bloc.dart';
import 'pages/bloc_builder_page.dart';
import 'pages/bloc_consumer_page.dart';
import 'pages/bloc_listener_page.dart';
import 'pages/bloc_provider_page.dart';
import 'pages/bloc_provider_value_page.dart';
import 'router/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //* Menggunakan multi bloc provider
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: App(),
    );

    //* Menggunakan bloc provider dengan generated route access
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   onGenerateRoute: router.onRoute,
    // );

    //* Menggunakan bloc provider di dalam MaterialApp (disarankan menggunakan bloc provider value untuk provider lagi didalamnya)
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: BlocProvider(
    //     create: (context) => CounterCubit(),
    //     child: BlocProviderValuePage(),
    //   ),
    // );

    //* Menggunakan bloc provider di atas MaterialApp
    // return BlocProvider(
    //   create: (context) => CounterCubit(),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: BlocProviderPage(), // latihan bloc provider
    //   ),
    // );

    //* Menggunakan bloc tanpa bloc provider
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: BlocBuilderPage(), // latihan bloc builder
    //   home: BlocListenerPage(), // latihan bloc listener
    //   home: BlocConsumerPage(), // latihan bloc consumer
    // );
  }
}

class App extends StatelessWidget {
  App({
    Key? key,
  }) : super(key: key);

  final router = MyRouter();

  @override
  Widget build(BuildContext context) {
    ThemeBloc themeBloc = context.read<ThemeBloc>();

    return BlocBuilder(
      bloc: themeBloc,
      builder: (context, state) {
        return MaterialApp(
          theme: state == true ? ThemeData.light() : ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.onRoute,
          // home: BlocProviderValuePage(),
        );
      },
    );
  }
}

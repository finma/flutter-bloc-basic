import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/pages/bloc_multi_listener.dart';
import 'package:flutter_bloc_basic/pages/bloc_selector_page.dart';
import 'package:flutter_bloc_basic/pages/not_found.dart';
import 'package:flutter_bloc_basic/pages/other_page.dart';

import '/pages/bloc_provider_value_page.dart';
import '/bloc/counter_bloc.dart';

class MyRouter {
  final CounterCubit counterCubit = CounterCubit();

  Route onRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counterCubit,
            child: const BlocSelectorPage(),
            // child: BlocProviderValuePage(),
            // child: BlocMultiListenerPage(),
          ),
        );
      case '/other_page':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: counterCubit,
            child: const OtherPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}

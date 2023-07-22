import 'package:flutter/material.dart';

import '/bloc/counter_bloc.dart';
import '/widget/button_icon_custom.dart';
import '/widget/center_widget.dart';

class BlocProviderPage extends StatelessWidget {
  CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              // button -
              ButtonIconCustom(icon: 'remove'),
              // data counter
              CenterWidget(),
              // button +
              ButtonIconCustom(icon: 'add')
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/pages/other_page.dart';

import '/bloc/counter_bloc.dart';
import '/widget/button_icon_custom.dart';
import '/widget/center_widget.dart';

class BlocProviderValuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Provider'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: counterCubit,
                child: const OtherPage(),
              ),
            ),
          );
        },
        child: const Icon(Icons.navigate_next),
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

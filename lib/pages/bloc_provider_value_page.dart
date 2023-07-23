import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/bloc/theme_bloc.dart';

import '/bloc/counter_bloc.dart';
import '/pages/other_page.dart';
import '/widget/button_icon_custom.dart';
import '/widget/center_widget.dart';

class BlocProviderValuePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = context.read<CounterCubit>();
    ThemeBloc themeBloc = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Provider'),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/other_page');

              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => BlocProvider.value(
              //       value: counterCubit,
              //       child: const OtherPage(),
              //     ),
              //   ),
              // );
            },
            child: const Icon(Icons.navigate_next),
          ),
          FloatingActionButton(
            onPressed: themeBloc.changeTheme,
            child: const Icon(Icons.change_circle),
          )
        ],
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

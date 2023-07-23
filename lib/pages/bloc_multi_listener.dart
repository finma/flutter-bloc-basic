import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_basic/bloc/theme_bloc.dart';

import '/bloc/counter_bloc.dart';
import '/widget/button_icon_custom.dart';
import '/widget/center_widget.dart';

class BlocMultiListenerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = context.read<CounterCubit>();
    ThemeBloc themeBloc = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Provider'),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/other_page');
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
            children: [
              // button -
              const ButtonIconCustom(icon: 'remove'),
              // data counter
              Container(
                height: 100,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: MultiBlocListener(
                  listeners: [
                    // THEME BLOC LISTENER
                    BlocListener<ThemeBloc, bool>(
                      listener: (context, state) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 500),
                            content: Text('Tema Gelap telah Diterapkan'),
                          ),
                        );
                      },
                      listenWhen: (previous, current) {
                        if (current == false) {
                          return true;
                        }
                        return false;
                      },
                    ),

                    // COUNTER BLOC LISTENER
                    BlocListener<CounterCubit, int>(
                      listener: (context, state) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 500),
                            content: Text('Angka telah melewati 10'),
                          ),
                        );
                      },
                      listenWhen: (previous, current) {
                        if (current > 10) {
                          return true;
                        }
                        return false;
                      },
                    ),
                  ],
                  child: BlocBuilder<CounterCubit, int>(
                    // bloc: counterCubit,
                    builder: (context, state) {
                      return Text(
                        '$state',
                        style: const TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
              // button +
              const ButtonIconCustom(icon: 'add')
            ],
          )
        ],
      ),
    );
  }
}

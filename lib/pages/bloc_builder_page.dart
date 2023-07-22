import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class BlocBuilderPage extends StatelessWidget {
  CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //* Menggunakan BlocBuilder
          BlocBuilder<CounterCubit, int>(
            bloc: counterCubit,
            //* Dibuild ketika state bernilai true
            // buildWhen: (previous, current) {
            //   if (current % 2 == 0) {
            //     return true;
            //   }
            //   return false;
            // },
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(fontSize: 50),
              );
            },
          ),

          //* Menggunakan StreamBuilder
          // StreamBuilder(
          //   initialData: counterCubit.initialValue,
          //   stream: counterCubit.stream,
          //   builder: (context, snapshot) {
          //     return Text(
          //       '${snapshot.data}',
          //       style: const TextStyle(fontSize: 50),
          //     );
          //   },
          // ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  counterCubit.decrement();
                },
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  counterCubit.increment();
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

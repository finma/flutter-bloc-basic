import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class BlocListenerPage extends StatelessWidget {
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
          BlocListener<CounterCubit, int>(
            bloc: counterCubit,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 500),
                  content: Text('Angka Genap'),
                ),
              );
            },
            listenWhen: (previous, current) {
              if (current % 2 == 0) {
                return true;
              }
              return false;
            },
            child: BlocBuilder<CounterCubit, int>(
              bloc: counterCubit,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder(
            bloc: counterCubit,
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      counterCubit.decrement();
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: state == 5 ? null : counterCubit.increment,
                    disabledColor: Colors.grey,
                    icon: const Icon(Icons.add),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

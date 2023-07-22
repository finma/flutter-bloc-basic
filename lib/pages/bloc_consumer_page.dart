import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class BlocConsumerPage extends StatelessWidget {
  CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Consumer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Menggunakan Bloc Consumer',
            style: TextStyle(fontSize: 24),
          ),
          BlocConsumer<CounterCubit, int>(
            bloc: counterCubit,
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(fontSize: 50),
              );
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 500),
                  content: Text('Angka Genap Consumer'),
                ),
              );
            },
            listenWhen: (previous, current) {
              if (current % 2 == 0) {
                return true;
              }
              return false;
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Menggunakan Bloc Listener',
            style: TextStyle(fontSize: 24),
          ),
          BlocListener<CounterCubit, int>(
            bloc: counterCubit,
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(milliseconds: 500),
                  content: Text('Angka Ganjil Listener'),
                ),
              );
            },
            listenWhen: (previous, current) {
              if (current % 2 == 1) {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: counterCubit.decrement,
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: counterCubit.increment,
                disabledColor: Colors.grey,
                icon: const Icon(Icons.add),
              )
            ],
          )
        ],
      ),
    );
  }
}

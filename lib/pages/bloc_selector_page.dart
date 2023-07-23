import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';

class BlocSelectorPage extends StatelessWidget {
  const BlocSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Selector Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          //! BLOC SELECTOR FOR NAME
          BlocSelector<UserBloc, Map<String, dynamic>, String>(
            selector: (state) => state['name'],
            builder: (context, state) {
              print('TEXT NAMA => BUILD');
              return Text(
                'Nama: $state',
                style: const TextStyle(fontSize: 32),
              );
            },
          ),

          //! BLOC SELECTOR FOR AGE
          BlocSelector<UserBloc, Map<String, dynamic>, int>(
            selector: (state) => state['age'],
            builder: (context, state) {
              print('TEXT UMUR => BUILD');
              return Text(
                'Umur: $state',
                style: const TextStyle(fontSize: 32),
              );
            },
          ),
          const SizedBox(height: 20),
          TextField(
            onChanged: (value) => userBloc.changeName(value),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () =>
                      userBloc.changeAge(userBloc.state['age'] - 1),
                  child: const Text('Kurang umur'),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: () =>
                      userBloc.changeAge(userBloc.state['age'] + 1),
                  child: const Text('Tambah umur'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

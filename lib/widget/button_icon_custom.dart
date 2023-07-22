import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/counter_bloc.dart';

class ButtonIconCustom extends StatelessWidget {
  const ButtonIconCustom({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final String icon;

  IconData _showIcon() {
    if (icon == 'add') {
      return Icons.add;
    } else {
      return Icons.remove;
    }
  }

  void _onTapButton(CounterCubit counterCubit) {
    if (icon == 'add') {
      counterCubit.increment();
    } else {
      counterCubit.decrement();
    }
  }

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);

    return Material(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        onTap: () => _onTapButton(counterCubit),
        borderRadius: BorderRadius.circular(25),
        child: SizedBox(
          height: 100,
          width: 70,
          child: Icon(
            _showIcon(),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

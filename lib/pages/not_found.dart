import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Found Page'),
      ),
      body: const Center(
        child: Text(
          '404',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}

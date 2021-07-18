import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'add_model.dart';

class AddPage extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final vm = watch(addModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("TODOアプリ"),
      ),
      body: Column(
        children: [
          TextField(),
          ElevatedButton(
            onPressed: () {},
            child: null,
          ),
        ],
      ),
    );
  }
}

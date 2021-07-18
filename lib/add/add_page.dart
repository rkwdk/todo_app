import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'add_model.dart';

class AddPage extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final vm = context.read(addModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("新規追加"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "追加するTODO",
              ),
              onChanged: (text) {
                vm.todoText = text;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text("追加する"),
              onPressed: () async {
                await vm.add();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

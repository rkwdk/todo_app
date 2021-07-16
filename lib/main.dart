import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final vm = watch(mainModelProvider);
    return MaterialApp(
      title: 'TODOアプリ',
      home: Scaffold(
        appBar: AppBar(
          title: Text("TODOアプリ"),
        ),
        body: ListView(
          children: <Widget>[
            for (var todo in vm.todoList)
              ListTile(
                title: Text('${todo.title}'),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/add/add_page.dart';

import 'main_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOアプリ',
      home: MainPage(),
    );
  }
}

class MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final vm = watch(mainModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("TODOアプリ"),
      ),
      body: ListView(
        children: <Widget>[
          for (var todo in vm.todoList)
            ListTile(
              title: Text('${todo.title} ${todo.createdAt}'),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
              fullscreenDialog: true,
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

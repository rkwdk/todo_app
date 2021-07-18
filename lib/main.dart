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
    final isActivate = vm.checkShouldActiveCompleteButton();
    return Scaffold(
      appBar: AppBar(
        title: Text("TODOアプリ"),
        actions: [
          TextButton(
              onPressed: isActivate
                  ? () {
                      vm.deleteCheckedItems();
                    }
                  : null,
              child: Text(
                "完了",
                style: TextStyle(
                    color: isActivate
                        ? Colors.white
                        : Colors.white.withOpacity(0.5)),
              ))
        ],
      ),
      body: ListView(
        children: <Widget>[
          for (var todo in vm.todoList)
            CheckboxListTile(
              title: Text('${todo.title}'),
              value: todo.isDone,
              onChanged: (bool isDone) {
                vm.updateDone(todo, isDone);
              },
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

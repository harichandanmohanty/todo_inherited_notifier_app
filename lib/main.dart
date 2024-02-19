import 'package:flutter/material.dart';
import 'package:todo_inherited_notifier_app/screens/todo_listing_screen.dart';
import 'package:todo_inherited_notifier_app/widgets/filter_drop_down.dart';
import 'package:todo_inherited_notifier_app/widgets/todo_list_inheritednotifier.dart';
import 'app_state.dart';
import 'screens/create_todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const title = 'Todo Vanilla';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AppStateNotifier appStateNotifier;
  @override
  void initState() {
    appStateNotifier = AppStateNotifier();
    super.initState();
  }

  @override
  void dispose() {
    appStateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TodoListInheritedNotifier(
      notifier: appStateNotifier,
      child:Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Center(child: Text(widget.title)),
            actions: const [
              FilterDropDown(),
            ],
          ),
          body: const TodoListScreen(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TodoListInheritedNotifier(
                    notifier: appStateNotifier,
                    child: const CreateTodoScreen(),
                  ),
                ),
              );
            },
            tooltip: 'Create new todo',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
    );
  }
}

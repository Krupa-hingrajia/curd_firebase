// // // /*
// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_core/firebase_core.dart';
// // //
// // // void main() async {
// // //   WidgetsFlutterBinding.ensureInitialized();
// // //   await Firebase.initializeApp();
// // //   runApp(MyApp());
// // // }
// // //
// // // class MyApp extends StatelessWidget {
// // // // This widget is the root
// // // // of your application.
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Firebase',
// // //       home: AddData(),
// // //     );
// // //   }
// // // }
// // //
// // // class AddData extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.green,
// // //         title: Text("geeksforgeeks"),
// // //       ),
// // //       body: Center(
// // //         child: FloatingActionButton(
// // //           backgroundColor: Colors.green,
// // //           child: Icon(Icons.add),
// // //           onPressed: () {
// // //             FirebaseFirestore.instance
// // //                 .collection('data')
// // //                 .add({'text': 'employee'});
// // //           },
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }*/
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:firebase_core/firebase_core.dart';
// // //
// // // import 'todo_bloc.dart';
// // // import 'todo.dart';
// // //
// // // void main() async {
// // //   WidgetsFlutterBinding.ensureInitialized();
// // //   await Firebase.initializeApp();
// // //
// // //   runApp(MyApp());
// // // }
// // //
// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     print("++++++++++++++++++++++++++++++++++");
// // //     return MaterialApp(
// // //       title: 'Flutter BLoC with Firebase Demo',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //       ),
// // //       home: BlocProvider(
// // //         create: (context) => TodoBloc()..add(FetchTodos()),
// // //         child: TodoPage(),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class TodoPage extends StatelessWidget {
// // //   final TextEditingController _textEditingController =
// // //   TextEditingController();
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     print("************************************************");
// // //     final TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
// // //
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Todo List'),
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           Container(
// // //             padding: EdgeInsets.all(16),
// // //             child: Row(
// // //               children: [
// // //                 Expanded(
// // //                   child: TextField(
// // //                     controller: _textEditingController,
// // //                     decoration: InputDecoration(
// // //                       hintText: 'Enter a todo',
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 SizedBox(width: 16),
// // //                 ElevatedButton(
// // //                   onPressed: () {
// // //                     final todoTitle = _textEditingController.text;
// // //                     if (todoTitle.isNotEmpty) {
// // //                       final todo = Todo(
// // //                         id: DateTime.now().toString(),
// // //                         title: todoTitle,
// // //                       );
// // //                       todoBloc.add(AddTodo(todo));
// // //                       _textEditingController.clear();
// // //                     }
// // //                   },
// // //                   child: Text('Add'),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // // /*
// // //           Expanded(
// // //             child: BlocBuilder<TodoBloc, TodoState>(
// // //               builder: (context, state) {
// // //                 if (state is TodoLoading) {
// // //                   return Center(
// // //                     child: CircularProgressIndicator(),
// // //                   );
// // //                 } else if (state is TodoLoaded) {
// // //                   final todos = state.todos;
// // //
// // //                   return ListView.builder(
// // //                     itemCount: todos.length,
// // //                     itemBuilder: (context, index) {
// // //                       final todo = todos[index];
// // //                       return ListTile(
// // //                         title: Text(todo.title),
// // //                         trailing: IconButton(
// // //                           icon: Icon(Icons.delete),
// // //                           onPressed: () {
// // //                             todoBloc.add(DeleteTodo(todo.id));
// // //                           },
// // //                         ),
// // //                       );
// // //                     },
// // //                   );
// // //                 } else if (state is TodoError) {
// // //                   return Center(
// // //                     child: Text(state.message),
// // //                   );
// // //                 }
// // //
// // //                 return Container();
// // //               },
// // //             ),
// // //           ),
// // // */
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:firebase_core/firebase_core.dart';
// //
// // import 'todo_bloc.dart';
// // import 'todo_event.dart';
// // import 'todo_state.dart';
// // import 'todo.dart';
// //
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp();
// //
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     print("*********************************");
// //     return MaterialApp(
// //       title: 'Flutter BLoC with Firebase Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: BlocProvider(
// //         create: (context) => TodoBloc()..add(FetchTodos()),
// //         child: TodoPage(),
// //       ),
// //     );
// //   }
// // }
// //
// // class TodoPage extends StatelessWidget {
// //   final TextEditingController _textEditingController =
// //   TextEditingController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Todo List'),
// //       ),
// //       body: Column(
// //         children: [
// //           Container(
// //             padding: EdgeInsets.all(16),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: TextField(
// //                     controller: _textEditingController,
// //                     decoration: InputDecoration(
// //                       hintText: 'Enter a todo',
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(width: 16),
// //                 ElevatedButton(
// //                   onPressed: () {
// //                     final todoTitle = _textEditingController.text;
// //                     if (todoTitle.isNotEmpty) {
// //                       final todo = Todo(
// //                         id: DateTime.now().toString(),
// //                         title: todoTitle,
// //                       );
// //                       todoBloc.add(AddTodo(todo: todo));
// //                       _textEditingController.clear();
// //                     }
// //                   },
// //                   child: Text('Add'),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Expanded(
// //             child: BlocBuilder<TodoBloc, TodoState>(
// //               builder: (context, state) {
// //                 if (state is TodoLoading) {
// //                   return Center(
// //                     child: CircularProgressIndicator(),
// //                   );
// //                 } else if (state is TodoLoaded) {
// //                   final todos = state.todos;
// //
// //                   return ListView.builder(
// //                     itemCount: todos.length,
// //                     itemBuilder: (context, index) {
// //                       final todo = todos[index];
// //                       return ListTile(
// //                         title: Text(todo.title),
// //                         trailing: IconButton(
// //                           icon: Icon(Icons.delete),
// //                           onPressed: () {
// //                             todoBloc.add(DeleteTodo(todoId: todo.id));
// //                           },
// //                         ),
// //                       );
// //                     },
// //                   );
// //                 } else if (state is TodoError) {
// //                   return Center(
// //                     child: Text(state.message),
// //                   );
// //                 }
// //
// //                 return Container();
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:demo_test/screens/add_employee_screen.dart';
// import 'package:demo_test/screens/show_employee_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// import 'bloc/todo_bloc.dart';
// import 'bloc/todo_event.dart';
// import 'bloc/todo_state.dart';
// import 'model/todo.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter BLoC with Firebase Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BlocProvider(
//         create: (context) => TodoBloc(),
//        // child: TodoPage(),
//         child: EmployeeListScreen(),
//       ),
//     );
//   }
// }
//
// class TodoPage extends StatelessWidget {
//   final TextEditingController _textEditingController =
//   TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Todo List'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _textEditingController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter a todo',
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 ElevatedButton(
//                   onPressed: () {
//                     final todoTitle = _textEditingController.text;
//                     if (todoTitle.isNotEmpty) {
//                       print("{{{object}}}");
//                       final todo = Todo(
//                         id: '',
//                         title: todoTitle,
//                       );
//                      // print("**************$id");
//                       print("**************$todoTitle");
//                       todoBloc.add(AddTodoEvent(todo: todo));
//                       _textEditingController.clear();
//                     }
//                   },
//                   child: Text('Add'),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: BlocBuilder<TodoBloc, TodoState>(
//               builder: (context, state) {
//                 print("***************************PPPPPPPPPPPPPPPPPPPPPPPPPPPPPP${state}");
//                 if (state is TodoLoadingState) {
//                   print("+++++++++++++*&%&^&%*^*%^&");
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (state is TodoLoadedState) {
//                   print(")))))))))))))))))))))))))))))))))");
//                   final todos = state.todos;
//                   return ListView.builder(
//                     itemCount: todos.length,
//                     itemBuilder: (context, index) {
//                       final todo = todos[index];
//                       return ListTile(
//                         title: Text(todo.title),
//                         trailing: IconButton(
//                           icon: Icon(Icons.delete),
//                           onPressed: () {
//                             todoBloc.add(DeleteTodoEvent(todoId: todo.id));
//                           },
//                         ),
//                       );
//                     },
//                   );
//                 } else if (state is TodoErrorState) {
//                   print("ERROR");
//                   return Center(
//                     child: Text(state.message),
//                   );
//                 }
//
//                 return Container();
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:demo_test/routing/locator/locator.dart';
import 'package:demo_test/routing/router.dart';
import 'package:demo_test/routing/routes.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setLocator();

  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const OverlaySupport(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.employeeListScreen,
        onGenerateRoute: PageRouter.generateRoutes,
      ),
    );
  }
}

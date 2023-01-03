// ignore_for_file: unnecessary_string_interpolations

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  late IO.Socket socket;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;

      Timer(Duration(seconds: 2), () {
        connect();
        print("yy");
      });
    });
  }

  void connect() {
    socket = IO.io(
      "https://chatcmk.comunikcrm.info:3001",
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
        'query': {
          "token":
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIyIiwianRpIjoiN2NmNzJiZTRjODE1NmVjYzBhYTE1ZDZjNmFkNjUzZDZlZTUwZDRkZTUzYjUwYTZiYjQzNjZmYmI1MGUxOGNiZTI3YTkxOTE3ZWQ0Zjc1YzgiLCJpYXQiOjE2NzI3NDE1MjAuNDQ1MjI1LCJuYmYiOjE2NzI3NDE1MjAuNDQ1MjM0LCJleHAiOjE2NzMzNDYzMjAuNDM4Mzc0LCJzdWIiOiIxMjIiLCJzY29wZXMiOlsiKiJdLCJ1c2VyIjp7ImlkIjoxMjIsImZpcnN0X25hbWUiOiJCb3VnaGRpcmkiLCJsYXN0X25hbWUiOiJEb3JzYWYiLCJlbWFpbCI6ImQuYm91Z2hkaXJpQGNvbXVuaWttYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkX2F0IjpudWxsLCJwaG9uZV9udW1iZXIiOiI5MzcxMjc2NCIsImNyZWF0ZWRfYXQiOiIyMDIyLTExLTI4VDA5OjI4OjM1LjAwMDAwMFoiLCJ1cGRhdGVkX2F0IjoiMjAyMy0wMS0wM1QxMDoyNToyMC4wMDAwMDBaIiwicG9zdF9udW1iZXIiOiIxNjYiLCJpc19hY3RpdmUiOjEsIm9wdGlvbnMiOiJbXSIsImltYWdlIjoiaW1hZ2VzL0V3OG9PS2E3RUxrUjM5MnNhcVhHdzRCQ3FNWklZUWRDVG5KUXdzWjIuanBnIiwidWlkIjoiNjM4NDdmM2QwY2JmNCIsInVzZXJuYW1lIjoiQm91Z2hkaXJpX0RvcnNhZiIsIm90cF9yZXF1aXJlZCI6MCwidGVuYW50X2lkIjoxLCJyb2xlIjoxLCJncm91cHMiOlt7ImlkIjoyLCJjcmVhdGVkX2F0IjoiMjAyMi0xMC0yMVQxNTowNzoyMC4wMDAwMDBaIiwidXBkYXRlZF9hdCI6IjIwMjItMTEtMTRUMTE6MzM6NTQuMDAwMDAwWiIsIm5hbWUiOiJVTklGSUVEKENIQVQsVk9JUCkiLCJ0ZW5hbnRfaWQiOjEsInBpdm90Ijp7InVzZXJfaWQiOjEyMiwiZ3JvdXBfaWQiOjJ9LCJhcHBsaWNhdGlvbnMiOlt7ImlkIjoxOSwiY3JlYXRlZF9hdCI6IjIwMjItMTAtMzFUMTA6Mjk6MTguMDAwMDAwWiIsInVwZGF0ZWRfYXQiOiIyMDIyLTEwLTMxVDEwOjI5OjE4LjAwMDAwMFoiLCJuYW1lIjoidW5pZmllZCIsImRvbWFpbiI6Imh0dHBzOi8vY2hhdGNtay5jb211bmlrY3JtLmluZm8iLCJsb2dvIjoiYXBwbGljYXRpb25zLzRkUE55bzhEYUNNQ1NEZWkyS0MyNWV5a3NUUG1IalZKTjJNZEtIaTEucG5nIiwicGl2b3QiOnsiZ3JvdXBfaWQiOjIsImFwcGxpY2F0aW9uX2lkIjoxOX19XX1dfX0.hLca78pi6dqBst01L-iTh6Odr4mIlxtSwPxNLSbMlXEJ2d2APss39J6BPG6S972xoM6UrOz4f6MTlIDG_pTIbAxtJnDXXjKksqE0RSVDDI0taCqOj_AkY6F_qfVvX6h5L7FvvHKWFtJxFtFnAQK_NbXyWJfxBWJuURyOt2WNudiYaEmCqhkuf-r9bFbehmKmI3jSBxsUz1T8kOX9YXEZ8hZ-qwcfW-zmoqujUvudqQBvj1CJBioB5_VuQ8CJf8UuIbnuJRYsHUmycx0AuhzeT4nyy34A_1_5Raw_sHoZCnoqQbWFBIrcpdc5Y-ZDz1_-ESp0b--xj6Gu1YJ8vvbmPAS03oTmSFJAq5JwCPzb9aYz0Z50T8sb4noAcxYhLvaj-p39oiyi7tqiDd6Ms8NgkBYlUSkOhsF-H1jiLY-MuJhLk3XiT1WgD__JhtameiIJA8ay24H-JF5DPjDilDj8aBz9dPT-GOQ82dxjJdm2rkXnMnQd_UtcGUDVMCNH4C57lv8x5UaPaIVV7wWZqq70t-W6UzNcPDMv2hiVftQYHVA4rn0RkUVa4D_jfNt3oQlB0zBVJFq4PRGIkwQBJkN6kWXAVO1LpulasSW_iP6ld5RzvNgaN7604EmOOLbsX7bxA0xIMYHV-XWNt4zDPEGlpM7roG1pMFk9jfRNVl09wIg"
        }
      },
    );

    socket.connect();
    socket.onConnect((_) {
      // showSuccessToast('Socket Connected');
      // print(SocketConstant.SOCKET_CONNECT);

      print("connectt");
      socket.emit("addUser", {
        "userId": 122,
        "tenant_id": 1,
        "uid": "63847f3d0cbf4",
        "rooms": [],
      });
    });
    socket.on('sendMessage', (data) {
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    //connect();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

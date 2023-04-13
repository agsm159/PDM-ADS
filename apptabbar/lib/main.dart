import 'package:flutter/material.dart';
import 'pages/nuvem.dart';
import 'pages/chuva.dart';
import 'pages/sol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TabBar',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter TabBar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_6_outlined),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            Center(
              child: MaterialApp(
                home: Imagenuvem(),
              )
            ),
            Center(
              child: MaterialApp(
                home: Imagemchuva(),
              )
            ),
            Center(
              child: MaterialApp(
                home: Imagemsol(),
              )
            ),
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController _tabController1;
  ValueNotifier<int> _currentIndex1 = ValueNotifier<int>(0);

  double _radius = 0;

  @override
  void initState() {
    super.initState();

    // TabControllerの初期化
    _tabController1 = TabController(length: _items.length, vsync: this);
  }

  final List<Widget> _items = [
    Tab(text: 'タブA'),
    Tab(text: 'タブB'),
    Tab(text: 'タブC'),
    Tab(text: 'タブC'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: _currentIndex1,
              builder: (BuildContext context, int index, Widget widget) {
                return Text('$index');
              },
            ),
            TabBar(
              controller: _tabController1,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: _items,
              indicator: MaterialIndicator(
                color: Colors.green[900],
                topLeftRadius: _radius,
                topRightRadius: _radius,
                bottomLeftRadius: _radius,
                bottomRightRadius: _radius,
              ),
              onTap: (int index) {
                _currentIndex1.value = index;
              },
            ),
          ],
        ),
      ),
    );
  }
}

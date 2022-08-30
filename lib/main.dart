import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SellUp',
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: SellUp(),
    );
  }
}

class SellUp extends StatefulWidget {
  const SellUp({Key? key}) : super(key: key);

  @override
  State<SellUp> createState() => _SellUpState();
}

class _SellUpState extends State<SellUp> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: _tabChildren.length, vsync: this);
    super.initState();
  }

  final _tabChildren = [
     Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Home',
                    style: TextStyle(color: Colors.white, fontSize: 70),
                  ),
                ),
              ),
              Container(
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Shop',
                    style: TextStyle(color: Colors.white, fontSize: 70),
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'News',
                    style: TextStyle(color: Colors.white, fontSize: 70),
                  ),
                ),
              )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SellUp'),
        centerTitle: true,
        // implement the tab bar
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.shop),
            ),
            Tab(
              icon: Icon(Icons.newspaper),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // implement the tab view
          TabBarView(
            controller: _tabController,
            children:_tabChildren,
          ),
          // implement the dots indicator
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              height: 100,
              color: Colors.black54,
              alignment: Alignment.center,
              child: TabPageSelector(
                controller: _tabController,
                indicatorSize: 20,
                selectedColor: Colors.white,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text("App Name"),
        leading: Builder(builder: (context){
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white),
            onPressed: (){
              // Scaffold.of(context).openDrawer();
              _globalKey.currentState.openDrawer();
            },
          );
        }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share),onPressed: (){}),
        ],
      ),
      drawer: new MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.business),title: Text("Business")),
          BottomNavigationBarItem(icon: Icon(Icons.school),title: Text("School")),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd(){

  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:MediaQuery.removePadding(
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width:80
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style:TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text("Add Acount"),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Manage accounts"),
                  )
                ],
              ),)
          ],
        ),
      )
    );
  }

}
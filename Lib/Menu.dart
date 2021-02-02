import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:m2r_iventory/page_computer.dart';


void main() {
  runApp(MaterialApp(
    title: "Selamat",
    debugShowCheckedModeBanner: false,
    home: HomePage(),

  ));
}

class HomePage extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();

}

class _MenuState extends State<HomePage> {
  int _selectedIndex = 0;

  final _widgetOptions = [
    PageComputer(),
  ];

  void _onItem (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Datang')
      ),
      body: Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Produk'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[800],
          onTap: _onItem,
        ),
      drawer: _buildDrawer(),
    );
  }


  Widget _buildDrawer() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipOval(
                child: Image(
                    image: NetworkImage(
                        'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-social-media-user-vector-default-avatar-profile-icon-social-media-user-vector-portrait-176194876.jpg  '),
                    fit: BoxFit.cover),
              ),
              accountName: Text("Mikodede"),
              accountEmail: Text("Mikodede.251@gmail"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            _buildListTile(Icons.home, "Home", null),
            _buildListTile(Icons.update, "Update", null),
            Divider(
              height: 2.0,
            ),
            _buildListTile(Icons.person, "Account", null),
            _buildListTile(Icons.settings, "Settings", null),
            Divider(
              height: 2.0,
            ),
            _buildListTile(null, "Logout", Icons.input),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(
    IconData iconLeading,
    String title,
    IconData iconTrailing,
  ) {
    return ListTile(
      leading: Icon(iconLeading),
      title: Text(title),
      trailing: Icon(iconTrailing),
      onTap: () {},
    );
  }
}


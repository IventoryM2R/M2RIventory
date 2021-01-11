import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selamat Datang'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Komputer", Icons.computer),
            makeDashboardItem("Handphone", Icons.phone_android),
            makeDashboardItem("Kamera", Icons.camera),
            makeDashboardItem("Speaker", Icons.phone_bluetooth_speaker)
          ],
        ),
      ),
      drawer: _buildDrawer(),
    );
  }

  Card makeDashboardItem(String title, IconData icon) {
    return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: new InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.black,
              )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style: new TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ),
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
              accountName: Text("adudu30"),
              accountEmail: Text("adudu.30@gmail.com"),
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
            ),
            _buildListTile(Icons.home, "Home", null),
            _buildListTile(Icons.shopping_basket, "Stok", null),
            _buildListTile(Icons.update, "Update", null),
            _buildListTile(Icons.bookmark_border, "Book", null),
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


import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'page_edit/edit_page.dart';

class PageSpiker extends StatefulWidget {
  @override
  _DashboardPageSpiker createState() => _DashboardPageSpiker();
}
class _DashboardPageSpiker extends State<PageSpiker> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spiker'),
      ),
      body: Center(
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => EditItemPage(item: null),
            ),
          );// Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
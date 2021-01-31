import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/edit_item.dart';
import 'page_edit/edit_page.dart';
import 'widget/card_item.dart';


class PageComputer extends StatefulWidget {
  @override
  _PageComputerState createState() => _PageComputerState();
}

class _PageComputerState extends State<PageComputer> {
  @override
  void iniState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 25,
        ),
        child: Column(
          children: [
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Container(
              height: 300,
              padding: EdgeInsets.all(5),
              color: Colors.blue,
              child: StreamBuilder(
                stream:
                FirebaseFirestore.instance.collection('item').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: snapshot.data.docs.map((document) {
                      Item item = Item(
                        id: document['id'],
                        name: document['name'],
                        image: document['image'],
                        desc: document['desc'],
                        harga: document['harga'],



                      );
                      return InkWell(
                        child: CardItem(item: null),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditItemPage(
                                item: item,
                                id: document.id,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: Text('Komputer'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => EditItemPage(item: null)),
          );// Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
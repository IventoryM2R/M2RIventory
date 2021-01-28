import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/itemHp.dart';
import 'page_edit/edit_page_hp.dart';
import 'widget/card_item_hp.dart';

class PageHandphone extends StatefulWidget {
  @override
  _PageHandphoneState createState() => _PageHandphoneState();
}

class _PageHandphoneState extends State<PageHandphone>{
  @override
  void iniStateHp() {
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
                FirebaseFirestore.instance.collection('item Hp').snapshots(),
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
                      ItemHp itemHp = ItemHp(
                        id: document['id'],
                        name: document['name'],
                        image: document['image'],
                        desc: document['desc'],
                        qty: document['qty'],
                        harga: document['harga'],



                      );
                      return InkWell(
                        child: CardItemHp(item: itemHp),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditItemPageHp(
                                  itemHp: itemHp,
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
        title: Text('Handphone'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => EditItemPageHp(itemHp: null)),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
    // return ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: snapshot.data.docs.map((document) {
    //     Item item = Item(
    //       id: document['id'],
    //       name: document['name'],
    //       image: document['image'],
    //       desc: document['desc'],
    //       qty: document['qty'],
    //       status: document['status'],
    //     );
    //     return InkWell(
    //       child: CardItem(item: null),
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => EditItemPage(
    //               item: item,
    //               id: document.id,
    //             ),
    //           ),
    //         );
    //       },
    //     );
    //   }).toList(),
    // );
  }
}

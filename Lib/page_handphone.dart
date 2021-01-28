import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:m2r_iventory/page_edit/edit_page_hp.dart';
import 'package:m2r_iventory/model/itemHp.dart';

import 'widget/card_item_hp.dart';

class PageHandphone extends StatefulWidget {
  @override
  _PageHandphoneState createState() => _PageHandphoneState();
}

class _PageHandphoneState extends State<PageHandphone>{
  @override
  void iniHp() {
    super.iniHp();
  }

  // final data = [
  //   ItemHp(
  //     id: "1",
  //     name: "Asus X401U",
  //     image: " ",
  //     desc: "Processor AMD E2 1800 (1.7 Ghz.) ",
  //     qty: 1,
  //     harga: 4500000,
  //
  //   ),
  // ];

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
                        ItemHp itemHp = ItemHp(
                          id: document['id'],
                          name: document['name'],
                          image: document['image'],
                          desc: document['desc'],
                          harga: document['harga'],

                        );
                        return InkWell(
                          child: CardItemHp(itemHp: itemHp),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditItemPageHp
                                  (itemHp: itemHp,
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
      //
      // body: ListView.builder(
      //     itemCount: data.length,
      //     itemBuilder: (context, i){
      //       return Card(
      //         elevation: 8,
      //         child: ListTile(
      //           title: Text(
      //             data[i].name,
      //             style: TextStyle(
      //                 fontSize: 18, fontWeight: FontWeight.bold),
      //           ),
      //           subtitle:
      //           Text('Desc: ${data[i].desc}'),
      //           trailing:
      //           Text("\Rp.${data[i].harga}"),
      //         ),
      //       );
      //         }
      //       ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => EditItemPageHp(itemHp: null),
            ),
          );// Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
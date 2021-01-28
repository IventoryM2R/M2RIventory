import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/itemHp.dart';

class EditItemPageHp extends StatefulWidget {
  final ItemHp itemHp;
  final String id;

  EditItemPageHp({@required this.itemHp, this.id});

  @override
  _EditItemPageStateHp createState() => _EditItemPageStateHp();
}

class _EditItemPageStateHp extends State<EditItemPageHp> {
  TextEditingController nameController;
  TextEditingController descController;
  TextEditingController qtyController;
  TextEditingController hargaController;
  File image;


  @override
  void iniHp() {
    nameController = TextEditingController();
    descController = TextEditingController();
    hargaController = TextEditingController();
    nameController.text = '';
    descController.text = '';
    hargaController.text = '';
    super.iniHp();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemHp != null) {
      nameController.text = widget.itemHp.name;
      descController.text = widget.itemHp.desc;
      hargaController.text = widget.itemHp.harga.toString();
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 25),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Edit Item',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.arrow_back),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                children: [
                  Container(
                    height: 150,
                    child: Center(
                      child: InkWell(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey,
                          child: CircleAvatar(
                            radius: 59,
                            backgroundColor: Colors.white,
                            backgroundImage: image != null
                                ? FileImage(image)
                                : widget.itemHp != null
                                ? widget.itemHp.image.isNotEmpty
                                ? NetworkImage(widget.itemHp.image)
                                : NetworkImage("https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324__340.jpg")
                                : NetworkImage("https://cdn.pixabay.com/photo/2014/08/05/10/30/iphone-410324__340.jpg"),
                          ),
                        ),
                        onTap: () {
                          // getImage(context);
                        },
                      ),
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: descController,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Desc',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: hargaController,
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Harga',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    height: 45,
                    color: Colors.blue,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    onPressed: () async {
                      ItemHp itemHp = ItemHp(
                        id: '',
                        name: nameController.text,
                        image: '',
                        desc: descController.text,
                        harga: int.parse(hargaController.text),
                      );
                      if (widget.itemHp == null) {
                        FirebaseFirestore.instance
                            .collection('item Hp')
                            .add(itemHp.toJson());
                      } else {
                        FirebaseFirestore.instance
                            .collection('item Hp')
                            .doc(widget.id)
                            .update(itemHp.toJson());
                      }
                      Navigator.pop(context);
                    },
                  ),
                  Visibility(
                    visible: widget.itemHp != null ? true : false,
                    child: FlatButton(
                      height: 45,
                      color: Colors.red,
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection('item Hp')
                            .doc(widget.id)
                            .delete();
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//   imgFromCamera() async {
//     PickedFile imgCamera = await ImagePicker()
//         .getImage(source: ImageSource.camera, imageQuality: 50);
//     setState(() {
//       image = File(imgCamera.path);
//     });
//   }
//
//   imgFromGallery() async {
//     PickedFile imgGallery = await ImagePicker()
//         .getImage(source: ImageSource.gallery, imageQuality: 50);
//     setState(() {
//       image = File(imgGallery.path);
//     });
//   }
//
//   getImage(context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return SafeArea(
//           child: Container(
//             child: Wrap(
//               children: <Widget>[
//                 ListTile(
//                     leading: Icon(Icons.photo_library),
//                     title: Text('Gallery'),
//                     onTap: () {
//                       imgFromGallery();
//                       Navigator.of(context).pop();
//                     }),
//                 ListTile(
//                   leading: Icon(Icons.photo_camera),
//                   title: Text('Camera'),
//                   onTap: () {
//                     imgFromCamera();
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Future<String> uploadFile(File image, String filename) async {
//     // FirebaseStorage storage = FirebaseStorage.instance;
//     // Reference ref = storage.ref().child("item/" + filename);
//     UploadTask uploadTask = ref.putFile(image);
//     return uploadTask.then((res) async {
//       return await res.ref.getDownloadURL();
//     });
//   }
}
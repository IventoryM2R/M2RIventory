class Item {
  final String id;
  final String name;
  final String image;
  final String desc;
  final int harga;
  // final String status;

  Item({
    this.id,
    this.name,
    this.image,
    this.desc,
    this.harga,
    // this.status,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      desc: json['desc'],
      harga: json['harga'],
      // status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'desc': desc,
    'harga': harga,
    // 'status': status,
  };
}

class ItemHp {
  final String id;
  final String name;
  final String image;
  final String desc;
  final int harga;


  ItemHp({
    this.id,
    this.name,
    this.image,
    this.desc,
    this.harga,

  });

  factory ItemHp.fromJson(Map<String, dynamic> json) {
    return ItemHp(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      desc: json['desc'],
      harga: json['harga'],

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

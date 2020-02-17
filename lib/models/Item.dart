class Item {
  String name;
  String type;
  String resourceURI;

  Item({this.name, this.type, this.resourceURI});

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    resourceURI = json['resourceURI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resourceURI'] = this.resourceURI;
    data['name'] = this.name;
    data['type'] = this.type;
    return data;
  }
}
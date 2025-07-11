
class OptionMenu {

  int id;
  String name;

  OptionMenu({
    required this.id,
    required this.name
  });

  factory OptionMenu.fromJson(Map<String, dynamic> json) => OptionMenu(
    id: json['id'], 
    name: json['name']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };

}
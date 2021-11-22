class MenuModel {
  String name = '', menu = '', pathImage = '';

  MenuModel.fromMap(Map<String,dynamic>map){
    name = map['name'];
    menu = map['menu'];
    pathImage = map['photomenu'];
  }
}

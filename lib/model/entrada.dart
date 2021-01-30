class Entrada {
  //Las cuentas con su informacion se almacenan de la siguiente forma
  int id;
  String titulo;
  String usuario;
  String password;
  String plataForma;

  Entrada({this.id, this.titulo, this.usuario, this.password, this.plataForma});

  Map<String, dynamic> toMap() {
    //Esto se usa para agregar a la BD
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['titulo'] = titulo;
    map['user'] = usuario;
    map['password'] = password;
    map['plataForma'] = plataForma;
    return map;
  }
}

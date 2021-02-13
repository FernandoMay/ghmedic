import 'dart:convert';

List<Empleado> empleadoFromJson(String str) =>
    List<Empleado>.from(json.decode(str).map((x) => Empleado.fromJson(x)));

String empleadoToJson(List<Empleado> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Empleado {
  Empleado({
    this.pkEmpleado,
    this.nombre,
    this.departamento,
    this.sexo,
    this.fechaIngreso,
    this.pais,
    this.estado,
  });

  String pkEmpleado;
  String nombre;
  String departamento;
  String sexo;
  DateTime fechaIngreso;
  String pais;
  String estado;

  factory Empleado.fromJson(Map<String, dynamic> json) => Empleado(
        pkEmpleado: json["PKEmpleado"],
        nombre: json["Nombre"],
        departamento: json["Departamento"],
        sexo: json["Sexo"],
        fechaIngreso: DateTime.parse(json["FechaIngreso"]),
        pais: json["Pais"],
        estado: json["Estado"],
      );

  Map<String, dynamic> toJson() => {
        "PKEmpleado": pkEmpleado,
        "Nombre": nombre,
        "Departamento": departamento,
        "Sexo": sexo,
        "FechaIngreso":
            "${fechaIngreso.year.toString().padLeft(4, '0')}-${fechaIngreso.month.toString().padLeft(2, '0')}-${fechaIngreso.day.toString().padLeft(2, '0')}",
        "Pais": pais,
        "Estado": estado,
      };
}

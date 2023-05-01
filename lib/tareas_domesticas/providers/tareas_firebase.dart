//nos referimos a la libreria
import 'dart:convert';

import 'package:http/http.dart' as http;

class TareasFireBase {
  static final TareasFireBase _instancia = TareasFireBase._privado();

  TareasFireBase._privado();

  factory TareasFireBase() {
    return _instancia;
  }

//cada que se usa un await se usa async
//el future se pone por que es una tarea asincrona, es decir resulve la peticion y cuando llega, puede devolver la lista
  Future<List<Map<String, dynamic>>> get tareas async {
    List<Map<String, dynamic>> tareas = [];

    final respuesta = await http.get(Uri.parse(
        "https://tareasdomesticas-f1a01-default-rtdb.firebaseio.com/tareas.json"));

    print('json: ${respuesta.body}');
    //convertir json a mapa
    //asi reconoce como datos y no como strings
    Map<String, dynamic>? datos = json.decode(respuesta.body);
    print('map: $datos');

    //recorrer mapa, para visaulizar los elementos necesarios, es decir sin
    datos?.forEach((indice, contenido) {
      contenido['id'] = indice;
      tareas.add(contenido);
    });

    print('lista: $tareas');

    return tareas;
  }

//POST: se utiliza para enviar información nueva al servidor.
//Por ejemplo, al crear una nueva tarea, se envía una solicitud POST al servidor
// con la información de la tarea.
  Future agregarTarea(Map<String, dynamic> nuevaTarea) async {
    final respuesta = await http.post(
        Uri.parse(
            "https://tareasdomesticas-f1a01-default-rtdb.firebaseio.com/tareas.json"),
        body: json.encode(nuevaTarea));

    return true;
  }

//PUT: se utiliza para actualizar información existente en el servidor.
//Por ejemplo, si se quiere modificar una tarea existente,
//se envía una solicitud PUT al servidor con la información actualizada de la tarea.
  Future<bool> editarTarea(Map<String, dynamic> nuevaTarea) async {
    final respuesta = await http.put(
        Uri.parse(
            "https://tareasdomesticas-f1a01-default-rtdb.firebaseio.com/tareas/${nuevaTarea['id']}.json"),
        body: json.encode(nuevaTarea));
    return true;
  }
//DELETE: se utiliza para eliminar información existente en el servidor.
//Por ejemplo, si se quiere eliminar una tarea,
// se envía una solicitud DELETE al servidor con el identificador de la tarea a eliminar.

  Future<bool> eliminarTarea(Map<String, dynamic> tarea) async {
    final respuesta = await http.delete(Uri.parse(
        "https://tareasdomesticas-f1a01-default-rtdb.firebaseio.com/tareas/${tarea['id']}.json"));
    return true;
  }

  Future<bool> terminarTarea(Map<String, dynamic> tarea) async {
    final respuesta = await http.put(
        Uri.parse(
            "https://tareasdomesticas-f1a01-default-rtdb.firebaseio.com/tareas/${tarea['id']}/estado.json"),
        body: json.encode(true));
    return true;
  }
}

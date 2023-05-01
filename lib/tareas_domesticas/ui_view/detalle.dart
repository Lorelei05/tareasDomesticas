import 'package:flutter/material.dart';
import 'package:tareas/tareas_domesticas/providers/tareas_firebase.dart';
import 'package:tareas/tareas_domesticas/providers/tareas_provider.dart';
import 'package:tareas/tareas_domesticas/ui_view/formulario.dart';

class DetallePage extends StatefulWidget {
  const DetallePage({Key? key}) : super(key: key);

  static final nombrePagina = 'detalle';

  @override
  State<DetallePage> createState() => _DetallePageState();
}

class _DetallePageState extends State<DetallePage> {
  @override
  Widget build(BuildContext context) {
    //modal route gestiona la ruta de navigator
    //el argumento se queda atrapado en tarea
    Map<String, dynamic>? tarea =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 239, 239, 242), // color de fondo detrás de todo el contenido
      appBar: AppBar(
        title: Text('Informacion'),
        backgroundColor: Color.fromARGB(0, 240, 234, 253),
        elevation: 0.0, // para quitar la sombra de la barra
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFA3BFFA),
              Color(0xFF9F7AEA),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(68),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          border: Border.all(
            color: Colors.transparent,
            width: 6,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        margin:
            EdgeInsets.only(top: 100.0, left: 40.0, right: 40.0, bottom: 500.0),
        child: Container(
          margin: EdgeInsets.only(top: 70.0, bottom: 10.0),
          child: Column(
            // Resto del contenido de la columna

            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  '${tarea?['nombre']}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Descripción:',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  '${tarea?['descripcion']}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30.0, bottom: 25.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (tarea != null) {
                          TareasFireBase().eliminarTarea(tarea);
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Eliminar'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Color.fromARGB(255, 52, 2,
                                  122); // Color de fondo cuando se presiona el botón
                            } else {
                              return Color.fromARGB(
                                  255, 52, 2, 122); // Color de fondo normal
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0, bottom: 25.0),
                    child: ElevatedButton(
                      //nos lleva a la pagina de formulario
                      onPressed: () => Navigator.pushNamed(
                          context, FormularioPage.nombrePagina,
                          arguments: tarea),
                      child: Text('Editar'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Color.fromARGB(255, 52, 2,
                                  122); // Color de fondo cuando se presiona el botón
                            } else {
                              return Color.fromARGB(
                                  255, 52, 2, 122); // Color de fondo normal
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0, bottom: 25.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (tarea != null) {
                          TareasFireBase().terminarTarea(tarea);
                          Navigator.pop(context);
                        }
                      },
                      /* onPressed: () {
                        TareasFireBase().terminarTarea(tarea);
                        Navigator.pop(context);
                      },*/
                      child: Text('Terminar'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Color.fromARGB(255, 52, 2,
                                  122); // Color de fondo cuando se presiona el botón
                            } else {
                              return Color.fromARGB(
                                  255, 52, 2, 122); // Color de fondo normal
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

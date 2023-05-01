import 'package:flutter/material.dart';
import 'package:tareas/tareas_domesticas/providers/tareas_firebase.dart';
import 'package:tareas/tareas_domesticas/providers/tareas_provider.dart';
import 'package:tareas/tareas_domesticas/ui_view/detalle.dart';

class FormularioPage extends StatefulWidget {
  FormularioPage({Key? key}) : super(key: key);

  static final nombrePagina = 'formulario';

  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  //primero se declara global
  Map<String, dynamic>? tarea;

  final idForm = GlobalKey<FormState>();
//se carga en los argumentos
  Map<String, dynamic> nuevaTarea = {};

  @override
  Widget build(BuildContext context) {
    tarea = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 238, 238, 241), // color de fondo detrás de todo el contenido

      appBar: AppBar(
        title: Text('Formulario'),
        backgroundColor: Color.fromARGB(0, 240, 234, 253),
        elevation: 0.0, // para quitar la sombra de la barra
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFA3BFFA),
                Color(0xFF9F7AEA),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            color: Colors.white,
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
          margin: EdgeInsets.only(top: 200.0, left: 40.0, right: 40.0),
          child: Form(
            key: idForm,
            child: Column(
              children: <Widget>[
                _crearInputNombre(),
                _crearInputDescripcion(),
                _craerBotonAgregar(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _crearInputNombre() {
    String? nombre = tarea?['nombre'] ?? '';
    return Container(
      margin: EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
      child: TextFormField(
        initialValue: nombre,
        onSaved: (valor) {
          nuevaTarea['nombre'] = valor;
        },
        style: TextStyle(
            color: Colors.white), // Agregar estilo para cambiar color de letra
        decoration: InputDecoration(
          hintText: 'Nombre de la tarea',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  _crearInputDescripcion() {
    String? descripcion = tarea?['descripcion'] ?? '';
    return Container(
      margin: EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
      child: TextFormField(
        initialValue: descripcion,
        onSaved: (valor) {
          nuevaTarea['descripcion'] = valor;
        },
        style: TextStyle(
            color: Colors.white), // Agregar estilo para cambiar color de letra
        decoration: InputDecoration(
          hintText: 'Descripcion de la tarea',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  _craerBotonAgregar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0, bottom: 25.0),
      child: ElevatedButton(
        onPressed: () {
          idForm.currentState?.save();
          nuevaTarea['estado'] = false;
          //pasamos tareas

          if (tarea != null) {
            //nos genera el id automatico
            nuevaTarea['id'] = tarea?['id'];

            TareasFireBase().editarTarea(nuevaTarea);
            Navigator.popUntil(
                context, ModalRoute.withName(DetallePage.nombrePagina));
          } else {
            TareasFireBase().agregarTarea(nuevaTarea);
          }
          Navigator.pop(context);
        },
        child: (tarea != null) ? Text('Editar tarea') : Text('Crear tarea'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Color.fromARGB(255, 52, 2,
                    122); // Color de fondo cuando se presiona el botón
              } else {
                return Color.fromARGB(255, 52, 2, 122); // Color de fondo normal
              }
            },
          ),
        ),
      ),
    );
  }
}

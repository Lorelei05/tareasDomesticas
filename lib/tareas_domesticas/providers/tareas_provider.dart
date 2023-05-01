class TareasProvider {
  List<Map<String, dynamic>> _tareas = [];

  static final TareasProvider _instancia = TareasProvider._privado();

  TareasProvider._privado() {
    _tareas = [];
  }

  factory TareasProvider() {
    return _instancia;
  }

  List<Map<String, dynamic>> get tareas {
    return _tareas;
  }

//las tareas que se registran en formulario, las paso aqui
  void agregarTarea(Map<String, dynamic> nuevaTarea) {
    _tareas.add(nuevaTarea);
  }

  //crear metodo editor para recibir parametros de tarea editada y la tarea antigua
  void editarTarea(
      Map<String, dynamic> nuevaTarea, Map<String, dynamic>? actualTarea) {
    for (var i = 0; i < _tareas.length; i++) {
      if (_tareas[i] == actualTarea) {
        _tareas[i] = nuevaTarea;
        break;
      }
    }
  }

  void eliminarTarea(Map<String, dynamic>? eliminarTarea) {
    _tareas.remove(eliminarTarea);
  }

  void terminarTarea(Map<String, dynamic>? actualTarea) {
    if (actualTarea == null) return; // agregando una verificación de nulidad

    for (var i = 0; i < _tareas.length; i++) {
      if (_tareas[i] == actualTarea) {
        actualTarea['estado'] = true;
        _tareas[i] = actualTarea;
        break;
      }
    }
  }
}

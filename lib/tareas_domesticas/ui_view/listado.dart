import 'package:tareas/tareas_domesticas/providers/tareas_firebase.dart';
import 'package:tareas/tareas_domesticas/providers/tareas_provider.dart';
import 'package:tareas/tareas_domesticas/tareas_app_theme.dart';
import 'package:tareas/main.dart';
import 'package:flutter/material.dart';
import 'package:tareas/tareas_domesticas/ui_view/detalle.dart';
import 'dart:math' as math;

import 'package:tareas/tareas_domesticas/ui_view/formulario.dart';

class ListadoPage extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const ListadoPage({Key? key, this.animationController, this.animation})
      : super(key: key);

  static final nombrePagina = 'listado';

  static final List<Map<String, dynamic>> tareas = [];

  @override
  State<ListadoPage> createState() => _ListadoPageState();
}

class _ListadoPageState extends State<ListadoPage> {
  //este mapa
  List<Map<String, dynamic>> tareas = [];

  @override
  Widget build(BuildContext context) {
    //  var tareasFuture = TareasFireBase().tareas;

    return Stack(
      children: [
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: widget.animation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - widget.animation!.value), 0.0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24, right: 24, top: 16, bottom: 18),
                  child: Container(
                    decoration: BoxDecoration(
                      color: TareasAppTheme.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        topRight: Radius.circular(68.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: TareasAppTheme.grey.withOpacity(0.2),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(
                        top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
                    //widget, que nos permite asisgar como atrivuto o parametros future
                    child: Container(
                      //nos ayuda con el tamano de pantalla y scroll
                      height: MediaQuery.of(context).size.height *
                          0.2, // 50% de la altura de la pantalla

                      child: FutureBuilder(
                        future: TareasFireBase().tareas,
                        builder:
                            (BuildContext contexto, AsyncSnapshot respuesta) {
                          if (respuesta.hasData) {
                            tareas = respuesta.data;
                            return tareas.isNotEmpty
                                ? ListView(children: _crearItem(context))
                                : Center(
                                    child: Text('No hay tareas agregadas'),
                                  );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        //boton de mas en la lista
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () =>
                Navigator.pushNamed(context, FormularioPage.nombrePagina),
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  //funcion de la lista de tareas
  List<Widget> _crearItem(BuildContext context) {
    List<Widget> temporal = [];

    for (Map<String, dynamic> tarea in tareas) {
      Widget item = ListTile(
        //arguments es ede el el mestodo push, que nos permite seleccioonar la tarea y llevarnos a su respectiva informacion
        onTap: () => Navigator.pushNamed(context, DetallePage.nombrePagina,
            arguments: tarea),
        title: Text('${tarea['nombre']}'),
        //if y else resumido
        trailing:
            (tarea['estado']) ? Icon(Icons.star) : Icon(Icons.star_border),
      );
      temporal.add(item);
    }
    return temporal;
  }
}

class CurvePainter extends CustomPainter {
  final double? angle;
  final List<Color>? colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors ?? [];
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shdowPaint = new Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shdowPaintCenter = new Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius =
        math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shdowPaint);

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        paint);

    final gradient1 = new SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = new Paint();
    cPaint..shader = gradient1.createShader(rect);
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle! + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}

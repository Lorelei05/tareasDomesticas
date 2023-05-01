import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tareas/tareas_domesticas/tareas_app_theme.dart';
import 'package:flutter/material.dart';
//import 'calendario.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:tareas/tareas_domesticas/ui_view/calendario.dart';

class SemanalPage extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  static final nombrePagina = 'semanal';

  SemanalPage({
    Key? key,
    this.animationController,
    this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 18),
              child: Stack(
                children: [
                  Container(
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
                        top: 40, left: 50, right: 50, bottom: 70),
                    child: TableCalendar(
                      //   calendarController: _calendarController,
                      focusedDay: DateTime.now(),
                      firstDay: DateTime.utc(2021, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                            color: Color.fromARGB(255, 12, 39, 174),
                            borderRadius: BorderRadius.circular(70)),
                      ),

                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      availableCalendarFormats: const {
                        CalendarFormat.week: 'Semanal',
                      },
                      calendarFormat: CalendarFormat.week,
                    ),
                  ),

                  /* Positioned(
                    bottom: 16.0,
                    right: 16.0,
                    child: FloatingActionButton(
                      onPressed: () => Navigator.pushNamed(
                          context, CalendarioPage.nombrePagina),
                      child: Icon(
                        Icons.calendar_today,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 18,
                      ),
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

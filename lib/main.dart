import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoappnew/auth/auth_screen.dart';
import 'package:todoappnew/screens/home.dart';
// import 'package:todoappnew/todo_dashboard.dart';
// import 'package:todoappnew/res/event_firestore_service.dart';
// import 'package:todoappnew/ui/add_event.dart';
// import 'package:todoappnew/ui/pages/add_event.dart';
// import 'package:todoappnew/ui/pages/view_event.dart';
// import 'package:todoappnew/models/event.dart';
// import 'package:todoappnew/table_calendar.dart';
// import 'package:table_calendar/table_calendar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, usersnapshot) {
          if (usersnapshot.hasData) {
            return Home();
          } else {
            return AuthScreen();
          }
        },
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // fontFamily: ' Poppins',
          primaryColor: Colors.purple,
          primarySwatch: Colors.purple),
      initialRoute: 'Authentication',
      routes: {
        'Authentication': (context) => const AuthScreen(),
        // 'Calender': (context) =>  AddEventPage()
      },
    );
  }
}

//calender part


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Calendar',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//       routes: {
//         "add_event": (_) => AddEventPage(),
//       },
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   CalendarController _controller;
//   Map<DateTime, List<dynamic>> _events;
//   List<dynamic> _selectedEvents;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CalendarController();
//     _events = {};
//     _selectedEvents = [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Calendar'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TableCalendar(
//               events: _events,
//               initialCalendarFormat: CalendarFormat.week,
//               calendarStyle: CalendarStyle(
//                   canEventMarkersOverflow: true,
//                   todayColor: Colors.orange,
//                   selectedColor: Theme.of(context).primaryColor,
//                   todayStyle: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18.0,
//                       color: Colors.white)),
//               headerStyle: HeaderStyle(
//                 centerHeaderTitle: true,
//                 formatButtonDecoration: BoxDecoration(
//                   color: Colors.orange,
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 formatButtonTextStyle: TextStyle(color: Colors.white),
//                 formatButtonShowsNext: false,
//               ),
//               startingDayOfWeek: StartingDayOfWeek.monday,
//               onDaySelected: (date, events) {
//                 setState(() {
//                   _selectedEvents = events;
//                 });
//               },
//               builders: CalendarBuilders(
//                 selectedDayBuilder: (context, date, events) => Container(
//                     margin: const EdgeInsets.all(4.0),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).primaryColor,
//                         borderRadius: BorderRadius.circular(10.0)),
//                     child: Text(
//                       date.day.toString(),
//                       style: TextStyle(color: Colors.white),
//                     )),
//                 todayDayBuilder: (context, date, events) => Container(
//                     margin: const EdgeInsets.all(4.0),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                         color: Colors.orange,
//                         borderRadius: BorderRadius.circular(10.0)),
//                     child: Text(
//                       date.day.toString(),
//                       style: TextStyle(color: Colors.white),
//                     )),
//               ),
//               calendarController: _controller,
//             ),
//             ..._selectedEvents.map((event) => ListTile(
//                   title: Text(event.title),
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => EventDetailsPage(
//                                   event: event,
//                                 )));
//                   },
//                 )),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () => Navigator.pushNamed(context, 'add_event'),
//       ),
//     );
//   }
// }


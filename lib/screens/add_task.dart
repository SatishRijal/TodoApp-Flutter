import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  add_Task_to_Firebase() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    // final User? user = Auth().currentUser;                                                                           ;                                                      ();
    final uid = user?.uid ?? 'null';
    var time = DateTime.now();
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(uid)
        .collection('mytasks')
        .doc(time.toString())
        .set({
      'title': title.text,
      'description': description.text,
      'time': time.toString()
    });
    Fluttertoast.showToast(msg: 'Data Added');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Enter Title:'),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: TextField(
                controller: description,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Description:'),
              ),
            ),
            const SizedBox(height: 10),
            Container(
                width: double.infinity,
                height: 20,
                child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.purple.shade100;
                      return Theme.of(context).primaryColor;
                    })),
                    onPressed: () {
                      add_Task_to_Firebase();
                    },
                    child:
                        const Text('Add Task', style: TextStyle(fontSize: 18))))
          ],
        ),
      ),
    );
  }
}

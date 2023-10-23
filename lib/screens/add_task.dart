import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  addTaskToFirebase() async {
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
      appBar: AppBar(title: const Text('Add Task')),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              child: TextField(
                controller: title,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Enter Title:'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              child: TextField(
                controller: description,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Description:'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
                width: double.infinity,
                height: 20,
                child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.purple.shade100;
                      }
                      return Theme.of(context).primaryColor;
                    })),
                    onPressed: () {
                      addTaskToFirebase();
                    },
                    child:
                        const Text('Add Task', style: TextStyle(fontSize: 18))))
          ],
        ),
      ),
    );
  }
}

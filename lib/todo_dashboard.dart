// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:todoappnew/constants/colors.dart';
// import 'package:todoappnew/screens/todoitem.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   TextEditingController title = TextEditingController();
//   TextEditingController desc = TextEditingController();
//   bool checked = false;
//   @override
//   // void initState() {
//   //   super.initState();
//   //   print("Init was called")
//   // }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: tdBGColor,
//         appBar: _buildappbar(),
//         body: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//             child: Column(
//               children: [
//                 Searchbox(),
//                 //   ],
//                 // ),
//                 // ),
//                 // body: SingleChildScrollView(
//                 //   child: Column(
//                 //     children: [
//                 //       TextField(
//                 //         controller: title,
//                 //         decoration: const InputDecoration(
//                 //           border: OutlineInputBorder(),
//                 //           hintText: 'Enter title',
//                 //         ),
//                 //       ),
//                 //       TextField(
//                 //         controller: desc,
//                 //         decoration: const InputDecoration(
//                 //           border: OutlineInputBorder(),
//                 //           hintText: 'Enter Desc',
//                 //         ),
//                 //       ),
//                 //       ElevatedButton(
//                 //           onPressed: () {
//                 //             AddToDo(title.text, desc.text);
//                 //           },
//                 //           child: const Text("Add Data")),
//                 //container
//                 SizedBox(height: 20),
//                 ListView(
//                   children: [
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.4,
//                       width: MediaQuery.of(context).size.width,
//                       color: Colors.lightBlue,
//                       child: StreamBuilder<QuerySnapshot>(
//                         stream: FirebaseFirestore.instance
//                             .collection("Todo")
//                             .snapshots(),
//                         builder: (context, snapshot) {
//                           return snapshot.connectionState ==
//                                   ConnectionState.waiting
//                               ? const CircularProgressIndicator()
//                               : ListView(
//                                   children: snapshot.data!.docs
//                                       .map((DocumentSnapshot document) {
//                                     Map<String, dynamic> data =
//                                         document.data() as Map<String, dynamic>;
//                                     return Expanded(
//                                       child: Container(
//                                         margin: EdgeInsets.only(
//                                             top: 50, bottom: 20),
//                                         child: Text(
//                                           'All Todos',
//                                           style: TextStyle(
//                                               fontSize: 30,
//                                               fontWeight: FontWeight.w500),
//                                         ),

//                                         height: 100,
                                        
//                                          CheckboxListTile(
//                                         value: data['isCompleted'],
//                                           title: Text(
//                                             data['title'],
//                                             style: TextStyle(
//                                                 decoration: data['isCompleted']
//                                                     ? TextDecoration.lineThrough
//                                                     : TextDecoration.none),
//                                           ),
//                                           subtitle: Text(data['desc']),
//                                           onChanged: ((value) {
//                                             FirebaseFirestore.instance
//                                                 .collection("Todo")
//                                                 .doc(document.id)
//                                                 .update({
//                                               "isCompleted": value,
//                                             }).whenComplete(() =>
//                                                     print("Data updated"));
//                                             print(document.id);
//                                             setState(() {
//                                               checked = value!;
//                                             });
//                                           }),
//                                         )
//                                         // // child: ListTile(title: Text(data['title'])),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             )));
//   }

//   Container Searchbox() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: const TextField(
//         decoration: InputDecoration(
//             contentPadding: EdgeInsets.all(0),
//             prefixIcon: Icon(
//               Icons.search,
//               color: tdBlack,
//               size: 30,
//             ),
//             prefixIconConstraints: BoxConstraints(
//               minHeight: 20,
//               minWidth: 25,
//             ),
//             border: InputBorder.none,
//             hintText: 'Search',
//             hintStyle: TextStyle(color: tdGrey, fontSize: 20)),
//       ),
//     );
//   }

//   AppBar _buildappbar() {
//     return AppBar(
//         centerTitle: true,
//         backgroundColor: tdBGColor,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Icon(Icons.menu, color: tdBlack, size: 30),
//             Container(
//                 height: 30,
//                 width: 30,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(30),
//                   child: Image.asset('assets/images/avatar.jpg'),
//                 ))
//           ],
//         ));
//   }

// // ignore: non_constant_identifier_names
//   void AddToDo(String title, String desc) async {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     await firestore.collection("Todo").add({
//       "desc": desc,
//       "title": title,
//       "isCompleted": false,
//     }).whenComplete(() => print("Data Stored"));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:indlkt_proj/screens/user_screens/widgets/add_user.dart';
import 'package:indlkt_proj/screens/user_screens/widgets/user_table.dart';
import 'package:indlkt_proj/widgets/appbar.dart';
import 'package:indlkt_proj/widgets/custom_container.dart';

import '../../constants/style.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Users", viewTime: true),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                top: 0.0,
                right: 0.0,
                child: Image(
                    width: 200,
                    image: AssetImage("assets/images/circle_bg.png"))),
            Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Image(
                    width: 200,
                    image: AssetImage("assets/images/circle_bg2.png"))),
            Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 58, top: 20),
                      child: Text('Users',
                          style: TextStyle(
                              color: blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                CustomContainer(child: UserTable()),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

// Stack(
//               children: [
//                 Positioned(
//                     top: 0.0,
//                     right: 0.0,
//                     child: Image(
//                         width: 200,
//                         image: AssetImage("assets/images/circle_bg.png"))),
//                 Positioned(
//                     bottom: 0.0,
//                     left: 0.0,
//                     child: Image(
//                         width: 200,
//                         image: AssetImage("assets/images/circle_bg2.png"))),
//                Padding(
//           padding: const EdgeInsets.only(top: 20, right: 55, left: 38),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 58, top: 20),
//                     child: Text('Add new user',
//                         style: TextStyle(
//                             color: blue,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold)),
//                   ),
//                 ],
//               ),
//               Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: CustomContainer(
//                       child: Column(children: [
//                     Column(
//                       children: [
//                         SizedBox(height: 35),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 30),
//                               child: Text("Username",
//                                   style: TextStyle(
//                                       color: dark.withOpacity(0.8),
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                             CustomTextField()
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 30),
//                               child: Text("Email",
//                                   style: TextStyle(
//                                       color: dark.withOpacity(0.8),
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                             CustomTextField()
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 30),
//                               child: Text("Password",
//                                   style: TextStyle(
//                                       color: dark.withOpacity(0.8),
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                             CustomTextField()
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 30),
//                               child: Text("No. Pegawai",
//                                   style: TextStyle(
//                                       color: dark.withOpacity(0.8),
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                             CustomTextField()
//                           ],
//                         ),
//                         SizedBox(height: 15),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 30),
//                               child: Text("Line *",
//                                   style: TextStyle(
//                                       color: dark.withOpacity(0.8),
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                             CustomDropdown(
//                                 dropdownItems: [
//                                   DropdownMenuItem(
//                                     value: "user",
//                                     child: Text("user"),
//                                   ),
//                                   DropdownMenuItem(
//                                     value: "admin",
//                                     child: Text("admin"),
//                                   ),
//                                   DropdownMenuItem(
//                                     value: "super admin",
//                                     child: Text("super admin"),
//                                   ),
//                                 ],
//                                 value: role,
//                                 onChange: (a) {
//                                   setState(() {
//                                     role = a;
//                                   });
//                                 },
//                                 hintText: "Role"),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Center(
//                           child: InkWell(
//                             onTap: () {},
//                             child: Container(
//                                 margin: EdgeInsets.all(25),
//                                 decoration: BoxDecoration(
//                                     color: active,
//                                     borderRadius: BorderRadius.circular(10)),
//                                 width: 120,
//                                 child: Center(
//                                   child: Padding(
//                                       padding: const EdgeInsets.all(10),
//                                       child: Text("Submit",
//                                           style: TextStyle(
//                                               color: light, fontSize: 15))),
//                                 )),
//                           ),
//                         )
//                       ],
//                     )
//                   ]))),
//             ],
//           ),
//         ),
                
//               ],
//             ),

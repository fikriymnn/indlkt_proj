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
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 60, bottom: 30),
        child: ExpandableFab(
          distance: 80,
          childrenOffset: Offset(10, 10),
          backgroundColor: active,
          child: Icon(Icons.people_alt_outlined, color: light),
          collapsedFabSize: ExpandableFabSize.regular,
          expandedFabSize: ExpandableFabSize.regular,
          type: ExpandableFabType.up,
          children: [
            FloatingActionButton.small(
              backgroundColor: active,
              child: Icon(Icons.add),
              heroTag: null,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      content: Padding(
                        padding:
                            const EdgeInsets.only(top: 85, right: 55, left: 38),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: CustomContainer(
                                child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                              AddUser()
                            ]))),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      appBar: CustomAppBar(title: "Users"),
      body: SingleChildScrollView(
        child: Container(
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
      ),
    );
  }
}

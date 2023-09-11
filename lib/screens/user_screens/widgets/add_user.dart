import 'package:flutter/material.dart';
import 'package:indlkt_proj/widgets/custom_textfield.dart';

import '../../../widgets/custom_dropdown.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  dynamic role;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(),
        SizedBox(height: 10),
        CustomTextField(),
        SizedBox(height: 10),
        CustomTextField(),
        SizedBox(height: 10),
        CustomTextField(),
        SizedBox(height: 10),
        CustomDropdown(
            dropdownItems: [
              DropdownMenuItem(
                value: "user",
                child: Text("user"),
              ),
              DropdownMenuItem(
                value: "admin",
                child: Text("admin"),
              ),
              DropdownMenuItem(
                value: "super",
                child: Text("super"),
              ),
            ],
            value: role,
            onChange: (a) {
              setState(() {
                role = a;
              });
            },
            hintText: "Role")
      ],
    );
  }
}

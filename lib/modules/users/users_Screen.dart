import 'package:flutter/material.dart';
import 'package:sample_app/models/user/user_Model.dart';

class UsersScreen extends StatefulWidget {
  UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<UserModel> users = [
    UserModel(id: 1, name: "Ebram", phoneNumber: "+205464884864468"),
    UserModel(id: 2, name: "Samuel", phoneNumber: "+205464884864468"),
    UserModel(id: 3, name: "Helmy", phoneNumber: "+205464884864468"),
    UserModel(id: 4, name: "Mikhail", phoneNumber: "+205464884864468"),
    UserModel(id: 5, name: "Nabila", phoneNumber: "+205464884864468"),
    UserModel(id: 6, name: "Youstina", phoneNumber: "+205464884864468"),
    UserModel(id: 7, name: "Marian", phoneNumber: "+205464884864468"),
    UserModel(id: 8, name: "Dived", phoneNumber: "+205464884864468"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Users",
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return userItem(users[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 10.0),
              child: Container(
                width: double.infinity,
                height: 2.0,
                color: Colors.black38,
              ),
            );
          },
          itemCount: users.length,
        )
      ),
    );
  }

  Widget userItem(UserModel user)
  {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.blue,
          child: Text(
            user.id.toString(),
            style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        const SizedBox(
          width: 30.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              user.phoneNumber,
              style: const TextStyle(
                color: Colors.black38,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
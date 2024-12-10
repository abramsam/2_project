import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Title"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notification_important),
            onPressed: onNotificationClicked,
          ),
          const Icon(Icons.search),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const Image(
                      image: NetworkImage("https://i.pinimg.com/originals/44/22/5b/44225b5436d16ad80bd029f83256edc4.jpg"),
                      width: 200.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.7),
                      width: 200.0,
                      padding: const EdgeInsetsDirectional.only(
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      child: const Text(
                          "Flower",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onNotificationClicked()
  {
    print("Notification Icon Clicked");
  }
}
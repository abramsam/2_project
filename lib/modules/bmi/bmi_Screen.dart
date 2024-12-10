import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sample_app/modules/bmi_Result/bmi_Result_Screen.dart';
import 'package:sample_app/shared/components/components.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {

  bool isMale = true;
  int age = 50;
  double height = 150.0;
  double weight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isMale? Colors.redAccent : Colors.white10,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/male.png"),
                              color: Colors.white,
                            ),
                            /*Icon(
                              Icons.male,
                              size: 120.0,
                              color: Colors.white,
                            ),*/
                            Text(
                              "Male",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isMale? Colors.white10 : Colors.redAccent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/female.png"),
                              color: Colors.white,
                            ),
                            /*Icon(
                              Icons.female,
                              size: 120.0,
                              color: Colors.white,
                            ),*/
                            Text(
                              "Female",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "HEIGHT",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.round().toString(),
                            style: const TextStyle(
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Cm",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: this.height,
                        onChanged: (value){
                          setState(() {
                            this.height = value;
                          });
                        },
                        max: 200.0,
                        min: 90.0,
                        activeColor: Colors.redAccent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "WEIGHT",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 30.0,
                            ),
                          ),
                          Text(
                            this.weight.round().toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.white24,
                                child: IconButton(
                                  onPressed: (){
                                    if(this.weight >= 0){
                                      setState(() {
                                        weight--;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.remove),
                                  color: Colors.grey[300],
                                  iconSize: 30.0,
                                ),
                              ),
                              /*FloatingActionButton(
                                onPressed: (){},
                                backgroundColor: Colors.grey[700],
                                // mini: true,
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),*/
                              const SizedBox(
                                width: 10.0,
                              ),
                              CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.white24,
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                  color: Colors.grey[300],
                                  iconSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "AGE",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 30.0,
                            ),
                          ),
                          Text(
                            this.age.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.white24,
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      this.age--;
                                    });
                                  },
                                  icon: const Icon(Icons.remove),
                                  color: Colors.grey[300],
                                  iconSize: 30.0,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.white24,
                                child: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      this.age++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                  color: Colors.grey[300],
                                  iconSize: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.redAccent,
              ),
              child: MaterialButton(
                onPressed: (){
                  setState(() {
                    double result = this.weight / pow(this.height/100, 2);
                    navigateTo(context, BmiResultScreen(
                      isMale: this.isMale,
                      age: this.age,
                      height: this.height,
                      weight: this.weight,
                      result: result.round(),
                    ));
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context){
                            BmiResultScreen screen = BmiResultScreen(
                              isMale: this.isMale,
                              age: this.age,
                              height: this.height,
                              weight: this.weight,
                              result: result.round(),
                            );

                            return screen;
                          },
                        ),
                    );*/
                  });
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:sample_app/modules/counter/cubit/cubit.dart";
import "package:sample_app/modules/counter/cubit/states.dart";

class CounterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (BuildContext context, CounterStates state) {
          if(state is CounterMinusState){
            // print("minus state : ${state.counter}");
          }else if(state is CounterPlusState){
            // print("plus state : ${state.counter}");
          }
        },
        builder: (BuildContext context, CounterStates state) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              "Counter",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: (){
                      CounterCubit.get(context).plus();
                    },
                    color: Colors.blue,
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.add,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    CounterCubit.get(context).counter.toString(),
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  MaterialButton(
                    onPressed: (){
                      CounterCubit.get(context).minus();
                    },
                    color: Colors.blue,
                    shape: const CircleBorder(),
                    child: const Text(
                      "ــ",
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sample_app/shared/components/components.dart';

class LoginScreen extends StatefulWidget {


  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  // Email
                  defaultTextFormField(
                    controller: this.email,
                    hintText: "Email Address",
                    labelText: "Email Address",
                    prefixIcon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted : (String value){
                      print("value : $value");
                    },
                    onChanged: (String value){
                      print("value : $value");
                    },
                    validator: (String? value){
                      if(value!.isEmpty){
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  // Password
                  defaultTextFormField(
                    controller: this.password,
                    hintText: "Password",
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: isVisible ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVisible,
                    onFieldSubmitted : (String value){
                      print("value : $value");
                    },
                    onChanged: (String value){
                      print("value : $value");
                    },
                    validator: (String? value){
                      if(value!.isEmpty){
                        return "Please enter your password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // Login button
                  defaultButton(
                    on_Pressed: (){
                      if(formKey.currentState!.validate()){
                        print("Email : ${this.email.text}");
                        print("Password : ${this.password.text}");
                      }
                    },
                    text: "Login",
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      TextButton(
                          onPressed: (){},
                          child: const Text(
                            "Register now",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

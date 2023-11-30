import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laptop/Firebase_Auth/Login_Screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool passHide = true;

  var _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
  }
  @override
  Widget build(BuildContext context) {

    void createUser()async{
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text.toString(), password: password.text.toString());
      } on FirebaseAuthException catch(ex){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${ex.code.toString()}")));
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: 600,
              height: 250,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/registration.png'),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(6, 27, 28,1),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)) ),
                  width: double.infinity,
                  height: 800,
                  child:   Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30 , top: 20),
                        width: double.infinity,
                        child: Text("Register" , style: GoogleFonts.abyssinicaSil(
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),
                      ),

                      Container(
                        margin: const EdgeInsets.only(left: 30 ),
                        width: double.infinity,
                        child: Text("Welcome back, Please Register To Your Account" , style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),
                      ),
                      const SizedBox(height: 10,),
                      Column(
                        children: [
                          Stack(
                              children:[
                                Container(
                                  width: 300,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),


                                    child: Form(
                                      key: _formkey,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                                border:  Border(bottom: BorderSide(color: Color.fromRGBO(6, 27, 28,1)))
                                            ),
                                            child: TextFormField(
                                              controller: firstname,
                                              validator: (value){
                                                if(value == null || value.isEmpty || value == " "){
                                                  return "Name is Required";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter Name",
                                                hintStyle: TextStyle(color: Colors.grey[700]),
                                                prefixIcon: const Icon(Icons.person,color: Color.fromRGBO(6, 27, 28,1),),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                                border:  Border(bottom: BorderSide(color: Color.fromRGBO(6, 27, 28,1)))
                                            ),
                                            child: TextFormField(
                                              controller: lastname,
                                              validator: (value){
                                                if(value == null || value.isEmpty || value == " "){
                                                  return "Last Name is Required";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter Last Name",
                                                hintStyle: TextStyle(color: Colors.grey[700]),
                                                prefixIcon: const Icon(Icons.person_2_outlined,color: Color.fromRGBO(6, 27, 28,1),),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                                border:  Border(bottom: BorderSide(color: Color.fromRGBO(6, 27, 28,1)))
                                            ),
                                            child: TextFormField(
                                              controller: email,
                                              validator: (value){
                                                if(value == null || value.isEmpty || value == " "){
                                                  return "Email is Required";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter Email",
                                                hintStyle: TextStyle(color: Colors.grey[700]),
                                                prefixIcon: const Icon(Icons.email,color: Color.fromRGBO(6, 27, 28,1),),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(

                                              controller: password,
                                              validator: (value){
                                                if(value == null || value.isEmpty || value == " "){
                                                  return "Password is required";
                                                }
                                              },
                                              obscureText: passHide==true?true:false,
                                              obscuringCharacter: "*",
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Enter Password",
                                                suffixIcon: IconButton(onPressed: (){
                                                  setState(() {
                                                    passHide =! passHide;
                                                  });
                                                }, icon: passHide==true? Icon(Icons.remove_red_eye):Icon(Icons.key)),
                                                hintStyle: TextStyle(color: Colors.grey[700]),
                                                prefixIcon: const Icon(Icons.password,color: Color.fromRGBO(6, 27, 28,1),),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                ),

                                Column(
                                  children: [
                                    GestureDetector(
                                        onTap: (){
                                          createUser();
                                          if(_formkey.currentState!.validate()){

                                            print(firstname.text.toString());
                                            print(lastname.text.toString());
                                            print(email.text.toString());
                                            print(password.text.toString());
                                            firstname.clear();
                                            lastname.clear();
                                            email.clear();
                                            password.clear();

                                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                            child: const Text("Login");
                                          }
                                        }, child: Container(
                                      margin: EdgeInsets.only(left: 50 , top: 380),
                                      width: 200,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          gradient: const LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Color.fromRGBO(6, 27, 28,1),
                                                Colors.black
                                              ]
                                          )
                                      ),
                                      child: const Center(
                                        child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold , fontSize: 20), ),
                                      ),
                                    )
                                    )

                                  ],
                                )
                              ]
                          ),
                          SizedBox(height: 30,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Text("Have an Account ? ",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white ,fontWeight: FontWeight.w300),),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen(),));
                                },
                                child:Text("SignIn",style: GoogleFonts.poppins(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w700),),
                              ),
                            ],
                          )



                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

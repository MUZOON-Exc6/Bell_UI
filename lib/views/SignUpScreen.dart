import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:signup/viewmodels/CityVm.dart';
import 'package:signup/viewmodels/UsersVm.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey <FormState> frm = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? gender = null;
  bool isTermAccepted = false;
  bool isPolicyAccepted = false;
  String? selectedCity = null;
  CityVm cvm =CityVm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(child: SingleChildScrollView(
         child: Column(children: [Container(height: 130,
         margin: EdgeInsets.only(top: 0.0, ),
           decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
               color: Colors.pink[500]),
           child: Center(child: Text("Sign UP",style: TextStyle(fontSize: 25,color: Colors.white),),),
         ),
           SizedBox(height: 25,),
           Container(height: 120,width: 120,
             decoration:BoxDecoration(borderRadius: BorderRadius.circular(40),
                 image: DecorationImage(image:AssetImage('images/bella.jpg'), fit: BoxFit.cover)) ,),
           Container(margin: EdgeInsets.all(20),

           child: Form( key: frm,
             child: Column(children: [
             TextFormField(
               controller: nameController,
               validator: (x)=> x != null && x.isNotEmpty?null:"this field is required",
               decoration: InputDecoration(
                   label:Text("User name :") ,
                   hintText: "Muzoon ahmed",
                   prefixIcon: Icon(Icons.account_box_rounded, color: Colors.pink[500],),
                   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                   focusedBorder: OutlineInputBorder(),

               ),),
             SizedBox(height: 20,),
             TextFormField(
               controller: emailController,
               validator: (x)=> x != null && x.isNotEmpty?null:"this field is required",
               keyboardType: TextInputType.emailAddress,
               decoration: InputDecoration(
                   label:Text("Email : ") ,
                   hintText: "mimo@gmail.com",
                   prefixIcon: Icon(Icons.email_outlined, color: Colors.pink[500],),
                   enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                   focusedBorder: OutlineInputBorder()

               ),),
               SizedBox(height: 20,),
               TextFormField(
                 controller:phoneController ,
                 validator: (x)=> x != null && x.isNotEmpty?null:"this field is required",
                 decoration: InputDecoration(
                     label:Text("Phone_Number : ") ,
                     hintText: "777545258",
                     prefixIcon: Icon(Icons.phone, color: Colors.pink[500],),
                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                     focusedBorder: OutlineInputBorder()
                 ),),
               SizedBox(height: 20,),
               TextFormField(
                 controller: passwordController,
                 validator: (x)=> x != null && x.isNotEmpty?null:"this field is required",
                 keyboardType: TextInputType.visiblePassword,
                 decoration: InputDecoration(
                     label:Text("Password: ") ,
                     prefixIcon: Icon(Icons.password, color: Colors.pink[500],),
                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                     //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink))
                 ),),
               SizedBox(height: 20,),
               TextFormField(
                 validator: (x)=> x != null && x.isNotEmpty?null:"this field is required",
                 decoration: InputDecoration(
                     label:Text("Confirm Password : ") ,
                     prefixIcon: Icon(Icons.lock, color: Colors.pink[500],),
                     enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),),
                     focusedBorder: OutlineInputBorder()
                 ),),
               SizedBox(height: 20,),
               Container(
                 height: 60,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.pink[200]),
                 child: Row(children: [Radio(value: "Male", groupValue: gender, onChanged: (x){
                   gender = x;
                   setState(() {
                   });
                 }),
                   Text("Male"),
                   Radio(value: "Female", groupValue: gender, onChanged: (x){
                     gender = x;
                     setState(() {
                     });
                   }),Text("Female"),
                 ],),
               ),
               Container(child:
                   Row(children: [
                     Checkbox(value: isTermAccepted, onChanged: (x){
                       isTermAccepted = x!;
                       setState(() {
                       });
                     }),
                     Text("Accept Terms and Conditions"),
                   ],),),
                   Row(children: [
                     Checkbox(value: isPolicyAccepted, onChanged: (x){
                       isPolicyAccepted = x!;
                       setState(() { });
                     }),
                     Text("Accept Policy"),
                   ],),
               DropdownButton(  value: selectedCity, hint: Text("select city"),
                 items: cvm.loadCities().map((e)=> DropdownMenuItem(child: Text(e.name),value: e.value,)).toList(),
                 onChanged: (x){
                 selectedCity = x!;
                 setState(() { });
               },
               ),
               SizedBox(height: 20,),
               Container(margin: EdgeInsets.only(bottom: 5.0),
                 height: 50,width: 250,
                 child: ElevatedButton(onPressed: (){
                   if(frm.currentState!.validate());
                   UsersVm uvm = UsersVm();
                   uvm.register(
                       name: nameController.text,
                       email: emailController.text,
                       pass: passwordController.text);
                   nameController.text = "";
                   emailController.text ="";
                   passwordController.text = "";
                 }, child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: 20),),
                     style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.pink[500],
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                 )),
               ),
               Text("Continue With",style: TextStyle(fontSize: 15,),),
               Divider(thickness: 3.0),
               Row(mainAxisAlignment: MainAxisAlignment.center,
                 children: [Container(height: 40,width:40,
                 child: Image.asset("images/facebook.png"),), SizedBox(width: 15,),Container(height: 60,width:60,child: Image.asset("images/goog.png"))],)
             ],),),
           ),
         ],),
       ),),
    );
  }
}

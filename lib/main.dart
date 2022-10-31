import 'package:bmi_calculator/second_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp( Bmi()));
  runApp( Bmi());


}

class Bmi extends StatefulWidget  {
  const Bmi({Key? key}) : super(key: key);


  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {

  int sliderValue=160;
  int selectCard=0;
  int weight=60;
  int age= 15;
    @override
  Widget build(BuildContext context) {


      return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
       return GetMaterialApp(
         debugShowCheckedModeBanner: false,
         home: Scaffold(
           appBar: AppBar(
             title: Center(child: Text('BMI Calculator', style: TextStyle(color: Colors.white),)),
             backgroundColor: Colors.black54,
           ),
           backgroundColor: Colors.lightBlueAccent,
           body: Column(
             children: [
               Expanded(child: Row(
                 children: [
                   Expanded(
                     child: GestureDetector(
                       onTap: (){
                         setState((){
                           selectCard = 1;
                         });
                       },
                       child: Container(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(FontAwesomeIcons.mars, size: 60.sp, color: Colors.white,),
                             SizedBox(height: 10.h,),
                             Text("Male", style: TextStyle(fontSize: 20.sp, color: Colors.white),),
                           ],

                         ),
                         margin: EdgeInsets.all(10),
                         decoration: BoxDecoration(
                           color: selectCard== 1? Colors.orange: Colors.black54,
                           borderRadius: BorderRadius.circular(20.r),
                         ),
                       ),
                     ),
                   ),
                   Expanded(child: GestureDetector(
                     onTap: (){
                       setState((){
                         selectCard = 2;
                       });
                     },
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(FontAwesomeIcons.venus, size: 60, color: Colors.white,),
                           SizedBox(height: 10.h,),
                           Text("Female", style: TextStyle(fontSize: 20.sp, color: Colors.white),),
                         ],

                       ),
                       margin: EdgeInsets.all(10),
                       decoration: BoxDecoration(
                         color: selectCard==2? Colors.orange:Colors.black54,
                         borderRadius: BorderRadius.circular(20.r),
                       ),
                     ),
                   ),)
                 ],
               ) ),
               Expanded(child: Row(
                 children: [
                   Expanded(child: Container(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text('HEIGHT', style: TextStyle(fontSize: 20.sp, color:Colors.white),
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(sliderValue.toString(), style: TextStyle(fontSize: 50.sp, color: Colors.white),),
                             Text('cm', style: TextStyle(fontSize: 20.sp, color: Colors.white),),
                           ],
                         ),
                         Slider(value: sliderValue.toDouble(),max: 280, min: 100,
                           onChanged:(value){
                             setState((){
                               sliderValue =value.toInt();
                             });
                           },
                           inactiveColor: Colors.white,
                           activeColor: Colors.orange,
                         )
                       ],
                     ),

                     margin: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                       color: Colors.black54,
                       borderRadius: BorderRadius.circular(20.r),
                     ),

                   ) ),
                 ],
               ) ),
               Expanded(child: Row(
                 children: [
                   Expanded(child: Row(
                     children: [
                       Expanded(
                         child: Container(
                           child: Column(
                             children: [
                               Text("WEIGHT", style: TextStyle(fontSize: 20.sp,color: Colors.white),),
                               Text("$weight", style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold, color: Colors.white ),),


                               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   GestureDetector(
                                     child: CircleAvatar(
                                       radius: 25.r,
                                       backgroundColor: Colors.white,
                                       child: Icon(FontAwesomeIcons.plus, color: Colors.black,),
                                     ),
                                     onTap: (){
                                       setState((){
                                         weight++;
                                       });
                                     },
                                   ),

                                   GestureDetector(
                                     child: CircleAvatar(
                                       radius: 25.r,
                                       backgroundColor: Colors.white,
                                       child: Icon(FontAwesomeIcons.minus, color: Colors.black,),
                                     ),
                                     onTap: (){
                                       setState((){
                                         weight--;
                                       });
                                     },
                                   )
                                 ],
                               )
                             ],
                           ),

                           margin: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             color: Colors.black54,
                             borderRadius: BorderRadius.circular(20.r),
                           ),
                         ),
                       ),
                       Expanded(
                         child: Container(
                           child: Column(
                             children: [
                               Text("AGE", style: TextStyle(fontSize: 20.sp,color: Colors.white),),
                               Text("$age", style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold, color: Colors.white ),),


                               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                 children: [
                                   GestureDetector(
                                     child: CircleAvatar(
                                       radius: 25.r,
                                       backgroundColor: Colors.white,
                                       child: Icon(FontAwesomeIcons.plus, color: Colors.black,),
                                     ),
                                     onTap: (){
                                       setState((){
                                         age++;
                                       });
                                     },
                                   ),

                                   GestureDetector(
                                     child: CircleAvatar(
                                       radius: 25.r,
                                       backgroundColor: Colors.white,
                                       child: Icon(FontAwesomeIcons.minus, color: Colors.black,),
                                     ),
                                     onTap: (){
                                       setState((){
                                         age--;
                                       });
                                     },
                                   )
                                 ],
                               )
                             ],
                           ),

                           margin: EdgeInsets.all(10),
                           decoration: BoxDecoration(
                             color: Colors.black54,
                             borderRadius: BorderRadius.circular(20.r),
                           ),
                         ),

                       ),
                     ],
                   ) ),
                 ],
               )),
               InkWell(
                 onTap: (){
                   print('Next Screen');
                   setState(() {

                     Get.to(Result(height: sliderValue, weight: weight, age: age));

                   });
                 },
                 child: Container(

                   margin: EdgeInsets.all(10),
                   decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.r), color: Colors.black54),
                   height: 50.h,
                   width: double.infinity,
                   child: Center(child: Text("Calculate", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.sp),)),
                 ),
               )
             ],
           ),
         ),
       );

      },

    );
  }
}




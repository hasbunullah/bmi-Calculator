import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'formula.dart';

class Result extends StatefulWidget {

  int weight;
  int height;
  int age;
   Result({required this.height,required this.weight, required this.age});


  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Logic l= Logic();
  double bmi_result= 0;
  String _message="";
  int colorNum=0;
  //String U="Under weight";
  //String H="Healthy weight";
  //String O="Overweight";



  @override
  void initState(){
  bmi_result = l.calculateBMI(widget.height, widget.weight);
  fun();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("BMI Calculator", style: TextStyle(color: Colors.black, fontSize: 20.sp),)),),
      backgroundColor: Colors.lightBlueAccent,

      body: Center(
        child: Container(
          child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
                        
              Text("BMI Result",style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),),
              Text("${bmi_result.toStringAsFixed(1)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),),
              SizedBox(height: 10.h,),
              Text(" " +_message,style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, color:colorNum==1?  Colors.red: colorNum==2? Colors.lightGreenAccent: colorNum==3? Colors.redAccent: Colors.red), ),

             ],
            
            
          ),
        ),
      ),
    );
  }
   fun(){

    String status="";
    int num=0;
    if(bmi_result < 18.5)
      {
        status= "Under Weight";
        num=1;
      }
    else if(bmi_result >18.5 && bmi_result <24.9 )
    {
      status= "Healthy Weight";
      num=2;
    }
    else if(bmi_result >24.9 && bmi_result <30 )
    {
      status= "Over Weight";
      num=3;
    }
    else if(bmi_result >30 )
    {
      status= "Obese";
      num=4;
    }
    setState(()=> _message= status);
    setState(()=> colorNum= num);
  }

}



import 'package:flutter/cupertino.dart';
import '../models/models.dart';
import 'dart:math';

class BmiData{
  double bmi;
  String comment;
  Color color;
  BmiData({this.bmi,this.color,this.comment});
}

class DataItem{
  bool male;
  int age;
  int height;
  int weight;
  DataItem({this.male,this.age,this.height,this.weight}); 
}

class Data extends ChangeNotifier{
  DataItem _data=DataItem(male:true,age: 20,height: 140,weight: 40);

  DataItem get allData{
    return _data;
  }


  BmiData get bmidata{
    var bmiData=BmiData();
    var bmi=10000*(_data.weight/(_data.height*_data.height));
    bmiData.bmi=bmi;
    if(bmi<=15){
      bmiData.comment="Very severely underweight";
      bmiData.color=Color(0xFFFCB504);
    }
    else if(15<bmi && bmi<=16){
      bmiData.comment="Severely underweight";
      bmiData.color=Color(0xFFFCB504);
    }
    else if(16<bmi && bmi<=18.5){
      bmiData.comment="Underweight";
      bmiData.color=Color(0xFFFCB504);
    }
    else if(18.5<bmi && bmi<=25){
      bmiData.comment="Normal (healthy weight)";
      bmiData.color=Color(0xFF48EB06);
    }
    else if(25<bmi && bmi<=30){
      bmiData.comment="Overweight";
      bmiData.color=Color(0xFFFC3904);
    }
    else if(30<bmi && bmi<=35){
      bmiData.comment="Moderately obese";
      bmiData.color=Color(0xFFFC3904);
    }
    else if(35<bmi && bmi<=40){
      bmiData.comment="Moderately obese";
      bmiData.color=Color(0xFFFC3904);
    }
    else {
      bmiData.comment="Very Severely obese";
      bmiData.color=Color(0xFFFC3904);
    }

    return bmiData;
  }


  void changeGender(){
    _data.male=!_data.male;
    print(_data.male);
    ChangeNotifier();
  }



  void incrementDataItem(DataType key){
    if(key==DataType.Age){
      _data.age++;
      }
    else if(key==DataType.Height){
      _data.height++;
    }
    else if(key==DataType.Weight){
      _data.weight++;
    }
    ChangeNotifier();
  }

  void decrementDataItem(DataType key){
    if(key==DataType.Age){
      _data.age--;
      }
    else if(key==DataType.Height){
      _data.height--;
    }
    else if(key==DataType.Weight){
      _data.weight--;
    }
    ChangeNotifier();
  }
}
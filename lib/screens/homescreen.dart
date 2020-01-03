import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/inr_dcr_btn.dart';
import '../widgets/togglebtn.dart';
import '../widgets/inputcard.dart';
import '../Providers/data.dart';
import '../models/models.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void rebuild(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq=MediaQuery.of(context);
    final data=Provider.of<Data>(context,listen: false);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left:8.0,right: 8,top:30),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ToggleBtn(rebuild,mq),
          Container(
            height: mq.size.height*.30,
            width: mq.size.width*.96,
            child: Card(
              color: Color(0xFF111328),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 4,
              borderOnForeground: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    data.bmidata.bmi.toStringAsFixed(3),
                    style: TextStyle(
                      color: data.bmidata.color,
                      fontFamily: "Exo",
                      fontSize: 80,
                      fontWeight:FontWeight.bold,
                      ),
                    ),
                  Text(
                    data.bmidata.comment,//data.allData.male==true ? "Male" :"Female",
                    style: TextStyle(
                      fontFamily: "Exo1",
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: mq.size.height*.15,
            width: mq.size.width*.93,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Color(0xFF111328) ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Age",
                style: TextStyle(fontFamily: "Exo1"),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InrDcrBtn(rebuild:rebuild,actiontype: ActionType.Dcr,datatype: DataType.Age,),
                    Text(data.allData.age.toString(),style: TextStyle(fontSize: 30,fontFamily: "Exo"),),
                    InrDcrBtn(rebuild:rebuild,actiontype: ActionType.Inr,datatype: DataType.Age,),
                  ],
                )
              ],
            )
            ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InputCard(rebuild,"Height(cm)",mq.size.width*.46,mq.size.height*.24,DataType.Height),
                InputCard(rebuild,"Weight(kg)",mq.size.width*.46,mq.size.height*.24,DataType.Weight),
               ],
              ),
          ),
        ],
          ),
      ),
    );
  }
}
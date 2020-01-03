import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../Providers/data.dart';
class ToggleBtn extends StatelessWidget {
  final Function rebuild;
  final MediaQueryData mq;
  ToggleBtn(this.rebuild,this.mq);

  final _trueColor=Color(0xFFEB1555);
  final _falseColor=Color(0xFF111328);

  @override
  Widget build(BuildContext context) {
    final data=Provider.of<Data>(context,listen: false);
    return Container(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
        onTap: (){
          
            if (data.allData.male==false){
              data.changeGender();
              rebuild();
              }
          },
        child: Container(
          height: mq.size.height*.25,
          width: mq.size.width*.46,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 4,
            color: data.allData.male==true ? _trueColor : _falseColor,
            child: Icon(
              FontAwesomeIcons.male,
              size: 80,
              ),
          ),
        ),
      ),
      GestureDetector(
        onTap: (){
            if (data.allData.male==true){
              data.changeGender();
              rebuild();
            }
          },
        child: Container(
          height: mq.size.height*.25,
          width: mq.size.width*.48,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 7,
            color: data.allData.male==false ? _trueColor : _falseColor ,
            child: Icon(
              FontAwesomeIcons.female,
              size: 80,
              ),
          ),
        ),
      ),
        ],) 
    );
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/data.dart';
import "../models/models.dart";
class InrDcrBtn extends StatelessWidget {
  final Function rebuild;
  final DataType datatype;
  final ActionType actiontype; 
  InrDcrBtn({this.rebuild,this.datatype,this.actiontype});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (actiontype==ActionType.Inr)
        {
          Provider.of<Data>(context).incrementDataItem(datatype);
          rebuild();
        }
        else 
        {
          Provider.of<Data>(context).decrementDataItem(datatype);
          rebuild();
        }},
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.white30,
        child: Icon(
          actiontype==ActionType.Inr ? Icons.add :Icons.remove,
          ),
      ),      
    );
  }
}
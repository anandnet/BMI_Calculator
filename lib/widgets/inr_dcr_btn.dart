import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../Providers/data.dart';
import "../models/models.dart";
class InrDcrBtn extends StatefulWidget {
  final Function rebuild;
  final DataType datatype;
  final ActionType actiontype; 
  InrDcrBtn({this.rebuild,this.datatype,this.actiontype});

  @override
  _InrDcrBtnState createState() => _InrDcrBtnState();
}

class _InrDcrBtnState extends State<InrDcrBtn> {
  bool _buttonPressed=false;

  bool _loopActive = false;

  void action(BuildContext context)async{
    if (_loopActive) return;
    while(_buttonPressed==true){
        if (widget.actiontype==ActionType.Inr)
        {
          Provider.of<Data>(context).incrementDataItem(widget.datatype);
          widget.rebuild();
        }
        else 
        {
          Provider.of<Data>(context).decrementDataItem(widget.datatype);
          widget.rebuild();
        }
      await Future.delayed(Duration(milliseconds: 200));
    }
    _loopActive=false;
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
     onPointerUp: (hjjh){_buttonPressed=false;},
      onPointerDown: (hgj){
        _buttonPressed=true;
        action(context);
        },
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.white30,
        child: Icon(
          widget.actiontype==ActionType.Inr ? Icons.add :Icons.remove,
          ),
      ),      
    );
  }
}
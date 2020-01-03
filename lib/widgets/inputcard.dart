import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/inr_dcr_btn.dart';
import '../models/models.dart';
import '../Providers/data.dart';
class InputCard extends StatelessWidget {
  final Function rebuild;
  final String title1;
  final double width1;
  final double height;
  final DataType dataType;
  InputCard(this.rebuild,this.title1, this.width1, this.height,this.dataType);
  @override
  Widget build(BuildContext context) {
    final data=Provider.of<Data>(context,listen: false);
    return Container(
        margin: const EdgeInsets.only(top:5,bottom: 5,left: 2,right: 2),
        height: height,
        width: width1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF111328),
           ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              title1,
              style: TextStyle(
                fontFamily: "Exo1",
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              dataType==DataType.Height ? data.allData.height.toString() : data.allData.weight.toString(),
              style: TextStyle(
                fontFamily: "Exo",
                fontSize: 40,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InrDcrBtn(rebuild: rebuild,actiontype: ActionType.Dcr,datatype: dataType,),
                InrDcrBtn(rebuild: rebuild,actiontype: ActionType.Inr,datatype: dataType,)
              ],
            ),
          ],
        ),
    );
  }
}

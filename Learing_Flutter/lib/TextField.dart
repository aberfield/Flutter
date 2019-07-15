import 'package:flutter/material.dart';

class FocusTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FocusTestRouteState();
  }
}


class _FocusTestRouteState extends State<FocusTestRoute> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();

  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            decoration: InputDecoration(
              labelText: "input1"
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
              labelText: "input2",
            ),
          ),
          Builder(builder: (ctx){
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: (){
                    if (null == focusScopeNode){
                      focusScopeNode = FocusScope.of(context);
                    }
                    focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: (){
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                )
              ],
            );
          },)
        ],
      ),
    );
  }


}
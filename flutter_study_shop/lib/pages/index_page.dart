import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar:AppBar(
        title: Text("百姓生活+"),
      ),
       body: Center(
         child: Text('百姓生活+'),
       ),
      ),
    );
  }
}
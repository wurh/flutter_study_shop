import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_study_shop/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController typeController = TextEditingController();
  String showText= '欢迎您来到美好人间高级';

@override
  void initState() {
    // TODO: implement initState
   
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('美好人间'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  labelText: '美女类型',
                  helperText: '请输入你喜欢的类型',
                ),
                autofocus: false,
              ),
              RaisedButton(
                onPressed: (){
                  _choiceAction();
                },
                child: Text('选择完毕'),
              ),
              Text(
                showText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _choiceAction(){
    print('开始选择');
    if(typeController.text.toString() == ''){
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(title: Text('美女类型不能为空')),
      );
    }else{
        getHttp(typeController.text.toString()).then((val){
          setState(() {
            showText = val['data']['name'].toString();
          });
        });
    }
  }

  Future getHttp(String TypeText) async{
    try{
        print('来了！！！！');
        Response response;
        var data = {
          'name':TypeText,
        };
        response = await Dio().get("http://rap2api.taobao.org/app/mock/232042/api/home_page",
          queryParameters: data
        );
        print(response.data);
        return response.data;
    }catch(e){
      print(e);
    }
  }
}

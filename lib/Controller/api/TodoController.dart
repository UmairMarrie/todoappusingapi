import 'dart:convert';

import 'package:get/get.dart';
import 'package:todoappusingapi/Model/TodoModel.dart';
import 'package:http/http.dart'as http;

class Todocontroller extends GetxController{


  var TodoList = RxList<TodoModel>();
 @override
void onInit(){
  super.onInit();
  getTodos();
}
  Future <RxList<TodoModel> > getTodos() async {
    final response = await http.get(Uri.parse("https://66af2874b05db47acc59234f.mockapi.io/api/todolist"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
   for(Map<String,dynamic> index in data){
    TodoList.add(TodoModel.fromJson(index));
   }return TodoList;
    }
    else{
      return TodoList;
    }
  }
}
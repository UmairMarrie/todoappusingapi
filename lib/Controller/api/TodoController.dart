import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart'as http;
import 'package:todoappusingapi/Model/TodoModel.dart';

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


Future <void> postTodos(title) async {
    final response = await http.post(Uri.parse("https://66af2874b05db47acc59234f.mockapi.io/api/todolist",),
       headers:{'Content-Type':'Application/json'},
       body:json.encode({"title":title})
);

if(response.statusCode==201){
  TodoList.clear();
  getTodos();
}else{
  print("Failed");
}
    
  }

  Future <void> DeleteTodo(id) async {
    final response = await http.delete(Uri.parse("https://66af2874b05db47acc59234f.mockapi.io/api/todolist/$id"));
    if(response.statusCode==200){
      TodoList.clear();
      getTodos();
    }
    else{
      print("Failed");
    }
  }

  
}


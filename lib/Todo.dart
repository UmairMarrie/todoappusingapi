import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:todoappusingapi/Controller/api/TodoController.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController taskcontroller = TextEditingController();
    Todocontroller todocontroller = Get.put(Todocontroller());
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoApp"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Get.defaultDialog(
                  title: "Enter New Task",
                  content: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            controller: taskcontroller,
                            decoration:
                                InputDecoration(hintText: "Enter New Task"),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              print(taskcontroller.text);
                            },
                          ),
                        ],
                      )
                    ],
                  ));
            },
            child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Add New",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    )
                  ],
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "All Todos",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                 return   Obx(
                      () => Column(
                        children: todocontroller.TodoList.map((e) =>  Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.add_circle,
                            size: 25,
                          ),
                          Text(
                            e.title.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                        title: "Edit Task",
                                        content: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: TextFormField(
                                                  controller: taskcontroller,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Enter New Task"),
                                                )),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                OutlinedButton(
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                ElevatedButton(
                                                  child: Text(
                                                    "Save",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  onPressed: () {
                                                    print(taskcontroller.text);
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        ));
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    size: 25,
                                  )),
                              IconButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      title: "Delete Task",
                                      content: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  "Do you want to delete",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                          SizedBox(height: 25,),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              OutlinedButton(
                                                child: Text(
                                                  "No",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                onPressed: () {
                                                  Get.back();
                                                },
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              ElevatedButton(
                                                child: Text(
                                                  "Yes",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                onPressed: () {
                                                  print(taskcontroller.text);
                                                },
                                              ),
                                            ],
                                          )
                                        ],
                                      ));
                                },
                                icon: Icon(
                                  Icons.delete,
                                  size: 25,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )).toList()
                      ),
                    );
                  },
                  itemCount: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

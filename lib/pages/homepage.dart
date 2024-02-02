import 'package:flutter/material.dart';
import 'package:todos/pages/menu.dart';
import 'package:todos/todo.dart';
import 'package:todos/todo_item.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<ToDo> todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todocantroller = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            color: Colors.white54,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                _buildSearchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, bottom: 20),
                        child: Text(
                          'All ToDos',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                        ),
                      ),
                      for (ToDo todo in _foundToDo.reversed)
                        Todoitem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDo,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 650, right: 20, left: 20, bottom: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller:  _todocantroller,
                      decoration: InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 650,
                    right: 20,
                    bottom: 10
                  ),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                    onPressed: (){ _addToDoItem(_todocantroller.text);
                      },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }
 void _addToDoItem(String toDO){setState(() {
   todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDO));
 });
    _todocantroller.clear();
 }

 void _runFilled(String enteredkeyword){
    List<ToDo> results = [];
    if(enteredkeyword.isEmpty){
      results = todosList;
    }else{
      results = todosList.where((item) => item.todoText!.toLowerCase().contains(enteredkeyword.toLowerCase())).toList();
      setState(() {
        _foundToDo = results;
      });
    }
 }
  void _deleteToDo() {
    setState(() {
      todosList.removeWhere((item) => item.isDone);
    });
  }

  void _addNewToDo() {
    setState(() {
      String newId = generateNewId();
      todosList.add(ToDo(id: newId, todoText: 'New Task'));
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
              },
              child: Icon(Icons.menu, size: 20, color: Colors.black)),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
                  },
                  child: Image.asset("images/img_2.png")),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilled(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: Colors.black, size: 25),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
          border: InputBorder.none,
          hintText: "Search",
        ),
      ),
    );
  }

  // Replace this function with a proper ID generation mechanism
  String generateNewId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}

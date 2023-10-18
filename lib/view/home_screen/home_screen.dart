import 'package:flutter/material.dart';
import 'package:lumi_todo/model/notes_model.dart';
import 'package:lumi_todo/utils/color_constant.dart';
import 'package:lumi_todo/view/details_screen/details_screen.dart';
import 'package:lumi_todo/view/home_screen/data_container.dart';
import 'package:lumi_todo/controller/note_list_screen_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
 void initState()  {
    
    // TODO: implement initState
    loadDbData();

    super.initState();
  }

  loadDbData() async {
NoteListScreenController obj = NoteListScreenController();
    await obj.loadData();
  }


  int? selectedIndex;
  NoteListScreenController obj = NoteListScreenController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("To-Do"),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10))
            ),
            context: context,
            builder: (context) {
              return StatefulBuilder(builder: (context, insetState) {
                
              
                return Container(
                  child: Container(
                    padding: EdgeInsets.all(16),

                    color: Colors.amber[300],
                    child: Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                labelText: 'Title',
                                hintText: 'Enter Title here', // Placeholder text
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)
                                ),
                                contentPadding: EdgeInsets.all(
                                    10.0), // Optional: Padding inside the TextField
                              ),
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: descController,
                              maxLines: 5,
                              decoration: InputDecoration(
                                labelText: 'Description',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)
                                ),
                                hintText:
                                    'Enter Description here', // Placeholder text
                                
                                contentPadding: EdgeInsets.all(
                                    10.0), // Optional: Padding inside the TextField
                              ),
                            ),
                          ),
                         
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: dateController,
                              decoration: InputDecoration(
                                hintText: 'Enter date here', // Placeholder text
                              labelText: 'Date',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)
                              ),
                                contentPadding: EdgeInsets.all(
                                    10.0), // Optional: Padding inside the TextField
                              ),
                            ),
                          ),
                          SizedBox(height: 16,),
                          Container(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:mycolorsList.length,
                              itemBuilder: (context, index) => Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                              child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 4,
                                    color: selectedIndex==index
                                    ?Colors.black
                                    // mycolorsListDart[index]
                                    :Colors.transparent
                                     ),
                                     borderRadius: BorderRadius.circular(10),
                                     color: mycolorsList[index],
                                  ),
                                  height: 50,
                                  width: 50,
                                ),
                                onTap: () {
                                  insetState(() {
                                    selectedIndex=index;
                                    
                                  });
                                },
                              ),
                              ),),
                          ),



                          SizedBox(height: 20),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                
                                  onPressed: () {
                                    obj.addNote(NoteModel(
                                        title: titleController.text,
                                        des: descController.text,
                                        date: dateController.text,
                                        selectedcolor: selectedIndex??0
                                        ));
                                        Navigator.pop(context);
                                    setState(() {});
                                  },
                                  child: Text("Add")),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
            });
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: obj.dataList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(
                      detailsTitle: titleController.text,
                      detailsDate:  dateController.text,
                                     
                       detailsDesc:descController.text, 
                      
                    ),));
                  },
                  child: ContainerRefactor(
                    title: obj.dataList[index].title,
                    description: obj.dataList[index].des,
                    date: obj.dataList[index].date,
                    mycolor: obj.dataList[index].selectedcolor!,
                    onDeletePressed: () {
                      obj.deleteNote(index);
                      setState(() {});
                    },
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}

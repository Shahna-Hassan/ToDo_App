import 'package:flutter/material.dart';
import 'package:lumi_todo/controller/note_list_screen_controller.dart';
import 'package:lumi_todo/utils/color_constant.dart';


class ContainerRefactor extends StatefulWidget {
  const ContainerRefactor(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      this.mycolor=0,
      this.onDeletePressed});
  final String? title;
  final String? description;
  final String? date;
  final int? mycolor;
  final void Function()? onDeletePressed;

  @override
  State<ContainerRefactor> createState() => _ContainerRefactorState();
}

class _ContainerRefactorState extends State<ContainerRefactor> {
NoteListScreenController noteController =NoteListScreenController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: mycolorsList[widget.mycolor!] ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title!,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: widget.onDeletePressed, icon: Icon(Icons.delete))
                  ],
                ),
                Text(
                  
                  widget.description!,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text(widget.date!,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 35,
        )
      ],
    );
  }
}

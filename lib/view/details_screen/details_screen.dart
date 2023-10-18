import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.detailsTitle, required this.detailsDesc,required this.detailsDate});
  final detailsTitle;
   final detailsDesc;
    final detailsDate;


  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(widget.detailsTitle, style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,)),
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(widget.detailsDate,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
      widget.detailsDesc,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

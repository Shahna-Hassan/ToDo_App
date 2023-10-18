import 'package:hive/hive.dart';
import 'package:lumi_todo/model/notes_model.dart';
class NoteListScreenController{
  List<NoteModel> dataList=[];
final myBox=Hive.box('noteBox');


  void addNote(NoteModel newNote)
{
  dataList.add(newNote);
  updateDb();
}

void deleteNote(int index){
  dataList.removeAt(index);
  updateDb();
}
 loadData() async {
  
  dataList= await myBox.get('noteDataList')?? [];
}

void updateDb(){
  myBox.put('noteDataList', dataList);
}

}
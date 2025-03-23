import 'package:isar/isar.dart';

// this file is generated
//then run: dart run build_runner build
part 'note.g.dart';

@Collection()
class Note {
  Id id = Isar.autoIncrement;
  late String title;

  // set text(String text) {}
}

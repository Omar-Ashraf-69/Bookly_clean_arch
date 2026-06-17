import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}



import 'package:bookly_clean_arch/constants.dart';
import 'package:bookly_clean_arch/core/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  @override
  List<BookEntity> getBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
  
}

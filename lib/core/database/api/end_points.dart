class EndPoints {
  static String baseUrl = "https://api.bigbookapi.com/";
  static String searchBooks = "search-books";
  static String quary = "query";
  static String similarBooks(int id) {
    return "$id/similar";
  }
}

class ApiKey {
  static String apiKey = "api-key";
  static String number = "number";
  static String query = "query";

  static String message = "message";
  static String status = "status";
  static String code = "code";

  static String id = "id";
  static String title = "title";
  static String subtitle = "subtitle";
  static String image = "image";
  static String authors = "authors";
  static String rating = "rating";
  static String name = "name";
  static String average = "average";

  static String books = "books";
  static String similarBooks = "similar_books";
}

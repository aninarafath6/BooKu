import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:machine_test/handlers/exception_handler.dart';
import 'package:machine_test/models/book_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService with HandleException {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

// * set user
  Future<void> setBookMarked(BookItem book) async {
    try {
      // * call sharedPreference
      SharedPreferences pref = await _prefs;
      // pref.clear();
      var check = pref.getString("book_marked");
      if (check == null) {
        print("annond");
        var encoded = jsonEncode(
          Book(kind: "kind", totalItems: 1, items: [book]).toJson(),
        );

        print(encoded);
        pref.setString("book_marked", encoded);
      } else {
        print("allathond");

        Map<String, dynamic> current = jsonDecode(check.toString());

        Book books = Book.fromJson(current);
        books.items.add(book);

        pref.setString("book_marked", jsonEncode(books.toJson()));
      }
    } catch (e) {
      log("error from set bookmark on localStorage $e");
      handleException(e, message: "Book Mark failed");
    }
  }

  Future<Book?> getBookMarkedList() async {
    try {
      SharedPreferences pref = await _prefs;
      // pref.clear();
      var data = pref.getString("book_marked");
      if (data != null) {
        Map<String, dynamic> current = jsonDecode(data);
        Book book = Book.fromJson(current);
        print("length : ${book.items.length}");
        return book;
      }
    } catch (e) {
      handleException("Retrieving book failed");
    }
    return null;
  }

  void removeBookMarked(BookItem book) async {
    try {
      // * call sharedPreference

      SharedPreferences pref = await _prefs;
      // pref.clear();
      var check = pref.getString("book_marked");

      Map<String, dynamic> current = jsonDecode(check.toString());

      Book books = Book.fromJson(current);
      books.items.removeWhere((element) => element.id == book.id);

      pref.setString("book_marked", jsonEncode(books.toJson()));
    } catch (e) {
      log("error from remove bookmark on localStorage $e");
      handleException(e, message: "Remove Book Mark failed");
    }
  }
}

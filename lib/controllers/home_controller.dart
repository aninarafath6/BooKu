import 'package:get/state_manager.dart';
import 'package:machine_test/common/constants/network_constants.dart';
import 'package:machine_test/handlers/exception_handler.dart';
import 'package:machine_test/models/book_model.dart';
import 'package:machine_test/services/base_client.dart';
import 'package:machine_test/services/shared_pref_service.dart';
import 'package:machine_test/utils/shuffle.dart';

class HomeController extends GetxController with HandleException {
  final BaseClient _baseClient = BaseClient(baseURL: Network.baseURL);
  final SharedPrefService _prefService = SharedPrefService();

  var books = [].obs;
  var recommendedBooks = [].obs;
  var popularBooks = [].obs;
  var bookMarked = [].obs;

  var a = "10".obs;

  void getBooks() async {
    String data = await _baseClient.get(Network.endPoint);
    Book rawData = bookFromJson(data);
    books.value = shuffleFunc<BookItem>(rawData.items);
    int half = books.length ~/ 2;
    recommendedBooks.value = books.sublist(0, half);
    popularBooks.value = books.sublist(half, books.length);
  }

  @override
  void onInit() {
    getBooks();
    books.shuffle;
    getBookmarked();
    super.onInit();
  }

  void setBookMarked(BookItem book) async {
    if (isBookMarked(book)) {
      // nothing do
      bookMarked.removeWhere((element) => element.id == book.id);
      _prefService.removeBookMarked(book);
    } else {
      await _prefService.setBookMarked(book);
      bookMarked.add(book);
    }
  }

  void getBookmarked() async {
    bookMarked.value = await _prefService.getBookMarkedList() ?? [];
  }

  bool isBookMarked(BookItem book) {
    return bookMarked.where((bk) => bk.id == book.id).toList().isEmpty
        ? false
        : true;
  }
}

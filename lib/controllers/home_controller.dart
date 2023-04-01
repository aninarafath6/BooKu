import 'package:get/state_manager.dart';
import 'package:machine_test/common/constants/network_constants.dart';
import 'package:machine_test/handlers/exception_handler.dart';
import 'package:machine_test/models/book_model.dart';
import 'package:machine_test/services/base_client.dart';
import 'package:machine_test/utils/shuffle.dart';

class HomeController extends GetxController with HandleException {
  final BaseClient _baseClient = BaseClient(baseURL: Network.baseURL);

  var books = [].obs;
  var recommendedBooks = [].obs;
  var popularBooks = [].obs;

  var a = "10".obs;

  void getBooks() async {
    String data = await _baseClient.get(Network.endPoint);
    Book rawData = bookFromJson(data);
    books.value = shuffleFunc<BookItem>(rawData.items);
    int half = books.length ~/ 2;
    recommendedBooks.value = books.value.sublist(0, half);
    popularBooks.value = books.value.sublist(half, books.value.length);
  }

  @override
  void onInit() {
    getBooks();
    books.shuffle;
    super.onInit();
  }
}

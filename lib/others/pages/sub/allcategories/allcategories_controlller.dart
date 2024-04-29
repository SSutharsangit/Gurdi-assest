import 'dart:async';
import 'dart:convert';
import 'package:home_services/others/pages/sub/allcategories/category_model.dart';
import 'package:http/http.dart' as http;
class AllcategoriesController {
  final StreamController<List<Category>> _categoryStreamController =
      StreamController<List<Category>>();

  Stream<List<Category>> get categoryStream => _categoryStreamController.stream;

  final StreamController<List<Category>> _firstThreeCategoriesController =
      StreamController<List<Category>>();

  Stream<List<Category>> get firstThreeCategoriesStream =>
      _firstThreeCategoriesController.stream;

  void dispose() {
    _categoryStreamController.close();
    _firstThreeCategoriesController.close();
  }

  Future<void> fetchCategories() async {
    const String apiUrl = 'https://backendserve-production.up.railway.app/api/services';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<Category> categories = data.map((json) => Category.fromJson(json)).toList();
        _categoryStreamController.add(categories);

        if (categories.length >= 3) {
          _firstThreeCategoriesController.add(categories.sublist(0, 3));
        } else {
          _firstThreeCategoriesController.add(categories);
        }
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }
}

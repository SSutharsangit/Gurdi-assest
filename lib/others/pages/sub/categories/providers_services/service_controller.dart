import 'dart:async';
import 'dart:convert';

import 'package:home_services/others/pages/sub/categories/providers_services/service_deatil_model.dart';
import 'package:home_services/others/pages/sub/categories/providers_services/service_model.dart';
import 'package:http/http.dart' as http;
class SerivesController {
  // Create a StreamController to manage the stream of category data
  final StreamController<List<Service>> _serviceStreamController = StreamController<List<Service>>();

  Stream<List<Service>> get categoryStream => _serviceStreamController.stream;
    // Create a StreamController to manage the stream of category data
  final StreamController<CarteServiceDetails> _serviceDeatilStreamController = StreamController<CarteServiceDetails>();

  Stream<CarteServiceDetails> get serviceDeatilStream => _serviceDeatilStreamController.stream;
 
 

  void dispose() {
    _serviceStreamController.close();
  }

Future<void> fetchCategories(int id) async {
  // API endpoint URL
  String apiUrl = 'https://backendserve-production.up.railway.app/api/services/$id/provider-service';

  try {
    // Make a GET request to the API endpoint
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the request is successful, parse the response body
      // and add the list of categories to the stream
      final List<dynamic> data = jsonDecode(response.body);
      final List<Service> categories = data.map((json) => Service.fromJson(json)).toList();
      print(categories);
      _serviceStreamController.add(categories);
    } else {
      // If the request is not successful, throw an exception
      throw Exception('Failed to load categories: ${response.statusCode}');
    }
  } catch (e) {
    // If an error occurs during the request, throw an exception
    throw Exception('Failed to load categories: $e');
  }
}
Future<void> fetchDetailsOfService(int id) async {
  print(id);
  // API endpoint URL
  String apiUrl = 'https://backendserve-production.up.railway.app/api/provider-service/$id';

  try {
    // Make a GET request to the API endpoint
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the request is successful, parse the response body
      final Map<String, dynamic>? data = jsonDecode(response.body);
      print(data);
      if (data != null) {
        // Parse the single object directly into ServiceDetail
        final CarteServiceDetails seviceDeatil = CarteServiceDetails.fromJson(data);
        print("hi");
        print(seviceDeatil.amountPerHour);
        _serviceDeatilStreamController.add(seviceDeatil);
      } else {
        throw Exception('Response body is null');
      }
    } else {
      // If the request is not successful, throw an exception
      throw Exception('Failed to load details: ${response.statusCode}');
    }
  } catch (e) {
    // If an error occurs during the request, throw an exception
    throw Exception('Failed to load details: $e');
  }
}



}

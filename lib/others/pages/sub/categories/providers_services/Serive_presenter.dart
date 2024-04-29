import 'package:flutter/material.dart';
import 'package:home_services/others/pages/sub/categories/providers_services/service_controller.dart';
import 'package:home_services/others/pages/sub/categories/providers_services/service_model.dart';
import 'package:home_services/others/widgets/heading.dart';
import 'package:home_services/others/widgets/service_card.dart';

class Services extends StatefulWidget {
  final Map<dynamic, dynamic>? header;

  const Services({Key? key, this.header}) : super(key: key);

  @override
  State<Services> createState() => _Services();
}

class _Services extends State<Services> {
  late int id;
  SerivesController serivesController = SerivesController();

  @override
  void initState() {
    super.initState();
    setState(() {
      id = widget.header?['id'];
    });
    serivesController.fetchCategories(widget.header?['id']);
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(""),
    ),
    body: StreamBuilder<List<Service>>(
      stream: serivesController.categoryStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No results found.'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final service = snapshot.data![index];
              return Column(
                children: [
                  Heading(title: service.serviceTypeName),
                  ServiceCard(service: service),
                  SizedBox(height: 10),
                ],
              );
            },
          );
        }
      },
    ),
  );
}
}
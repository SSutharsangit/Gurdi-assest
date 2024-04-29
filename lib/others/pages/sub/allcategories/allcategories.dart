import 'package:flutter/material.dart';
import 'package:home_services/others/pages/sub/allcategories/allcategories_controlller.dart';
import 'package:home_services/others/pages/sub/allcategories/category_model.dart';
import 'package:home_services/others/widgets/circularsericescard.dart';
import 'package:home_services/others/widgets/heading.dart';
import 'package:home_services/others/widgets/searchbox.dart';

class Allcategories extends StatefulWidget {
  const Allcategories({super.key});

  @override
  State<Allcategories> createState() => _AllcategoriesState();
}

class _AllcategoriesState extends State<Allcategories> {
  final AllcategoriesController allcategoriesController =
      AllcategoriesController();

  @override
  void initState() {
    allcategoriesController.fetchCategories();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Heading(title: 'All Categories'),
              const SizedBox(height: 10),
              const SearchBox(),
              const SizedBox(height: 10),
              // Use StreamBuilder to build UI based on category data stream
              StreamBuilder<List<Category>>(
                stream: allcategoriesController.categoryStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show loading indicator while waiting for data
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    // Show error message if an error occurs
                    return Text('Error: ${snapshot.error}');
                  } else {
                    // Build UI based on the category data
                    return GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      children: snapshot.data!.map((category) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              "/services",
                              arguments: {'id': category.id},
                            );
                          },
                          child: CircularSercicecard(
                            title: category.name,
                            imageUrl: category.img,
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

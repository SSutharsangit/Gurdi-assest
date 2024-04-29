import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home_services/others/auth/auth.dart';
import 'package:home_services/others/auth/login/presenters/login_model.dart';
import 'package:home_services/others/pages/sub/allcategories/allcategories_controlller.dart';
import 'package:home_services/others/pages/sub/allcategories/category_model.dart';
import 'package:home_services/others/widgets/circularsericescard.dart';
import 'package:home_services/others/widgets/heading.dart';
import 'package:home_services/others/widgets/searchbox.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthDataSources authDataSources = AuthDataSources();
  final AllcategoriesController allcategoriesController =
      AllcategoriesController();
  Map<String, dynamic>? userData;

  @override
  void initState() {
    getSavedUserData();
    allcategoriesController.fetchCategories();
    super.initState();
  }

  Future<void> getSavedUserData() async {
    Map<String, dynamic>? user = await authDataSources.getUserData();
    setState(() {
      userData = user;
    });
    print(userData);
  }

  @override
  void dispose() {
    allcategoriesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: double.infinity,
            height: 200,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      // userData != null ? "hi ${userData!.username} " : 'No user data available',
                      "hi ${userData?["username"] ?? 'Guest'}",

                      style:
                          const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(Icons.waving_hand, color: Colors.amber)
                  ],
                ),
                const Text(
                  "What you are looking for today",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SearchBox()
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                listviewcard(context, 0xffEAF6EF),
                listviewcard(context, 0xffE9F6FC),
                listviewcard(context, 0xffEAF6EF),
                listviewcard(context, 0xffE9F6FC),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Heading(title: 'All Categories'),
                const SizedBox(height: 10),
                const SearchBox(),
                const SizedBox(height: 10),
                StreamBuilder<List<Category>>(
                  stream: allcategoriesController.firstThreeCategoriesStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Column(
                        children: [
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length + 1,
                              itemBuilder: (context, index) {
                                // Check if it's the last item (for the additional button)
                                if (index == snapshot.data!.length) {
                                  // Return a widget for the additional button
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed("/allcategories");
                                      },
                                      child: const CircularSercicecard(
                                        title: "see all",
                                      ),
                                    ),
                                  );
                                } else {
                                  // Return the CircularServiceCard for other items
                                  final category = snapshot.data![index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: GestureDetector(
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
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: [
                const Heading(title: "Cleaning Services"),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const CleaningServiceList(
                        imageUrl:
                            "https://img.freepik.com/free-photo/professional-cleaning-service-people-working-together-office_23-2150520596.jpg?t=st=1709177831~exp=1709181431~hmac=0470f9d232b93756ea1c88112dacf839627b4b4e2314ef3c2f8585397b24caee&w=826",
                        title: "Home Cleaning",
                      ),
                      const CleaningServiceList(
                        imageUrl:
                            "https://img.freepik.com/free-photo/full-shot-men-cleaning-office_23-2149345551.jpg?t=st=1709182395~exp=1709185995~hmac=a6537319658d8d2c33ff50484b6f4ed527111ecddc9426644e3be28e5b020869&w=826",
                        title: "Carpet Cleaning",
                      ),
                      const CleaningServiceList(
                        imageUrl:
                            "https://img.freepik.com/free-photo/disinfecting-home_155003-9129.jpg?t=st=1709182471~exp=1709186071~hmac=c758ab2655a167ccbddc39666f96f7cfd01cdbd53c51dc8586e42e387d8de4fd&w=826",
                        title: "Home Cleaning",
                      ),
                      const CleaningServiceList(
                        imageUrl:
                            "https://img.freepik.com/free-photo/full-shot-men-cleaning-office_23-2149345551.jpg?t=st=1709182395~exp=1709185995~hmac=a6537319658d8d2c33ff50484b6f4ed527111ecddc9426644e3be28e5b020869&w=826",
                        title: "Carpet Cleaning",
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Container listviewcard(BuildContext context, int colorCode) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(colorCode),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "Deals For You",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.local_offer,
                color: Colors.amber,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Get Flat 50% off on first booking above 100",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Grab Offer"),
            style: ElevatedButton.styleFrom(),
          ),
        ],
      ),
    );
  }
}

class CleaningServiceList extends StatelessWidget {
  final String imageUrl;
  final String title;

  const CleaningServiceList({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

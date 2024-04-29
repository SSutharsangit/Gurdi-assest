import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:home_services/others/pages/sub/categories/providers_services/service_controller.dart';
import 'package:home_services/others/pages/sub/categories/providers_services/service_deatil_model.dart';
import 'package:home_services/others/widgets/heading.dart';

class Servicedetailpage extends StatefulWidget {
  final Map<dynamic, dynamic>? header;
  const Servicedetailpage({Key? key, this.header}) : super(key: key);

  @override
  State<Servicedetailpage> createState() => _ServicedetailpageState();
}

class _ServicedetailpageState extends State<Servicedetailpage> {
  final SerivesController serivesController = SerivesController();

  @override
  void initState() {
    super.initState();
    // Fetch service details when the widget initializes
    serivesController.fetchDetailsOfService(widget.header?['id']);
  }

  bool ishome = true;
  bool isOffice = false;
  bool isvila = false;
   double? rate;
  bool isTextField=false;
  int units = 1;
  TextEditingController rateconytroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CarteServiceDetails>(
      stream: serivesController.serviceDeatilStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while waiting for data
          return Scaffold(
            appBar: AppBar(title: Text('Loading...')),
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          // Show error message if there's an error
          return Scaffold(
            appBar: AppBar(title: Text('Error')),
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData) {
          // Show message if no data available
          return Scaffold(
            appBar: AppBar(title: Text('No Data')),
            body: Center(child: Text('No data available')),
          );
        } else {
          // Data is available, use it to build UI
          final serviceDetail = snapshot.data!;
          return Scaffold(
            appBar: AppBar(title: Text("")),
            body: buildBody(serviceDetail),
          );
        }
      },
    );
  }

  Widget buildBody(CarteServiceDetails serviceDetail) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey[300],
        child: Stack(
          children: [
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 10, top: 50),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('${serviceDetail.service!.img}'))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star_rate,
                            color: Colors.white,
                          ),
                          Text(
                            "4.5",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Text(
                      '${serviceDetail.service!.name}',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                )),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: MediaQuery.of(context).size.width * 0.05,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Heading(
                      title: '${serviceDetail.service!.serviceType!.name}',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    selectioncolumn(),
                    SizedBox(
                      height: 20,
                    ),
                    const Heading(
                      title: "Description",
                    ),
                    Container(
                      height: 70,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: SingleChildScrollView(
                          child: Text(
                        '${serviceDetail.service!.serviceType!.description}',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )),
                    ),
                    const Heading(
                      title: "Rating",
                    ),
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          rate=rating;
                        });
                        print(rating);
                        
      
                      },
                    ),
                    if(rate!=null)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                    
                      child: TextField(
                        controller:rateconytroller,
                       decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                 filled: true,
                                fillColor: Colors.grey[180],
                                hintText: 'Type your comment...', 
                                border: OutlineInputBorder(),
                              ),
                      ),
                    ),
                     if(rate!=null)
                      ElevatedButton(
                        onPressed: () {
                         print(rate);
                         print(rateconytroller.text);
                         setState(() {
                           
                         });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(
                                0xff6759ff), // Use Color constructor to create a Color object
                          ),
                        ),
                        child: const Text(
                          "Make Rating",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          const Divider(
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "Total: Rs.${serviceDetail.amountPerHour! * units}",
                                  style: TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                "Bill Details",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                print(serviceDetail.provider!.user!.name);
                                Navigator.of(context).pushNamed(
                                  "/BookingService",
                                  arguments: {
                                    'Provider_name':
                                        serviceDetail.provider!.user!.name,
                                    'Provider_id': serviceDetail.providerId,
                                    'amount': serviceDetail.amountPerHour,
                                    'hours': units,
                                  },
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(
                                      0xff6759ff), // Use Color constructor to create a Color object
                                ),
                              ),
                              child: const Text(
                                "Book Now",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row selectioncolumn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              ishome = !ishome;
              isOffice = false;
              isvila = false;
            });
          },
          child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: ishome ? const Color(0xff6759ff) : Colors.white),
              child: Column(
                children: [
                  Icon(
                    Icons.real_estate_agent,
                    color: ishome ? Colors.white : Colors.grey,
                  ),
                  Text(
                    'Home',
                    style:
                        TextStyle(color: ishome ? Colors.white : Colors.grey),
                  )
                ],
              )),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              ishome = false;
              isOffice = !isOffice;
              isvila = false;
            });
          },
          child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: isOffice ? const Color(0xff6759ff) : Colors.white),
              child: Column(
                children: [
                  Icon(
                    Icons.apartment,
                    color: isOffice ? Colors.white : Colors.grey,
                  ),
                  Text(
                    'Office',
                    style:
                        TextStyle(color: isOffice ? Colors.white : Colors.grey),
                  )
                ],
              )),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              ishome = false;
              isOffice = false;
              isvila = !isvila;
            });
          },
          child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: isvila ? const Color(0xff6759ff) : Colors.white),
              child: Column(
                children: [
                  Icon(
                    Icons.villa,
                    color: isvila ? Colors.white : Colors.grey,
                  ),
                  Text(
                    'Vila',
                    style:
                        TextStyle(color: isvila ? Colors.white : Colors.grey),
                  )
                ],
              )),
        ),
      ],
    );
  }
}

class Countbutton extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  const Countbutton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        child: Icon(
          icon,
          color: Colors.grey,
        ),
      ),
    );
  }
}

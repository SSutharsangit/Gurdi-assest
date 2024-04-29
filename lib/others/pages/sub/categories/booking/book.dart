import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class BookingService extends StatefulWidget {
  final Map<dynamic, dynamic>? header;
  const BookingService({Key? key, this.header}) : super(key: key);

  @override
  State<BookingService> createState() => _BookingService();
}

class _BookingService extends State<BookingService> {
  final TextEditingController locationController = TextEditingController();

  
  DateTime? _fromDate;
  DateTime? _toDate;
  void _confirmBooking() {
     print("Location: ${locationController.text}");
    print(widget.header?['Provider_id']);
    print(widget.header?['amount']);
    print("Start Date and Time: ${_fromDate.toString()}");
    print("End Date and Time: ${_toDate.toString()}");
  }

  @override
  void initState() {
    print(locationController.text);
    print(widget.header?['Provider_name']);
    print(widget.header?['Provider_id']);
    print(widget.header?['amount']);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Color(0xff6759ff),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Booking Services',
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff6759ff),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Once you've booked, you cannot cancel your booking.",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff6759ff)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              child: Column(
                                children: [
                                  Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(Icons.edit_note,
                                              color: Color(0xff6759ff)),
                                          SizedBox(width: 5),
                                          Text(
                                            "ServiceProvider_Name",
                                            style: TextStyle(
                                                color: Color(0xff6759ff)),
                                          ),
                                        ],
                                      ),
                                      TextField(
                                        enabled: false,
                                        controller: TextEditingController(
                                          text:
                                              widget.header?['Provider_name'] ??
                                                  '',
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Type your reason...",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[500]),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    color: Color(0xff6759ff),
                                  ),
                                  Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(Icons.paid,
                                              color: Color(0xff6759ff)),
                                          SizedBox(width: 5),
                                          Text(
                                            "Cost per hour",
                                            style: TextStyle(
                                                color: Color(0xff6759ff)),
                                          ),
                                        ],
                                      ),
                                      TextField(
                                        enabled: false,
                                        controller: TextEditingController(
                                          text: widget.header?['amount']
                                                  .toString() ??
                                              '',
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Type detail...",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[500]),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    color: Color(0xff6759ff),
                                  ),
                                  Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(Icons.pin_drop,
                                              color: Color(0xff6759ff)),
                                          SizedBox(width: 5),
                                          Text(
                                            "Location",
                                            style: TextStyle(
                                                color: Color(0xff6759ff)),
                                          ),
                                        ],
                                      ),
                                      TextField(
                                        controller: locationController,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Type detail...",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[500]),
                                        ),
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    color: Color(0xff6759ff),
                                  ),
                                  DateTimePicker(
                                    type: DateTimePickerType.dateTimeSeparate,
                                    dateMask: 'd MMM, yyyy',
                                    // initialValue: DateTime.now().toString(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    icon: const Icon(Icons.event),
                                    dateLabelText: 'Start Date',
                                    timeLabelText: "Start Time",
                                    selectableDayPredicate: (date) {
                                      // Disable weekend days to select from the calendar
                                      if (date.weekday == 6 || date.weekday == 7) {
                                        return false;
                                      }

                                      return true;
                                    },
                                    onChanged: (val) {
                                      setState(() {
                                        _fromDate = DateTime.parse(val);
                                      });
                                    },
                                  
                                  ),
                                  const Divider(
                                    color: Color(0xff6759ff),
                                  ),
                                  DateTimePicker(
                                    type: DateTimePickerType.dateTimeSeparate,
                                    dateMask: 'd MMM, yyyy',
                                    // initialValue: DateTime.now().toString(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                    icon: const Icon(Icons.event),
                                    dateLabelText: 'End Date',
                                    timeLabelText: "End Time",
                                    selectableDayPredicate: (date) {
                                      // Disable weekend days to select from the calendar
                                      if (date.weekday == 6 || date.weekday == 7) {
                                        return false;
                                      }

                                      return true;
                                    },
                                    onChanged: (val) {
                                      setState(() {
                                        _toDate = DateTime.parse(val);
                                      });
                                    },
                                  
                                  ),
                                  const Divider(
                                    color: Color(0xff6759ff),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        _confirmBooking();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff6759ff),
                        ),
                        child: const Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

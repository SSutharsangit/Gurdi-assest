import 'package:flutter/material.dart';

class CircularSercicecard extends StatefulWidget {
  final String title;
  final String? imageUrl; // Updated to nullable image URL

  const CircularSercicecard({
    required this.title,
    this.imageUrl, // Nullable imageUrl parameter
    Key? key, // Add key parameter to constructor
  }) : super(key: key);

  @override
  State<CircularSercicecard> createState() => _CircularSercicecardState();
}

class _CircularSercicecardState extends State<CircularSercicecard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Conditionally render image or icon based on imageUrl
          if (widget.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(30), // Adjust border radius as needed
              child: Image.network(
                widget.imageUrl!,
                width: 60, // Adjust width as needed
                height: 60, // Adjust height as needed
                fit: BoxFit.cover, // Adjust fit as needed
              ),
            )
          else
            Icon(
              Icons.double_arrow, // Placeholder icon when imageUrl is null
              size: 60, // Adjust icon size as needed
              color: Colors.grey, // Adjust color as needed
            ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

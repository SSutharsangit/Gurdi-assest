import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return
    Container(
     
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
           filled: true,
          fillColor: Colors.grey[180],
          hintText: 'Search what you need...',
          // border: InputBorder.none,
          labelText: 'Search',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
    // return Container(
    //   decoration:  BoxDecoration(
    //   borderRadius: BorderRadius.circular(10), 
    //     color: Colors.grey[250],
    //   ),
    //   child: TextField(
        
    //     //  controller: _controller,
    //     onChanged: (value) {},
    //     decoration: InputDecoration(
    //       filled: true,
    //       fillColor: Colors.grey[250],
    //       hintText: 'Search what you need...',
    //       border: InputBorder.none,
    //       suffixIcon: Container(
    //         padding: const EdgeInsets.all(5),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(10),
    //           color: Colors.indigo,
    //         ),
    //         child: IconButton(
    //           color: Colors.white,
    //           icon: const Icon(Icons.search),
    //           onPressed: () {},
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
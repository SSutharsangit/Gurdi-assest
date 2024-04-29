import 'package:flutter/material.dart';
import 'package:home_services/others/widgets/heading.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Heading(title: "Booking"),
          bottom: const TabBar(
            tabs: [
              Tab(child: Text("UpComing")),
                 Tab(child: Text("History")),
                   Tab(child: Text("Draf")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Upcommingcard(),
                    SizedBox(height: 10,),
                    Upcommingcard(),
                  ],
                 ),
              ),
               Column(
                children: [
                  HistoryCard(),
                  SizedBox(height: 10,),
                  HistoryCard(),
                ],
               ),
               Column(
                children: [
                 DrafCard(),
                  SizedBox(height: 10,),
                  DrafCard(),
                ],
               ),
                  
          ],
        ),
      ),
    );
  }
}

class Upcommingcard extends StatelessWidget {
  const Upcommingcard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
             margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
             child: Column(
               children: [
    ListTile(
       title: Text("Exterior Painting",style: TextStyle(fontWeight: FontWeight.bold),),
       subtitle: Text("Reference code:#JKM2435"),
      leading: CircleAvatar(child: Icon(Icons.abc)),
    ),
    Divider(color: Colors.black,),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("Status",style: TextStyle(fontWeight: FontWeight.bold),),
      Container(
        padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10), 
         color: Colors.green[100]
        ),
        child: Text("Draft",style: TextStyle(color: Colors.green),),
      )
    ],),
               SizedBox(height: 5,), 
    ListTile(
     title: Text("8.44 -9.44pm,04 Mar", style: TextStyle(fontWeight: FontWeight.bold),),
     subtitle: Text("Schedule"),
     leading: CircleAvatar(child: Icon(Icons.calendar_month)),
    ),
    SizedBox(height: 5,),
    Container(
     margin: EdgeInsets.only(left: 14),
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
      SizedBox(
       child: Row(
         children: [
           CircleAvatar(child: Icon(Icons.calendar_month)),
           SizedBox(width: 15,),
      Column(
       children: [
         Text("Westing House",style: TextStyle(fontWeight: FontWeight.bold),),
         Text("Service Provider")
       ],
      ),
         ],
       ),
      ),
      Container(
       padding: EdgeInsets.all(10),
       decoration: BoxDecoration(
         color: Colors.indigo,
         borderRadius: BorderRadius.circular(10)
       ),
       child: 
       Row(
         children: [
           Icon(Icons.phone,color: Colors.white,size: 15),
           Text("Call",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
      
         ],
       ),
      )
       ],
      ),
    )
    
               ],
             ),
            );
  }
}

class DrafCard extends StatelessWidget {
  const DrafCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
         margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
         child: Column(
           children: [
             ListTile(
                title: Text("Exterior Painting",style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("Reference code:#JKM2435"),
               leading: CircleAvatar(child: Icon(Icons.abc)),
             ),
             Divider(color: Colors.black,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               Text("Status",style: TextStyle(fontWeight: FontWeight.bold),),
               Container(
                 padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), 
                  color: Colors.amber[100]
                 ),
                 child: Text("Draft",style: TextStyle(color: Colors.amber),),
               )
             ],),
           SizedBox(height: 5,), 
               Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
               Text("Schedule",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("8.00-9.00 AM,Dec 9")
             ],),
             
           ],
         ),
        );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
     child: Column(
       children: [
         ListTile(
            title: Text("Exterior Painting",style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text("Reference code:#JKM2435"),
           leading: CircleAvatar(child: Icon(Icons.abc)),
         ),
         Divider(color: Colors.black,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           Text("Status",style: TextStyle(fontWeight: FontWeight.bold),),
           Container(
             padding: EdgeInsets.symmetric(vertical: 3,horizontal: 10),
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), 
              color: Colors.blue[100]
             ),
             child: Text("Completed",style: TextStyle(color: Colors.blue),),
           )
         ],),
       SizedBox(height: 5,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           Text("Service Provider",style: TextStyle(fontWeight: FontWeight.bold),),
           Text("Westinghouse")
         ],),
         
           Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
           Text("Schedule",style: TextStyle(fontWeight: FontWeight.bold),),
                Text("8.00-9.00 AM,Dec 9")
         ],),
         
       ],
     ),
    );
  }
}

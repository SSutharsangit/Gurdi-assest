import 'package:flutter/material.dart';
import 'package:home_services/others/auth/auth.dart';
import 'package:home_services/others/pages/main/booking.dart';
import 'package:home_services/others/pages/main/homepage.dart';
import 'package:home_services/others/pages/main/notification.dart';
import 'package:home_services/others/pages/main/support.dart';


class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;
 
    AuthDataSources authDataSources = AuthDataSources();
        Map<String, dynamic>? userData;
   
  @override
  void initState() {
getSavedUserData();
    super.initState();
  }
   Future<void> getSavedUserData() async {
    Map<String, dynamic>? user = await authDataSources.getUserData();
    setState(() {
      userData = user;
    });
    print(userData);
  }
   

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer:  DrawerWidget(userData:userData),
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          actions: const [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bronze",
                    style: TextStyle(fontSize: 16, color: Color(0xffF4BF4B)),
                  ),
                  Text(
                    "0 POINTS",
                    style: TextStyle(fontSize: 12, color: Color(0xff636A75)),
                  )
                ],
              ),
            ),
            Icon(
              Icons.stars,
              color: Color(0xffF4BF4B),
            )
          ],
          title:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              "${userData?["role"] ?? 'Guest'}",
                style: TextStyle(fontSize: 12, color: Color(0xff636A75)),
              ),
              Row(
                children: [
                  Text(
                     "${userData?["mobile"] ?? 'Guest'}", 
                    style: TextStyle(fontSize: 18, color: Color(0xff172B4D)),
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              )
            ],
          ),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            Home(),
            Booking(), // Assuming you have a Booking page
             Alert(), // This is the current page, you might want to replace it with another page
            Support(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.description), label: ""),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.support_agent),
              label: "",
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.indigo,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}


 


class DrawerWidget extends StatelessWidget {
  final Map<String, dynamic>? userData; // Define userData as a class member

  const DrawerWidget({Key? key, this.userData}) : super(key: key); // Accept userData as a parameter

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff1c46e8),
      child: ListView(
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/id/1434212178/photo/middle-eastern-lady-using-laptop-working-online-sitting-in-office.jpg?s=1024x1024&w=is&k=20&c=H640-Mts2rHSHLTkCd04WFd_VhcHMwX8kAGVXW4ddJY='),
                ),
                title: Text(
                  "${userData?["username"] ?? 'Guest'}", // Use userData parameter
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                "${userData?["email"] ?? 'Guest'}", 
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
       drawerlsittile(
            icon: Icons.calendar_month,
            action: () {}, 
            title: "Calendar",
          ),
          drawerlsittile(
            icon: Icons.account_balance_wallet,
            action: () {}, 
            title: "Payment Method",
          ),
          drawerlsittile(
            icon: Icons.location_on,
            action: () {}, 
            title: "Address",
          ),
          drawerlsittile(
            icon: Icons.notifications_active,
            action: () {}, 
            title: "Notification",
          ),
          drawerlsittile(
            icon: Icons.collections_bookmark,
            action: () {}, 
            title: "Offers",
          ),
          drawerlsittile(
            icon: Icons.diversity_1,
            action: () {}, 
            title: "Refer a friend",
          ),
          drawerlsittile(
            icon: Icons.phone_in_talk,
            action: () {}, 
            title: "Support",
          ),
           drawerlsittile(
            icon: Icons.stars,
            action: () {}, 
            title: "Rate US",
          ),
            Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
           child: ElevatedButton(
           onPressed: () {
  Navigator.pushNamedAndRemoveUntil(
    context,
    '/LoginScreen', // The name of the route to navigate to
    (route) => false, // This function determines which routes to keep. Returning 'false' clears all previous routes.
  );
},

             child:  const Row(
               mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Logout"),
              SizedBox(width: 10,),
              Icon(Icons.logout)
            ],
           )),
         )
        ],
      ),
    );
  }
}

class drawerlsittile extends StatefulWidget {
  final IconData icon;
  final Function action;
  final String title;

  const drawerlsittile({
    Key? key,
    required this.icon,
    required this.action,
    required this.title,
  }) : super(key: key);

  @override
  State<drawerlsittile> createState() => _drawerlsittileState();
}

class _drawerlsittileState extends State<drawerlsittile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListTile(
        leading: Icon(widget.icon, color: Colors.white),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: () {
          widget.action();
        },
      ),
    );
  }
}
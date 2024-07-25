import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search here',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carousel/Slider
            Container(
              height: 200,
              child: PageView(
                children: [
                  Image.asset('assets/logo/img1.jpg'),
                  Image.asset('assets/logo/img2.jpg'),
                  Image.asset('assets/logo/img3.jpg'),
                ],
              ),
            ),
            // KYC Pending Notice
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'KYC Pending',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'You need to provide the required documents for your account activation.',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Click Here',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Categories
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryIcon(Icons.phone_android, 'Mobile'),
                  _buildCategoryIcon(Icons.laptop, 'Laptop'),
                  _buildCategoryIcon(Icons.camera_alt, 'Camera'),
                  _buildCategoryIcon(Icons.tv, 'LED'),
                ],
              ),
            ),
            // Exclusive for You
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EXCLUSIVE FOR YOU',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildExclusiveItem('assets/logo/m1.jpg', '32% Off'),
                        _buildExclusiveItem('assets/logo/m2.jpg', '14% Off'),
                        _buildExclusiveItem('assets/logo/m3.jpg', '20% Off'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(icon, size: 30),
        ),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget _buildExclusiveItem(String imageUrl, String discount) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Image.asset(imageUrl, height: 150, fit: BoxFit.cover),
          SizedBox(height: 4),
          Text(discount, style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}



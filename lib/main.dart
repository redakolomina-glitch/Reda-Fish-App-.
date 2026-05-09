import 'package:flutter/material.dart';

void main() {
  runApp(RedaFishApp());
}

class RedaFishApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reda Fish - متجر رضا للأسماك'),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            FishItem(name: 'سردين طري', price: '15 درهم', icon: Icons.flatware),
            FishItem(name: 'أسماك زينة (Aquarium)', price: '50 درهم', icon: Icons.water),
            FishItem(name: 'قيمرون (Crevettes)', price: '80 درهم', icon: Icons.set_meal),
          ],
        ),
      ),
    );
  }
}

class FishItem extends StatelessWidget {
  final String name;
  final String price;
  final IconData icon;

  FishItem({required this.name, required this.price, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 40),
        title: Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Text('الثمن: $price', style: TextStyle(color: Colors.green, fontSize: 16)),
        trailing: Icon(Icons.add_shopping_cart, color: Colors.orange),
      ),
    );
  }
}

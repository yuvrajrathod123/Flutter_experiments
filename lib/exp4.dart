import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<CardItem> cardItems = [
    CardItem(
      title: 'Card 1',
      subtitle: 'This is the first card',
      color: Colors.blue,
      icon: Icons.star,
    ),
    CardItem(
      title: 'Card 2',
      subtitle: 'This is the second card',
      color: Colors.green,
      icon: Icons.favorite,
    ),
    CardItem(
      title: 'Card 3',
      subtitle: 'This is the third card',
      color: Colors.orange,
      icon: Icons.attach_money,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text('Experiment 4'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 150.0), // Add padding from the top
          child: ListView.builder(
            itemCount: cardItems.length,
            itemBuilder: (context, index) {
              return CustomCard(cardItem: cardItems[index]);
            },
          ),
        ),
      ),
    );
  }
}

class CardItem {
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;

  CardItem({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
  });
}

class CustomCard extends StatelessWidget {
  final CardItem cardItem;

  CustomCard({required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 4.0,
      color: cardItem.color,
      child: ListTile(
        title: Text(
          cardItem.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          cardItem.subtitle,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: Icon(
          cardItem.icon,
          color: Colors.white,
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onTap: () {
          // Handle onTap event
          print('Tapped on ${cardItem.title}');
        },
      ),
    );
  }
}

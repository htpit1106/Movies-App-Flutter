import 'package:flutter/material.dart';
import 'package:movies_app/ui/widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movies")),
      body: ListView(
        children: [
          Moviecard(
            imagePath: "assets/images/img_1.png",
            title: 'Spiderman  ',
            rating: '9.5',
            year: '2018',
            duration: '139 minutes',
          ),
          Moviecard(
            imagePath: "assets/images/img_1.png",
            title: 'Spiderman  ',
            rating: '9.5',
            year: '2018',
            duration: '139 minutes',
          ),
        ],
      ),
    );
  }
}

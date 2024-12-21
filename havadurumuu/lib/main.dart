import 'package:flutter/material.dart';
import 'package:havadurumuu/screens/home_pace.dart';

void main() {
  runApp(const havadurumu());
}
class havadurumu extends StatelessWidget {
  const havadurumu({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePace(),
    );
  }
}

import 'package:flutter/material.dart';

class PickLocationMapScreen extends StatefulWidget {
  const PickLocationMapScreen({super.key});

  @override
  State<PickLocationMapScreen> createState() => _PickLocationMapScreenState();
}

class _PickLocationMapScreenState extends State<PickLocationMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Chọn vị trí bạn muốn chia sẻ'),
    ) , 
    body: Stack( 
      children: [
      
    ]),
    
    );
  }
}

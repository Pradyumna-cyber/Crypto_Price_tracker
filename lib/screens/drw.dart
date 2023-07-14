import 'package:flutter/material.dart';

class MyHeader extends StatefulWidget {
  const MyHeader({Key? key}) : super(key: key);

  @override
  State<MyHeader> createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(

                    image: AssetImage('lib/assets/images/img.jpeg'),
                ),
            ),

          ),
          Text(
            'Pradyumna Aher',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Text('info@contact.com',
              style: TextStyle(color: Colors.white, fontSize: 15))
        ],
      ),
    );
  }
}

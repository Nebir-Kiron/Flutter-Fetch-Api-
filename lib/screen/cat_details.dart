import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatDEtails extends StatefulWidget {
  final String ?image;
  final String ?orders;

  const CatDEtails({Key? key, this.image, this.orders}) : super(key: key);



  @override
  _CatDEtailsState createState() => _CatDEtailsState();
}

class _CatDEtailsState extends State<CatDEtails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cat Details PAge"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Cat Details",style: TextStyle(fontSize: 20),),
              Image.network(widget.image!),
              Text(widget.orders!)
            ],
          ),
        ),
      ),
    );
  }
}

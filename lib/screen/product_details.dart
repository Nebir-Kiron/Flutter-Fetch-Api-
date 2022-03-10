import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String ?image;
  final String ? name;

  const ProductDetails({Key? key, this.image, this.name}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details Page"),),
      body: Column(
        children: [
          Image.network(
            widget.image!,
          height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          Text(widget.name!),
        ],
      ),
    );
  }
}

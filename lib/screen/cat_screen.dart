import 'package:fetch_api_countries/model/cat_model.dart';
import 'package:fetch_api_countries/screen/cat_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CatScreen extends StatefulWidget {
  const CatScreen({Key? key}) : super(key: key);

  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  CatModel? catModelDetails;

  Future fetchCatData() async {
    var response =
        await http.get(Uri.parse("https://suuq.cwprojects.xyz/api/anything"));

    if (response.statusCode == 200) {
      setState(() {
        catModelDetails = catModelFromJson(response.body);
      });
      return catModelDetails;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cat Screen Api"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        primary: true,
        itemCount: catModelDetails!.cats!.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) => CatDEtails(
                            image: catModelDetails!.cats![index].catImg!,
                            orders: catModelDetails!.cats![index].catOrder!,
                          )));
            },
            child: Card(
              margin: EdgeInsets.all(5),
              child: Row(
                children: [
                  Image.network(catModelDetails!.cats![index].catImg!),
                  SizedBox(
                    width: 18,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        catModelDetails!.cats![index].catName!,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Text(
                        catModelDetails!.cats![index].catOrder!,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

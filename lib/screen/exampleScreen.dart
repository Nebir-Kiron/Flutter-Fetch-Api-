import 'package:fetch_api_countries/model/example_model.dart';
import 'package:fetch_api_countries/screen/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  _ExampleScreenState createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {

  ExampleModel? exampleCatagories ;
  bool loading = true;

  Future fetchExampleData() async{
      var response  = await http.get(Uri.parse("https://suuq.cwprojects.xyz/api/results"));

      if(response.statusCode == 200){
        setState(() {
          loading = false;
          exampleCatagories = exampleModelFromJson(response.body);
        });

        return exampleCatagories;
      }else{
        setState(() {
          loading = false;
        });
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchExampleData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Example Api View"),),
      body:
   loading? Center(child: CircularProgressIndicator(),) :  ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: exampleCatagories!.listItems!.length,
        itemBuilder: (_,index){
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (c)=> ProductDetails(image: exampleCatagories!.listItems![index].mainPicUrl,name: exampleCatagories!.listItems![index].catName,)));
              },
              child: Card(
                margin: EdgeInsets.all(6),
                child: Row(
                  children: [
                    Image.network(exampleCatagories!.listItems![index].mainPicUrl!,
                      height: 90,
                      width: 90,
                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            exampleCatagories!.listItems![index].catName!,
                            style: TextStyle(fontSize: 18,color: Colors.black),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          exampleCatagories!.listItems![index].price!,
                          style: TextStyle(fontSize: 18,color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),

              ),
            );
          }
      )
    );
  }
}

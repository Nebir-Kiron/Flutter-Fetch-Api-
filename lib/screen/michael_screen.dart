import 'package:fetch_api_countries/model/michael_model.dart';
import 'package:fetch_api_countries/provider/michale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MichaelScreen extends StatefulWidget {
  const MichaelScreen({Key? key}) : super(key: key);

  @override
  _MichaelScreenState createState() => _MichaelScreenState();
}

class _MichaelScreenState extends State<MichaelScreen> {

  @override
  void initState() {
    // TODO: implement initState
    var michele_data = Provider.of<MicheleControler>(context,listen: false);
    michele_data.fetchMichaelData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Michele View"),),
      body:Consumer<MicheleControler>(
        builder: (context,mData,child){
          return mData.loading? Center(child: CircularProgressIndicator(),): Column(
            children: [
              Text(mData.micheleDetails!.name!),
              Text(mData.micheleDetails!.age.toString()),
            ],
          );
        },
      )
    );
    //hoise to
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/rocket_list_response.dart';
import 'package:flutter_assignment/screens/provider/home_page_provider.dart';
import 'package:flutter_assignment/screens/ui/details_page.dart';
import 'package:flutter_assignment/utils/appConstants/appConstants.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HomePageProvider homePageProvider = HomePageProvider();

  @override
  void initState() {
   homePageProvider.getAllDataFromRocketList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>(
      create: (context) => homePageProvider,
      child: Consumer<HomePageProvider>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.deepPurple.shade100,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(AppConstants.listOfRockets, style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
          ),
          body: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Column(
            children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: model.rocketLists.length,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 100,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(id: model.rocketLists[index].id.toString(),),));
                            },
                            child: ListTile(
                              leading: Container(
                                width: 60,
                                height: 100,
                                child: Image.network(model.rocketLists[index].flickrImages![index]),
                              ),
                              title: Text(model.rocketLists[index].name.toString(), style: const TextStyle(fontWeight: FontWeight.bold),),
                              // Text('{items[index].title}$index'),
                              subtitle: Text(model.rocketLists[index].engines!.number.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                              // Text('items[index].discription}'),
                              trailing: Text(model.rocketLists[index].country.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ));
                    },
                  ),
                ),
            ],
          ),
              )),
        ),
      ),
    );
  }
}

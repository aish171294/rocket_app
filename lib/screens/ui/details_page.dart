import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/provider/details_page_provider.dart';
import 'package:flutter_assignment/utils/appConstants/appConstants.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  String id;
  DetailsPage({
    Key? key,
    required this.id
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  DetailsPageProvider detailsPageProvider = DetailsPageProvider();

  @override
  void initState() {
    super.initState();
    detailsPageProvider.id = widget.id;
    detailsPageProvider.getAllDataFromRocketDetails();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailsPageProvider>(
      create: (context) => detailsPageProvider,
      child: Consumer<DetailsPageProvider>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.deepPurple.shade100,
          appBar: AppBar(
            centerTitle: true,
            title:  const Text(
              AppConstants.detailsOfRockets,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          body: model.isLoading ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                         model.rocketDetails!.name.toString(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 270.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      // onPageChanged: callbackFunction,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: model.rocketDetails!.flickrImages!.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 5.0),
                              child:
                              Image.network(i)
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                             const Text(
                              AppConstants.activeStatus,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              model.rocketDetails!.active.toString(),
                              style: const TextStyle(
                                  fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                            children: [
                               const Text(
                                AppConstants.costPerLaunch,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                               model.rocketDetails!.costPerLaunch.toString(),
                                style: const TextStyle(
                                    fontSize: 17,
                                    ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                            children: [
                              const Text(
                                AppConstants.successRatePercent,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                model.rocketDetails!.successRatePct.toString(),
                                style: const TextStyle(
                                    fontSize: 17,
                                    ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                            children: [
                              const Text(
                                AppConstants.description,
                                style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold,), softWrap: true,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 210,
                                child: Text(
                                  model.rocketDetails!.description.toString(),
                                  style: const TextStyle(
                                      fontSize: 17,),
                                  maxLines: 10,
                                  softWrap: true,
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                           const Text(
                            AppConstants.wikiLink,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                 model.rocketDetails!.wikipedia.toString(),
                                  style: const TextStyle(
                                      fontSize: 17, ),
                                  maxLines: 2,
                                  softWrap: true,
                                ),
                              ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                          Text(
                            AppConstants.height$Diameter,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 250, bottom: 10),
                        child: Row(
                          children: [
                            Text(
                              model.rocketDetails!.height!.feet.toString(),
                              style: const TextStyle(
                                fontSize: 17, ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              model.rocketDetails!.height!.meters.toString(),
                              style: const TextStyle(
                                fontSize: 17,),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:demo_project/Animation/AnimationTranstion.dart';
import 'package:demo_project/contatnts.dart';
import 'package:demo_project/models/product%20list/mainmodel.dart';
import 'package:demo_project/screens/Home/Widgets/categories.dart';
import 'package:demo_project/screens/Home/Widgets/category.dart';
import 'package:demo_project/screens/product%20details/details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../Network/ProductsAPI.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'Widgets/appbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController controller = ScrollController();
  late MainModel object;
  int indexCategory = 0;
  List indexList = [0, 1, 2, 3];
  String category = '';
  int? id;

  @override
  Widget build(BuildContext context) {
    List categories = [
      "Jeans",
      "Sneakers",
      "Accessories",
      "Shirts",
    ];
    return Scaffold(
      backgroundColor: Constants.thirdColor,
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: TextFormField(
                cursorColor: Constants.secondryColor,
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontFamily: 'Ubuntu',
                  letterSpacing: 1.2,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search item',
                  suffixIcon: const Icon(Icons.search),
                  suffixIconColor: Constants.secondryColor,
                ),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CategoriesList(
                        text: categories[index],
                        function: () {
                          setState(() {
                            indexCategory = indexList[index];
                            category = categories[index];
                          });
                        },
                        color: indexCategory == indexList[index]
                            ? Constants.forthcolor
                            : Colors.grey[350],
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 0,
                      ),
                  itemCount: categories.length),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(20),
              child: Text(
                'Items',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Ubuntu',
                  letterSpacing: 1.25,
                  fontWeight: FontWeight.w600,
                  color: Constants.primaryColor,
                ),
              ),
            ),
            FutureBuilder<MainModel>(
              future: ProductsAPI().GetProducts(4210),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  object = snapshot.data!;
                  print(object);
                  return Container(
                    height: 390,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        mainAxisExtent: 290,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              AnimationTransition(
                                page: ProductDetails(
                                  id:snapshot.data!.products.elementAt(index).id,
                                ),
                              ),
                            );
                          },
                          child: CategoryView(
                              image: snapshot.data!.products
                                  .elementAt(index)
                                  .imageUrl,
                              id: snapshot.data!.products.elementAt(index).id,
                              name:
                                  snapshot.data!.products.elementAt(index).name,
                              price: 120),
                        );
                      },
                    ),
                  );
                }
                if (snapshot.hasError) {
                  print(snapshot.error);
                  // print(snapshot.data);
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return CircularProgressIndicator(
                  color: Constants.secondryColor,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
/*
  FutureBuilder<MainModel>(
                future: ProductsAPI().GetProducts(4210),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    object = snapshot.data!;
                    print(object);
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 25,
                        ),
                        itemCount: object.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              child: Column(
                                children: [
                                  Image.network(object.products
                                      .elementAt(index)
                                      .imageUrl),
                                  Text(object.products.elementAt(index).name),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    print(snapshot.data);
                  }
                  return CircularProgressIndicator(
                    color: Constants.secondryColor,
                  );
                }),
 */
/*
 Container(
              height: 390,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                controller: controller,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 290,
                ),
                physics: const  BouncingScrollPhysics(),
                itemCount: 10,

                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            child: Image.network(
                              'https://images.asos-media.com/products/gianni-feraud-short-sleeve-geo-print-tipping-shirt-in-burgundy/203457828-1-burgundy',
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'title',
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                color: Constants.primaryColor,
                                fontSize: 18,
                                letterSpacing: 1.5,
                                wordSpacing: 1.3,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: RatingBar.builder(
                              unratedColor: Constants.primaryColor,
                              itemSize: 15,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Constants.forthcolor,
                              ),
                              onRatingUpdate: (rating) {},
                              initialRating: 3,
                              minRating: 1,
                              allowHalfRating: true,
                            ),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0),
                                child: Text(
                                  '120.0 \$',
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      color: Constants.forthcolor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  color: Constants.primaryColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  color: Constants.primaryColor,
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
 */

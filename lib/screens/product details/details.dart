import 'package:demo_project/Animation/AnimationTranstion.dart';
import 'package:demo_project/Network/detailsAPI.dart';
import 'package:demo_project/database/dbhelper.dart';
import 'package:demo_project/models/details/details.dart';
import 'package:demo_project/screens/product%20details/Widgets/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../contatnts.dart';
import '../../database/helper.dart';
import '../Navigation/Navigation.dart';
import 'Widgets/top.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    Key? key,
    required this.id,
    required this.price,
    required this.name,
    required this.image,
    required this.color,
  }) : super(key: key);
  final int id;
  final double price;
  final String name;
  final String image;
  final String color;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late Details object;
  int counter = 0;

  void operation() {
    if (counter <= 1) {
      counter = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Top(),
            FutureBuilder<Details>(
                future: DetailsApi().GetProductsDetails(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    object = snapshot.data!;
                    print(object);
                    return Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.network('http://${widget.image}',
                                  scale: .8),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                55,
                                            child: Text(
                                              widget.name,
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Constants.primaryColor,
                                                fontSize: 18,
                                                letterSpacing: 1.5,
                                                wordSpacing: 1.3,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            child: Icon(
                                              Icons.favorite_border_rounded,
                                              color: Constants.forthcolor,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            MaterialButton(
                                              onPressed: () {
                                                setState(() {
                                                  counter++;
                                                });
                                              },
                                              minWidth: 5,
                                              padding: EdgeInsets.all(0),
                                              child: Icon(
                                                Icons.add,
                                                color: Constants.primaryColor,
                                              ),
                                            ),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Constants
                                                        .secondryColor),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  counter.toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                    color:
                                                        Constants.primaryColor,
                                                    fontSize: 18,
                                                    letterSpacing: 1.5,
                                                    wordSpacing: 1.3,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            MaterialButton(
                                              onPressed: () {
                                                setState(() {
                                                  counter--;
                                                  operation();
                                                });
                                              },
                                              minWidth: 5,
                                              padding: EdgeInsets.all(0),
                                              child: Icon(
                                                Icons.remove,
                                                color: Constants.forthcolor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '${widget.price.toString()} \$',
                                          style: const TextStyle(
                                            fontFamily: 'Ubuntu',
                                            color: Constants.forthcolor,
                                            fontSize: 18,
                                            letterSpacing: 1.5,
                                            wordSpacing: 1.3,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 15),
                                      child: Text(
                                        'Product Details',
                                        style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Constants.secondryColor,
                                          fontSize: 15,
                                          letterSpacing: 1.5,
                                          wordSpacing: 1.3,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            width: 1,
                                            color: Constants.secondryColor),
                                      ),
                                      child: Text(
                                        object.description,
                                        style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Constants.primaryColor,
                                          fontSize: 18,
                                          letterSpacing: 1.5,
                                          wordSpacing: 1.3,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 50,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Review',
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
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                              child: RatingBar.builder(
                                                unratedColor:
                                                    Constants.primaryColor,
                                                itemSize: 15,
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Constants.forthcolor,
                                                ),
                                                onRatingUpdate: (rating) {},
                                                initialRating: 3,
                                                minRating: 1,
                                                allowHalfRating: true,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Constants.primaryColor,
                                              size: 25,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: 40,
                                            width: 140,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: const StadiumBorder(),
                                                  foregroundColor:
                                                      Constants.primaryColor,
                                                  backgroundColor:
                                                      Constants.forthcolor),
                                              onPressed: () {},
                                              child: const Text(
                                                'Buy Now',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: 'Ubuntu'),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: 40,
                                            width: 140,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: const StadiumBorder(),
                                                  foregroundColor:
                                                      Constants.primaryColor,
                                                  backgroundColor:
                                                      Constants.secondryColor),
                                              onPressed: ()async {
                                                await DbHelper().insertTodo(Helper(
                                                  image: widget.image,
                                                  name: widget.name,
                                                  price: widget.price,
                                                  color: widget.color,
                                                  size: 'L',
                                                ));
                                                Navigator.pushReplacement(
                                                    context,
                                                    AnimationTransition(
                                                        page:
                                                            const NavigationScreen()));
                                              },
                                              child: const Text(
                                                'Add To Cart',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontFamily: 'Ubuntu'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(

                      color: Constants.secondryColor,

                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

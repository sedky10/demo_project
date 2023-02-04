import 'package:demo_project/database/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../contatnts.dart';
import '../../database/dbhelper.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late DbHelper object;
  int counter = 1;

  void operation() {
    if (counter <= 1) {
      counter = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.thirdColor,
      appBar: AppBar(
        backgroundColor: Constants.thirdColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Your Cart'.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Ubuntu',
            color: Constants.primaryColor,
            fontSize: 20,
            letterSpacing: 1.5,
            wordSpacing: 1.3,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: FutureBuilder<List<Helper>>(
        future: DbHelper.instance.getAllTodo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  height: 480,
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 130,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  'http://${snapshot.data!.elementAt(index).image}',
                                  scale: .8,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      width: 150,
                                      child: Text(
                                        snapshot.data!.elementAt(index).name,
                                        style: TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Constants.primaryColor,
                                          fontSize: 15,
                                          letterSpacing: 1.5,
                                          wordSpacing: 1.3,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                  'Are You Sure You Want To Delete This Item ?',
                                                  style: TextStyle(
                                                    fontFamily: 'Ubuntu',
                                                    color:
                                                        Constants.primaryColor,
                                                    fontSize: 15,
                                                    letterSpacing: 1.5,
                                                    wordSpacing: 1.3,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                actions: [
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        shape:
                                                            const StadiumBorder(),
                                                        foregroundColor:
                                                            Constants
                                                                .primaryColor,
                                                        backgroundColor:
                                                            Constants
                                                                .secondryColor),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const Text(
                                                      'Cancel',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontFamily: 'Ubuntu'),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        shape:
                                                            const StadiumBorder(),
                                                        foregroundColor:
                                                            Constants
                                                                .primaryColor,
                                                        backgroundColor:
                                                            Constants
                                                                .forthcolor),
                                                    onPressed: () async {
                                                      await DbHelper.instance
                                                          .deleteTodo(int.parse(
                                                              snapshot.data!
                                                                  .elementAt(
                                                                      index)
                                                                  .id
                                                                  .toString()));
                                                      Navigator.pop(context);
                                                      setState(() {});
                                                    },
                                                    child: const Text(
                                                      'Sure',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontFamily: 'Ubuntu'),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline_rounded,
                                        color: Constants.forthcolor,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: RichText(
                                      text: TextSpan(
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Ubuntu',
                                              letterSpacing: 1.2,
                                              wordSpacing: 5,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                          //apply style to all
                                          children: [
                                        TextSpan(
                                          text: 'Color: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[400]),
                                        ),
                                        TextSpan(
                                          text: snapshot.data!
                                              .elementAt(index)
                                              .color,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Constants.secondryColor),
                                        ),
                                      ])),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 0),
                                  child: RichText(
                                      text: TextSpan(
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Ubuntu',
                                              letterSpacing: 1.2,
                                              wordSpacing: 5,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                          //apply style to all
                                          children: [
                                        TextSpan(
                                          text: 'size: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[400]),
                                        ),
                                        TextSpan(
                                          text: snapshot.data!
                                              .elementAt(index)
                                              .size,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Constants.secondryColor),
                                        ),
                                      ])),
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
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: Constants.secondryColor),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Text(
                                              counter.toString(),
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                color: Constants.primaryColor,
                                                fontSize: 15,
                                                letterSpacing: 1.5,
                                                wordSpacing: 1.3,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
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
                                          child: const Icon(
                                            Icons.remove,
                                            color: Constants.forthcolor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        '${snapshot.data!.elementAt(index).price.toString()} \$',
                                        style: const TextStyle(
                                          fontFamily: 'Ubuntu',
                                          color: Constants.forthcolor,
                                          fontSize: 15,
                                          letterSpacing: 1.5,
                                          wordSpacing: 1.3,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'total'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          color: Constants.primaryColor,
                          fontSize: 18,
                          letterSpacing: 1.5,
                          wordSpacing: 1.3,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '500 \$'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          color: Constants.forthcolor,
                          fontSize: 18,
                          letterSpacing: 1.5,
                          wordSpacing: 1.3,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        foregroundColor: Constants.primaryColor,
                        backgroundColor: Constants.secondryColor),
                    onPressed: () {},
                    child: Text(
                      'process to check out'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white, fontSize: 20, fontFamily: 'Ubuntu'),
                    ),
                  ),
                ),
              ],
            );
          }
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return CircularProgressIndicator(
            color: Constants.primaryColor,
          );
        },
      ),
    );
  }
}
/*
Text(
                                '${snapshot.data!.elementAt(index).price.toString()} \$',
                                style: const TextStyle(
                                  fontFamily: 'Ubuntu',
                                  color: Constants.forthcolor,
                                  fontSize: 10,
                                  letterSpacing: 1.5,
                                  wordSpacing: 1.3,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
 */

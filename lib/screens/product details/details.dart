import 'package:demo_project/Network/detailsAPI.dart';
import 'package:demo_project/models/details/details.dart';
import 'package:flutter/material.dart';

import '../../contatnts.dart';
import '../Home/Widgets/category.dart';
import 'Widgets/top.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late Details object;
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
                    return Container(
                      height: 390,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                    );
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  return CircularProgressIndicator(
                    color: Constants.secondryColor,
                  );
            }),
          ],
        ),
      ),
    );
  }
}

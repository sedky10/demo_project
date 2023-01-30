
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../contatnts.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key,this.price, this.name, this.image, this.id}) : super(key: key);
  final int? id;
  final double? price;
  final String? name;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: Image.network(
              'https://$image',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              name!,
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
              itemBuilder: (context, _) => const Icon(
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
               Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0),
                child: Text(
                  '$price \$',
                  style: const TextStyle(
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
    );
  }
}

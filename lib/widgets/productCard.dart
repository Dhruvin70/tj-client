import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imgUrl;
  final double price;
  final Function onTap;
  const ProductCard({super.key, required this.name, required this.imgUrl, required this.price, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(imgUrl,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: 150,
                ),
                const Positioned(
                  right: 5,
                  top: 5,
                  child: Icon(
                    CupertinoIcons.heart,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$$price",
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.black45
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

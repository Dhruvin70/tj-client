
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tjclient/controllers/purchaseController.dart';
import 'package:tjclient/model/product/product.dart';
import 'package:tjclient/pages/home.dart';

class ProductDescriptionPage extends StatelessWidget {
  const ProductDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PurchaseController purchaseController = Get.put(PurchaseController());

    Products product = Get.arguments['product'];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // IconButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(builder: (context) => const Home()));
              //   },
              //   icon: const Icon(Icons.arrow_back_ios),
              // ),
              Text(
                "Product Detail",
                style: GoogleFonts.openSans(),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(25),
                      child: Image.network(
                        product.imageurl
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white38,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    product.name,
                                    style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange.shade400,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    "\$${product.price}",
                                    style: GoogleFonts.openSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Material",
                                    style: GoogleFonts.openSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    product.material,
                                    style: GoogleFonts.openSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Weight in gm",
                                    style: GoogleFonts.openSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${product.weight}",
                                    style: GoogleFonts.openSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            product.description,
                            style: GoogleFonts.openSans(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: purchaseController.address,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Colors.red), // Change border color here
                              ),
                              labelText: 'Address',
                              // Changed from label to labelText
                              hintText: 'Address',
                            ),
                            maxLines: 3,
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
        bottomNavigationBar: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20),

           decoration: const BoxDecoration(
          color: Colors.white38,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            )
          ],
        ),
          child: Stack(
            children: [
              const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Your product details here
                  ],
                ),
              ),
              Positioned(
                top: 10,
                left: 20,
                right: 20,
                bottom: 10,
                child: ElevatedButton(
                  onPressed: () {
                    purchaseController.submitOrder(price: product.price, name: product.name, description: product.description);
                    purchaseController.initiatePayPalCheckout(context, price: product.price, name: product.name, description: product.description);
                    },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                    backgroundColor: Colors.orange.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

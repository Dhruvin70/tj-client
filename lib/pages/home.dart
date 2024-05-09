import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tjclient/controllers/homeController.dart';
import 'package:tjclient/controllers/logoutController.dart';
import 'package:tjclient/model/menu/menu.dart';
import 'package:tjclient/model/menu/menuModel.dart';
import 'package:tjclient/widgets/dropdown.dart';
import 'package:tjclient/widgets/multiselectdropdown.dart';
import 'package:tjclient/widgets/productCard.dart';

import '../controllers/googleController.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Logout logoutController = Get.put(Logout());
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      
      appBar: AppBar(
        leading: Icon(Icons.diamond_outlined),
        actions: [
          PopupMenuButton<MenuItem>(
            onSelected: (item) => onSelected(context, item),
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(2, 0, 5, 0),
            iconSize: 35,
            itemBuilder: (context) =>
            [
              ...MenuItems.itemsFirst.map(buildItem).toList(),
            ],
          )
        ],
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Products",
              style: GoogleFonts.openSans(),
            ),
          ],
        ),
      ),

      body: GetBuilder<HomeController>(builder: (homectrl) {
        return Column(
          children: [

            Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Flexible(
                      child: MultipleSelectDropDown(
                        items: const [
                          "AD",
                          "Marable",
                          "Copper",
                          "Brass",
                          "Gold",
                          "Silver",
                          "Platinum"
                        ],
                        onSelectItems: (selectedItems) {
                          print(selectedItems);
                          homectrl.filterByMetal(selectedItems);
                        },
                      )),
                  Flexible(
                      child: DropDownBtn(
                          items: const [
                            "Low to High",
                            "High to Low",
                          ],
                          selectedItemText: "Sort Items",
                          onSelected: (selectedValue) {
                            print(selectedValue);
                            homectrl.sortByPrice(ascending: selectedValue == "Low to High" ? true : false);
                          })),
                ],
              ),
            ),
            Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {homectrl.fetchProducts();},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                        itemCount: homectrl.productShowInUI.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 100,
                            height: 100,
                            child: ProductCard(
                              name: homectrl.productShowInUI[index].name,
                              imgUrl:
                              homectrl.productShowInUI[index].imageurl,
                              price: homectrl.productShowInUI[index].price,
                              onTap: () {

                                Navigator.pushNamed(
                                    context, '/product-description',arguments: {'product': homectrl.productShowInUI[index]});
                              },
                            ),
                          );
                        }),
                  ),
                )
            ) ,
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7, // Change itemCount to match the number of items
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(6),
                    child: Chip(
                      label: Image.network(
                        const [
                          "https://firebasestorage.googleapis.com/v0/b/jewellery-shop-254ec.appspot.com/o/images%2F160050C01_RGB.png?alt=media&token=9e652a6a-8421-4686-8744-958795ff5634",
                          "https://firebasestorage.googleapis.com/v0/b/jewellery-shop-254ec.appspot.com/o/images%2F161198C01_RGB.jpg?alt=media&token=cf73b381-cd6e-4a60-9005-2b86df53a352",
                          "https://firebasestorage.googleapis.com/v0/b/jewellery-shop-254ec.appspot.com/o/images%2F163100C01_RGB.png?alt=media&token=f7c4ceec-3fc4-4515-8565-f5564ef757b4",
                          "https://firebasestorage.googleapis.com/v0/b/jewellery-shop-254ec.appspot.com/o/images%2F160050C01_RGB.png?alt=media&token=9e652a6a-8421-4686-8744-958795ff5634",
                          "https://firebasestorage.googleapis.com/v0/b/jewellery-shop-254ec.appspot.com/o/images%2F192634C01_RGB.png?alt=media&token=9cb1f348-cc8a-402c-ad70-9bb5ed91f947",
                          "https://firebasestorage.googleapis.com/v0/b/jewellery-shop-254ec.appspot.com/o/images%2F193145C01_RGB.jpg?alt=media&token=87c91711-fc7f-4000-8958-5d313342e010",
                          "https://firebasestorage.googleapis.com/v0/b/jewellery-shop-254ec.appspot.com/o/images%2F193000C01_RGB.png?alt=media&token=0c13d395-f5ee-4107-8325-9f9ec2246cab"

                        ][index],
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        );
      }),
      // bottomNavigationBar: const NavigationBottom(),
    );
  }
}

PopupMenuItem<MenuItem> buildItem(MenuItem item) =>
    PopupMenuItem(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black, size: 25,),
            const SizedBox(width: 12,),
            Text(item.text, style: GoogleFonts.openSans(fontSize: 20),),
            const SizedBox(width: 20,),
          ],
        ));

void onSelected(BuildContext context, MenuItem item) {
  final GoogleSignInController googleSignInController = Get.put(GoogleSignInController());
  bool logoutRoute =  googleSignInController.googleSignIn;
  switch (item) {
    case MenuItems.itemLogout:
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirm Logout"),
            content: const Text("Are you sure you want to logout?"),
            actions: [
              GetBuilder<Logout>(builder: (ctrl) {
                return TextButton(

                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    // Perform logout
                    if(logoutRoute){
                      ctrl.logoutGoogle(context);
                    }
                    ctrl.logout(context);
                  },
                  child: const Text("Yes"),
                );
              }),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  // Cancel logout
                },
                child: const Text("No"),
              ),
            ],
          );
        },
      );
      break;
  // Handle other menu items if needed
  }
}

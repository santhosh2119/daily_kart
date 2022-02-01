import 'package:daily_kart/base/color_resources.dart';
import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/base/font_style.dart';
import 'package:daily_kart/providers/home_provider.dart';
import 'package:daily_kart/screens/categories/all_categories_screen.dart';
import 'package:daily_kart/screens/home/widgets/catergory_view.dart';
import 'package:daily_kart/screens/home/widgets/grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/widgets/carousle.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> drawerGlobalKey = GlobalKey();
   
  Future<void> _loadData(BuildContext context, bool reload) async {
    await Provider.of<HomeProvider>(context, listen: false)
        .getHome(context, false, "7140");

  }

  @override
  Widget build(BuildContext context) {
    _loadData(context, false);

    return Scaffold(
      backgroundColor: ColorResources.getBackgroundColor,
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<HomeProvider>(builder: (context, data, child) {
                return data.bannerimg.isNotEmpty
                    ? ImageSliderDemo(
                        imgList: data.bannerimg,
                      )
                    : data.categoryList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : ImageSliderDemo(imgList: data.bannerimg);
              }),

              const SizedBox(
                height: Dimensions.paddingSizeDefault,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All Categories",
                      style: poppinsBold.copyWith(
                          fontSize: Dimensions.fontSizeLarge)),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CoustomCategories()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                      child: Text('View All',
                          style: poppinsBold.copyWith(
                              fontSize: Dimensions.fontSizeLarge,
                              color: ColorResources.getHintColor)),
                    ),
                  ),
                ],
              ),
              Consumer<HomeProvider>(builder: (context, data, child) {
                return data.categoryList.isNotEmpty
                    ? const CategoryScreen()
                    : data.categoryList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : const CategoryScreen();
              }),
              Text("New  Arrivals",
                  style:
                      poppinsBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
              Consumer<HomeProvider>(builder: (context, data, child) {
                return data.newarrivalList.isNotEmpty
                    ? const CoustomGrid()
                    : data.newarrivalList.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : const CoustomGrid();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

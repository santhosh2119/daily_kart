import 'package:daily_kart/base/dimension.dart';
import 'package:daily_kart/providers/home_provider.dart';
import 'package:daily_kart/screens/home/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoustomGrid extends StatelessWidget {
  const CoustomGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Consumer<HomeProvider>(
        builder: (context, data, child) => data.newarrivalList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                itemCount: data.newarrivalList.length,
                padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1 / 1.3,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return ProductWidget(product: data.newarrivalList[index]);
                },
              ),
      ),
    );
  }
}

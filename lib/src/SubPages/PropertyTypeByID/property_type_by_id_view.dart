import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/SubPages/SearchPlaces/searchBar.dart';
import 'package:gleekey_user/src/SubPages/appBarWithTitleAndBack.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/widgets/property_widget.dart';
import '../../../widgets/Shimmer/property_shimmer.dart';
import 'property_type_by_id_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PropertyTypeByIdPage extends StatelessWidget {
  String name;
  int id;
  PropertyTypeByIdPage({super.key, required this.name, required this.id});

  PropertyTypeByIdController getController =
      Get.put(PropertyTypeByIdController());

  @override
  Widget build(BuildContext context) {
    getController.getApi(id, getController.offset, getController.limit);
    getController.id = id;
    getController.update();
    return Scaffold(
        backgroundColor: kWhite,
        appBar: AppBarWithTitleAndBack(title: name),
        body: GetBuilder<PropertyTypeByIdController>(
          initState: (_) {},
          builder: (_) {
            return Padding(
              padding:
                  const EdgeInsets.fromLTRB(pagePadding, 0, pagePadding, 8),
              child: Column(
                children: [
                  const SearchBarWidget(),
                  const SizedBox(
                    height: 15,
                  ),
                  GetBuilder<PropertyTypeByIdController>(
                    initState: (_) {},
                    builder: (_) {
                      return Flexible(
                          child: _.isDataLoaded
                              ? SmartRefresher(
                                  controller: _.refreshController,
                                  scrollController: _.controller,
                                  header: BezierHeader(
                                    child: Center(
                                      child: Icon(
                                        Icons.rocket,
                                        size: 62,
                                        color: Colors.black.withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                  onLoading: () {
                                    _.getApi(id, _.offset, _.limit);
                                  },
                                  onRefresh: () {
                                    _.getApi(id, 0, 4);
                                    // onRefresh != null ? onRefresh() : null;
                                  },
                                  enablePullUp: true,
                                  primary: false,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    controller: _.controller,
                                    itemCount: _.isExtraLoading
                                        ? _.properties.length + 1
                                        : _.properties.length,
                                    itemBuilder: ((context, index) {
                                      return index != _.properties.length
                                          ? Property(
                                              properties: _.properties[index])
                                          : _.isLast
                                              ? const SizedBox()
                                              : const Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Center(
                                                      child: SizedBox(
                                                          height: 30,
                                                          width: 30,
                                                          child:
                                                              CircularProgressIndicator())),
                                                );
                                    }),
                                  ))
                              : ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 24,
                                    );
                                  },
                                  itemCount: 3,
                                  itemBuilder: ((context, index) {
                                    return const PropertyShimmer();
                                  })));
                    },
                  ),
                  // GetBuilder<PropertyTypeByIdController>(
                  //   initState: (_) {},
                  //   builder: (_) {
                  //     return _.isExtraLoading
                  //         ? CircularProgressIndicator()
                  //         : SizedBox();
                  //   },
                  // )
                ],
              ),
            );
          },
        ));
  }
}

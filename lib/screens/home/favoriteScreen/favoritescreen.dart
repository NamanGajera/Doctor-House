import 'package:dr_house/controller/homeScreenController/homeScreen/homescreenController.dart';
import 'package:dr_house/utils/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/appbar/appbar.dart';
import '../../../utils/const/images.dart';
import '../../../utils/const/list.dart';
import '../../../utils/const/size.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Ncolor.lightCream,
        appBar: Nappbar.appbar('Favorites'),
        body: Padding(
          padding: const EdgeInsets.only(top: 8, right: 12, left: 12),
          child: SizedBox(
            height: Nsize.screenheight - MediaQuery.of(context).padding.top,
            width: double.infinity,
            child: controller.favorites.isNotEmpty
                ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: Nlist.doclist.length,
                    itemBuilder: (context, index) {
                      if (controller.favorites.keys
                          .toList()
                          .contains(Nlist.doclist[index]['id'])) {
                        return GestureDetector(
                          onTap: () {
                            controller.openDoctorDetails(
                              Nlist.doclist[index]['name'],
                              Nlist.doclist[index]['type'],
                              Nlist.doclist[index]['city'],
                              Nlist.doclist[index]['degree'],
                              Nlist.doclist[index]['details'],
                              Nlist.doclist[index]['id'],
                            );
                          },
                          child: Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            color: Ncolor.lightCream,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              height: Nsize.screenheight * 0.15,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  /// Doctor Image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image(
                                      image:
                                          const AssetImage(Nimages.docProfile),
                                      width: Nsize.screenwidth * 0.22,
                                      height: Nsize.screenheight * 0.2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 10),

                                  /// Doctor Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 5),

                                        /// Doctor Name
                                        Text(
                                          Nlist.doclist[index]['name'],
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        /// Doctor Type
                                        Text(
                                          Nlist.doclist[index]['type'],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Ncolor.lightblacktext,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        /// Location
                                        Row(
                                          children: [
                                            const Icon(
                                              Iconsax.location,
                                              size: 16,
                                              color: Ncolor.darkblue1,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              Nlist.doclist[index]['city'],
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Ncolor.lightblacktext,
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 8),

                                        /// Ratting
                                        Flexible(
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Iconsax.star,
                                                size: 20,
                                                color: Ncolor.darkblue1,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                Nlist.doclist[index]['ratting']
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: Ncolor.lightblacktext,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  /// Favorite Icon
                                  Container(
                                    alignment: Alignment.topCenter,
                                    child: Obx(
                                      () => IconButton(
                                        onPressed: () {
                                          setState(() {
                                            controller.toggelFavorites(
                                                Nlist.doclist[index]['id']);
                                          });
                                        },
                                        icon: Icon(
                                          controller.isFavorites(
                                                  Nlist.doclist[index]['id'])
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: controller.isFavorites(
                                                  Nlist.doclist[index]['id'])
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                : const Center(
                    child: Text(
                      'No Favorites Yet!',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 30,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

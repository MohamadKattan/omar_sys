import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';

import '../../../app_info.dart';
import '../../../size_config.dart';


class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double coverHeight = screenHeightMultiply(0.20, context);
    final double imageHeight = screenHeightMultiply(0.18, context);
    final double top = coverHeight - imageHeight / 2;
    return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.01),
        highlightColor: Colors.grey.withOpacity(0.3),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: imageHeight / 2),
                  width: double.infinity,
                  height: coverHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular($borderRadius.toDouble()),
                        bottomRight: Radius.circular($borderRadius.toDouble())),
                    color: checkDarkTheme(context.m)  ? $mainDarkColor : $mainColor,
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/cover_w.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                    child: Container(),
                  ),
                ),
                Positioned(
                    top: top,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.all(Radius.circular(imageHeight / 2 + 5)),
                          color: checkDarkTheme(context.m)  ? $profilePicDarkBackColor : $profilePicBackColor),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child:  CircleAvatar(
                          radius: imageHeight / 2,
                          backgroundImage:
                          const AssetImage('assets/images/profile.png'),
                          backgroundColor: checkDarkTheme(context.m)  ? $profilePicDarkBackColor : $profilePicBackColor,
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: screenHeightMultiply(0.03, context),
            ),
            Container(
              height: 10,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              height: screenHeightMultiply(0.01, context),
            ),
            Container(
              height: 10,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(
              height: screenHeightMultiply(0.01, context),
            ),
            Divider(
              thickness: 1,
              color: Colors.black.withOpacity(0.2),
            ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidthMultiply(0.06, context),right: screenWidthMultiply(0.06, context)),
              child: GestureDetector(
                onTap: (){
                  // MyApp.setLocale(context, const Locale('ar', ""));

                },
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeightMultiply(0.03, context),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                           const  Icon(Iconsax.bill,),
                            SizedBox(width: screenWidthMultiply(0.06, context),),
                            Container(
                              height: 12,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios)

                      ],
                    ),
                    SizedBox(
                      height: screenHeightMultiply(0.01, context),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidthMultiply(0.06, context),right: screenWidthMultiply(0.06, context)),
              child: GestureDetector(
                onTap: (){
                  // MyApp.setLocale(context, const Locale('ar', ""));

                },
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeightMultiply(0.03, context),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                           const  Icon(Iconsax.bill,),
                            SizedBox(width: screenWidthMultiply(0.06, context),),
                            Container(
                              height: 12,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios)

                      ],
                    ),
                    SizedBox(
                      height: screenHeightMultiply(0.01, context),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidthMultiply(0.06, context),right: screenWidthMultiply(0.06, context)),
              child: GestureDetector(
                onTap: (){
                  // MyApp.setLocale(context, const Locale('ar', ""));

                },
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeightMultiply(0.03, context),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                           const  Icon(Iconsax.bill,),
                            SizedBox(width: screenWidthMultiply(0.06, context),),
                            Container(
                              height: 12,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios)

                      ],
                    ),
                    SizedBox(
                      height: screenHeightMultiply(0.01, context),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidthMultiply(0.06, context),right: screenWidthMultiply(0.06, context)),
              child: GestureDetector(
                onTap: (){
                  // MyApp.setLocale(context, const Locale('ar', ""));

                },
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeightMultiply(0.03, context),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                           const  Icon(Iconsax.bill,),
                            SizedBox(width: screenWidthMultiply(0.06, context),),
                            Container(
                              height: 12,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios)

                      ],
                    ),
                    SizedBox(
                      height: screenHeightMultiply(0.01, context),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidthMultiply(0.06, context),right: screenWidthMultiply(0.06, context)),
              child: GestureDetector(
                onTap: (){
                  // MyApp.setLocale(context, const Locale('ar', ""));

                },
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeightMultiply(0.03, context),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                           const  Icon(Iconsax.bill,),
                            SizedBox(width: screenWidthMultiply(0.06, context),),
                            Container(
                              height: 12,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios)

                      ],
                    ),
                    SizedBox(
                      height: screenHeightMultiply(0.01, context),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: screenWidthMultiply(0.06, context),right: screenWidthMultiply(0.06, context)),
              child: GestureDetector(
                onTap: (){
                  // MyApp.setLocale(context, const Locale('ar', ""));

                },
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeightMultiply(0.03, context),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                           const  Icon(Iconsax.bill,),
                            SizedBox(width: screenWidthMultiply(0.06, context),),
                            Container(
                              height: 12,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios)

                      ],
                    ),
                    SizedBox(
                      height: screenHeightMultiply(0.01, context),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ));
  }
}


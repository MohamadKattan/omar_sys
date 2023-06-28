
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import '../app_info.dart';
import '../models/course_models.dart';
import '../size_config.dart';
import 'cahed_images.dart';
import 'courses_card_live_marker.dart';


class EnrolledCourseCard extends StatelessWidget {
  final VoidCallback? function;

  final CourseModel course;
  final double size;
  final bool isLive;
  const EnrolledCourseCard(
      {Key? key,
        required this.course,
        required this.size,
        required this.isLive,  this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) =>  LectureListPage(courseSlug: course.slug,courseName:course.title ,),
          //     ) );
        },
        child: SizedBox(
          width: screenWidthMultiply(size, context),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black12.withOpacity(0.2)),
                          // color: Colors.yellow.withOpacity(0.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.01),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidthMultiply(0.25, context),
                        child: AspectRatio(
                          aspectRatio:  1,
                          child: Stack(
                            key: key,
                            children: [
                              AspectRatio(
                                aspectRatio:  1,
                                child: CachedImageWidget(
                                  imageUrl: course.imageUrl,
                                  width: 100,
                                ),
                              ),
                              if (isLive) const LiveMarker(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidthMultiply(0.05, context),),
                      SizedBox(
                        width: screenWidthMultiply(0.55, context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),

                            Text(
                              course.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: screenWidthDivided(25, context)),
                            ),
                            if (!isLive)
                              const SizedBox(
                                height: 8,
                              ),
                            if (!isLive)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    course.ratingValue,
                                    style:
                                    TextStyle(fontSize: screenWidthDivided(40, context)),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  RatingBar.builder(
                                    ignoreGestures: true,
                                    initialRating: double.parse(course.ratingValue),
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 15,
                                    itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                ],
                              ),
                            const SizedBox(
                              height: 8,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: checkDarkTheme(context.m)  ? $mainDarkColor : $mainColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular($borderRadius.toDouble())),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: screenWidthDivided(25, context),
                                      right: screenWidthDivided(25, context),
                                      top: screenWidthDivided(35, context),
                                      bottom: screenWidthDivided(35, context),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Iconsax.play,
                                          color: Colors.white,
                                          size: screenWidthDivided(25, context),
                                        ),
                                        SizedBox(
                                          width: screenWidthDivided(60, context),
                                        ),
                                        Text(
                                          context.t!.courseContinue,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenWidthDivided(35, context)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    ' ${context.t!.completedPercent} ${course.completedPercent} %',
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: LinearProgressIndicator(
                        value: double.parse(course.completedPercent!) / 100,
                        backgroundColor: Colors.redAccent.shade100.withOpacity(0.1),
                        color: Colors.green,
                        minHeight: 7,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

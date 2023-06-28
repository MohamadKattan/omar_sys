import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/size_config.dart';
import '../models/course_models.dart';
import 'cahed_images.dart';
import 'courses_card_live_marker.dart';
import 'live_course_date.dart';

class CoursesCard extends StatelessWidget {
  final VoidCallback? function;

  final CourseModel course;
  final double size;
  final bool isLive;
  const CoursesCard(
      {Key? key,
      required this.course,
      required this.size,
      required this.isLive,  this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => SingleCoursePage(course: course,function: function,),
        //     ) );
      },
      child: SizedBox(
        width: screenWidthMultiply(size, context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 2 / 1,
                child: Stack(
                  key: key,
                  children: [
                    AspectRatio(
                      aspectRatio: 2 / 1,
                      child: CachedImageWidget(
                        imageUrl: course.imageUrl,
                        width: 250,
                      ),
                    ),
                    if (isLive) const LiveMarker(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                course.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidthDivided(25, context)),
              ),
              const SizedBox(
                height: 8,
              ),
              // Text(
              //   course.category ,
              //   style: TextStyle(fontSize: screenWidthDivided(40, context)),
              // ),
              // if (!isLive)
              //   const SizedBox(
              //     height: 8,
              //   ),
              // if (isLive)
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${course.salePrice} ${$currency}',
                        style: TextStyle(
                          fontSize: screenWidthDivided(25, context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Text(
                        '${course.price} ${$currency}',

                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.red,
                          fontSize: screenWidthDivided(35, context),
                          fontWeight: FontWeight.w600,
                          fontFamily: "Muli",
                        ),
                      ),
                    ],
                  ),

                ],
              ),
              const SizedBox(
                height: 8,
              ),
              if (isLive) LiveCourseDate(course:course),

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:omar_system/controllers/call_records_controller.dart';
import 'package:omar_system/size_config.dart';
import '../views/sections_page/sections_show_page/sections_show_page.dart';
import 'main_card.dart';
import 'section_card_info.dart';

class SectionsCards extends StatelessWidget {
  const SectionsCards({
    super.key,
    required this.title,
    required this.id,
    required this.totalNumber,
    required this.department,
    required this.followNumber,
    required this.pendingNumber,
    required this.waitingNumber,
  });

  final String id;
  final String title;
  final String totalNumber;
  final String department;
  final String followNumber;
  final String pendingNumber;
  final String waitingNumber;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // SectionsShow
        recordsData.name = '';
        recordsData.nameType = 'name';
        recordsData.customerStatus = '';
        recordsData.phoneStatus = '';
        recordsData.finalStatus = '';

        Navigator.push(context, MaterialPageRoute(
          builder: (context) =>
              SectionsShow(catId: id,catName: title,),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Text(
            //   title,
            //   style: const TextStyle(fontSize: 24),
            // ),
            MainCard(
              color: Colors.white,
              cardChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                totalNumber.toString(),
                                style:const  TextStyle(fontSize: 28,color: Colors.orange,),
                                // style: kSectionNumbersStyle,
                              ),
                              const SizedBox(width: 15,),
                              SizedBox(
                                width: screenWidthMultiply(0.55, context),
                                child: Text(
                                  department,
                                  style:const  TextStyle(fontSize: 16,fontWeight: FontWeight.w700),

                                  // style: kSectionTextStyle,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.black, //color of divider
                      height: 1, //height spacing of divider
                      thickness: 1, //thickness of divier line
                      indent: 25, //spacing at the start of divider
                      endIndent: 25, //spacing at the end of divider
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SectionCardInfo(
                            followNumber: followNumber,
                            labelText: 'Today’s Follow',
                          ),
                          SectionCardInfo(
                            followNumber: followNumber,
                            labelText: 'Pending',
                          ),
                          SectionCardInfo(
                            followNumber: followNumber,
                            labelText: 'Waiting',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

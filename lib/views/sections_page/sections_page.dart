import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/controllers/sections_controller.dart';
import 'package:search_page/search_page.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../controllers/user_controller.dart';
import '../../models/sections_models.dart';
import '../../services/provider.dart';
import '../../size_config.dart';
import '../../widgets/main_card.dart';
import '../../widgets/section_cards.dart';
import '../../widgets/title_widget.dart';



class SectionsPage extends StatefulWidget {
  final VoidCallback?  function;

  const SectionsPage({Key? key, this.function}) : super(key: key);

  @override
  State<SectionsPage> createState() => _SectionsPageState();
}

class _SectionsPageState extends State<SectionsPage> {

  refresh() {
    setState(() {});
  }

  @override
  void initState() {

    if(riverpod.read(sectionFirstOpen.notifier).state){
      sections.getHome().then((v) {
        if (userController.hasErr) {
          widget.function!();
          refresh();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.t!.weHaveProblem)));
        } else {

        widget.function!=null?widget.function!():null;
        if(!mounted)return;
          refresh();
          setState(() {
            riverpod.read(sectionFirstOpen.notifier).state = false;
          });
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8),
      child: RefreshIndicator(
        onRefresh: () async {
          sections.getHome().then((v) {
            if (sections.hasErr) {
              widget.function!();
              refresh();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.t!.weHaveProblem)));
            } else {
              widget.function!();
              refresh();
            }
          });
          return Future<void>.delayed(
              const Duration(milliseconds: 1500));
        },
        child: ListView(
          children: [
            SizedBox(  height: screenHeightMultiply(0.02, context),  ),

            StickyHeader(
              header: Container(
                color: checkDarkTheme(context.m)? Colors.black:Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleWidget(  title: 'Sections', haveBorder: false, ),
                      if (sections.data != null)

                        GestureDetector(
                          onTap: ()=> showSearch(
                            context: context,
                            delegate: SearchPage<SectionsModel>(
                              items: sections.sections,
                              searchLabel: "search",
                              searchStyle: const TextStyle(color: $textColor),
                              suggestion:const Center(
                                child:  Text("search by Section Name"),
                              ),
                              failure: const Center(
                                child: Text('no result'),
                              ),
                              filter: (person) => [
                                person.title,
                                // person.address,
                                // person.numberFund.toString(),
                              ],
                              builder: (sections) =>
                                  MainCard(
                                    color: checkDarkTheme(context.m)
                                        ? Colors.black
                                        : const Color(0xFFD3D3D3),
                                   cardChild : SectionsCards(
                                     id: sections.id,
                                      title: sections.title,
                                      totalNumber: sections.callRecordCount,
                                      department: sections.title,
                                      followNumber: sections.dayFollow,
                                      pendingNumber: sections.dayFollow2,
                                      waitingNumber: sections.dayFollow3,
                                    ),
                                  ),

                            ),
                          ),
                          child: const Icon(Icons.search_rounded),
                        )
                    ],
                  ),
                ),
              ),
              content: Column(
                children: [
                  // if (sections.isLoading && !sections.hasErr)
                  //   const InCardShimmer(listLength: 9,),
                  if (sections.data != null)
                    SizedBox(height: screenHeightMultiply(0.02, context),),

                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:  sections.sections.length,
                      itemBuilder: (context, index) {
                        return    SectionsCards(
                          id: sections.sections[index].id,
                          title: sections.sections[index].title,
                          totalNumber: sections.sections[index].callRecordCount,
                          department: sections.sections[index].title,
                          followNumber: sections.sections[index].dayFollow,
                          pendingNumber: sections.sections[index].dayFollow2,
                          waitingNumber: sections.sections[index].dayFollow3,);
                      }),


                ],
              ),

            ),






            SizedBox(height: screenHeightMultiply(0.03, context),),

          ],
        ),
      ),
    );
  }
}

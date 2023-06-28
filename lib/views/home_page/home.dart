import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/size_config.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:omar_system/views/errors/no_data.dart';
import 'package:omar_system/views/errors/server_error.dart';
import 'package:omar_system/views/home_page/components/home_shimmer.dart';
import '../../controllers/home_controller.dart';
import '../../services/provider.dart';
import '../../widgets/card_info.dart';
import '../../widgets/customer_card.dart';
import '../../widgets/home_routes_btn.dart';
import '../../widgets/main_card.dart';
import '../../widgets/personal_card.dart';

class HomeWidget extends StatefulWidget {
  final VoidCallback? function;
  final Function? cahngePage;

  const HomeWidget({Key? key, this.function, this.cahngePage}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with AutomaticKeepAliveClientMixin {
  refresh() {
    setState(() {});
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  IconData greetingIcons() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return Icons.sunny;
    }
    if (hour < 17) {
      return Icons.sunny_snowing;
    }
    return Icons.nights_stay_outlined;
  }

  ColorSwatch<int> greetingIconsColors() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return Colors.yellow;
    }
    if (hour < 17) {
      return Colors.yellow;
    }
    return Colors.grey;
  }

  @override
  void initState() {
    super.initState();

    if (riverpod.read(homeFirstOpen.notifier).state) {
      homeController.getHome().then((v) {
        if (homeController.hasErr) {
          refresh();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(context.t!.weHaveProblem)));
        } else {
          refresh();
          setState(() {
            riverpod.read(homeFirstOpen.notifier).state = false;
          });

        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DoubleBack(
      message: context.t!.againToExit,
      child: KeyboardDismisser(
        child: Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   key: const Key('home'),
          //   onPressed: () async {
          //     var whatsappAndroid =
          //         Uri.parse("https://api.whatsapp.com/send?phone=905415317871");
          //     if (await canLaunchUrl(whatsappAndroid)) {
          //       await launchUrl(whatsappAndroid,
          //           mode: LaunchMode.externalApplication);
          //     } else {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           backgroundColor: Colors.black,
          //           content: Text(
          //             context.t!.somethingsWrong,
          //             textAlign: TextAlign.center,
          //             style: const TextStyle(color: Colors.white),
          //           ),
          //         ),
          //       );
          //     }
          //   },
          //   backgroundColor: Colors.black,
          //   child: const Icon(
          //     Icons.call,
          //     color: Colors.white,
          //   ),
          // ),
          body: SizedBox(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 650),
                child: Column(
                  children: [
                    // AppBarSearch(
                    //   function: widget.function,
                    // ),
                    if (homeController.hasErr) const ServerError(),
                    if (homeController.isLoading)
                      Expanded(
                          child: ListView(
                        children: const [
                          HomeShimmer(),
                        ],
                      )),
                    if (!homeController.isLoading && !homeController.hasErr)
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            homeController.getHome().then((v) {
                              if (homeController.hasErr) {
                                refresh();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text(context.t!.weHaveProblem)));
                              } else {
                                refresh();
                              }
                            });
                            return Future<void>.delayed(
                                const Duration(milliseconds: 1500));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidthMultiply(0.00, context)),
                            child: ListView(
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                if (homeController.user != null)
                                  PersonalCard(
                                    image: homeController.user!.avatarUrl!,
                                    name: homeController.user!.name,
                                    title: homeController.user!.jobTitle != null
                                        ? homeController.user!.jobTitle!
                                        : "__",
                                    day: greeting(),
                                    icon: greetingIcons(),
                                    iconColor: greetingIconsColors(),
                                  ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    'Target\'s',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      // $oneDayEffort + $newOnDay - $effortAgentDay
                                      Expanded(
                                        child: MainCard(
                                          color: Colors.white,
                                          cardChild: CardInfo(
                                            cardTitle: 'Daily Target',
                                            percent:
                                                homeController.data['present'],
                                            color: homeController.data['present'] <= 84 ? Colors.red : Colors.green,
                                            performance:  homeController.data['percentMonthly'] <= 84 ? 'Bad Performance' : "Excellent",
                                            performanceStatus: 'Keep Going',
                                            remainingCalls: (homeController.data['oneDayEffort'] + homeController.data['newOnDay']  - homeController.data['effortAgentDay']).toString(),
                                            newCalls: homeController.data['effortAgentDay'].toString(),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: MainCard(
                                          color: Colors.white,
                                          cardChild: CardInfo(
                                            cardTitle: 'Monthly Target',
                                            percent: homeController
                                                .data['percentMonthly'],
                                            performance:  homeController.data['percentMonthly'] <= 84 ? 'Bad Performance' : "Excellent",
                                            color: homeController.data['percentMonthly'] <= 84 ? Colors.red : Colors.green,

                                            performanceStatus: 'Keep Going',
                                            remainingCalls: (int.parse(
                                                        homeController.data[
                                                            'effort_num']) -
                                                    homeController.data[
                                                        'effortAgentMonth'])
                                                .toString(),
                                            newCalls: homeController
                                                .data['effortAgentMonth']
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            HomeRoutesBtn(
                                              icon: Icons.library_books_sharp,
                                              title: "Sections",
                                              func: (){
                                                widget.cahngePage!(1);
                                              },
                                            ),
                                            HomeRoutesBtn(
                                              icon: Iconsax.profile_2user,
                                              title: "Attendance",
                                              func: (){
                                                widget.cahngePage!(2);

                                              },
                                            ),


                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            HomeRoutesBtn(
                                              icon: Icons.attach_money,
                                              title: "Billing",
                                              func: (){
                                                widget.cahngePage!(3);

                                              },
                                            ),
                                            // HomeRoutesBtn(
                                            //   icon: Icons.stacked_bar_chart_sharp,
                                            //   title: "Report",
                                            //   func: (){
                                            //     widget.cahngePage!(4);
                                            //
                                            //   },
                                            // ),
                                            HomeRoutesBtn(
                                              icon: Iconsax.profile_circle,
                                              title: context.t!.account,
                                              func: (){
                                                widget.cahngePage!(4);

                                              },
                                            ),

                                          ],
                                        ),
                                      ],
                                    ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text(
                                          'Today Follows up',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),

                                      if(homeController.callRecords.isEmpty)
                                        const NoFollowUpData(),
                                      if(homeController.callRecords.isNotEmpty)

                                        // ListView.builder(
                                        //     shrinkWrap: true,
                                        //     physics: const NeverScrollableScrollPhysics(),
                                        //     itemCount:  recordsData.callRecords.length,
                                        //     itemBuilder: (context, index) {
                                        //       return ;
                                        //     }),
                                      ListView.builder(
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount:  homeController.callRecords.length,
                                            itemBuilder: (context, index) {
                                              return MainCard(
                                                color: checkDarkTheme(context.m)
                                                    ? Colors.black
                                                    : const Color(0xFFD3D3D3),
                                                cardChild: CustomerCard(
                                                  date: homeController
                                                      .callRecords[index].updatedAt,
                                                  dateOfVisits: homeController
                                                      .callRecords[index].dateOfVists,
                                                  dateOfCall: homeController
                                                      .callRecords[index].dateOfCall,
                                                  customerName: homeController
                                                      .callRecords[index].name,
                                                  agent: homeController
                                                      .callRecords[index].agent!.name,
                                                  agentImg: homeController
                                                      .callRecords[index]
                                                      .agent!
                                                      .avatarUrl,
                                                  email: homeController
                                                      .callRecords[index].email,
                                                  finalResults: homeController
                                                      .callRecords[index]
                                                      .finalResults,
                                                  phone: homeController
                                                      .callRecords[index].phone,
                                                  city: homeController
                                                      .callRecords[index].city,
                                                  phoneStatus: homeController
                                                      .callRecords[index].phoneStatus,
                                                  status: homeController
                                                      .callRecords[index]
                                                      .customerStatus,
                                                ),
                                              );
                                            }),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding:  EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 25),
                                  child: Text(
                                    'Task\'s',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                if(homeController.data['Tasks'].isEmpty)
                                  const Center(child: Text('No Tasks ....')),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 25),
                                  child: Accordion(
                                    paddingListHorizontal: 0,
                                    contentBackgroundColor: checkDarkTheme(context.m)
                                        ? $AccordionContentDarkBackgroundColor
                                        : $AccordionContentBackgroundColor,
                                    maxOpenSections: 2,
                                    leftIcon: const Icon(Iconsax.book, color: Colors.white),
                                    children: [

                                      ...List.generate(
                                        homeController.data['Tasks'].length,
                                            (index) => AccordionSection(
                                          headerBorderRadius: $borderRadius / 2.toDouble(),
                                          index: index,
                                          headerPadding: const EdgeInsets.all(15),
                                          headerBackgroundColor:
                                          checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                                          contentBorderColor:
                                          checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
                                          // isOpen: inDrawer
                                          //     ? true
                                          //     : index == 0
                                          //     ? true
                                          //     : false,
                                          header: Text(homeController.data['Tasks'][index]['title'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: MediaQuery.of(context).size.width / 25)),
                                          content: Column(
                                            children: [
                                            Text(homeController.data['Tasks'][index]['content']),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )



                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

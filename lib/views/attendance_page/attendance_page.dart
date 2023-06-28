import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/controllers/sections_controller.dart';
import 'package:search_page/search_page.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../controllers/attendance_controller.dart';
import '../../models/attendance_models.dart';
import '../../services/provider.dart';
import '../../size_config.dart';
import '../../widgets/attendance_card.dart';
import '../../widgets/main_card.dart';

import '../../widgets/title_widget.dart';

class AttendancePage extends StatefulWidget {
  final VoidCallback? function;

  const AttendancePage({Key? key, this.function}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  refresh() {
    setState(() {});
  }

  @override
  void initState() {
    if (riverpod.read(attendFirstOpen.notifier).state) {
      attendance.getHome().then((v) {
        if (attendance.hasErr) {
          widget.function!();
          refresh();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(context.t!.weHaveProblem)));
        } else {
          widget.function != null ? widget.function!() : null;
          if(!mounted)return;
          refresh();
          setState(() {
            riverpod.read(attendFirstOpen.notifier).state = false;
          });
        }
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: RefreshIndicator(
        onRefresh: () async {
          attendance.getHome().then((v) {
            if (attendance.hasErr) {
              widget.function!();
              refresh();
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(context.t!.weHaveProblem)));
            } else {
              widget.function!();
              refresh();
            }
          });
          return Future<void>.delayed(const Duration(milliseconds: 1500));
        },
        child: ListView(
          children: [
            SizedBox(
              height: screenHeightMultiply(0.02, context),
            ),
            StickyHeader(
              header: Container(
                color: checkDarkTheme(context.m) ? Colors.black : Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitleWidget(
                        title: 'Attendance',
                        haveBorder: false,
                      ),
                      if (sections.data != null)
                        GestureDetector(
                          onTap: () => showSearch(
                            context: context,
                            delegate: SearchPage<AttendanceModel>(
                              items: attendance.attendance,
                              searchLabel: "search",
                              searchStyle: const TextStyle(color: $textColor),
                              suggestion: const Center(
                                child: Text(
                                    "search by Section Name, Email, Phone or City"),
                              ),
                              failure: const Center(
                                child: Text('no result'),
                              ),
                              filter: (person) => [
                                person.attend!.name,
                                person.attend!.email,
                                person.attend!.phone,
                                person.attend!.city,
                              ],
                              builder: (attendance) => MainCard(
                                color: checkDarkTheme(context.m)
                                    ? Colors.black
                                    : const Color(0xFFD3D3D3),
                                cardChild: AttendanceCard(
                                  date: attendance.updatedAt,
                                  dateOfVisits: attendance.updatedAt,
                                  serial: attendance.order!.serial!,
                                  agent: attendance.user!.name,
                                  agentImg: attendance.user!.avatarUrl,

                                  customerName: attendance.attend != null
                                      ? attendance.attend!.name
                                      : "",
                                  email: attendance.attend != null
                                      ? attendance.attend!.email
                                      : "",
                                  phone: attendance.attend != null
                                      ? attendance.attend!.phone
                                      : "",
                                  city: attendance.attend != null
                                      ? attendance.attend!.city
                                      : "",
                                  // city: orders.orders![index].attend!=null ? orders.orders![index].attend!.user :"",

                                  bookStatus: attendance.delivery!,
                                  shippingStatus: attendance.shipping!,

                                  remaining: attendance.order!.paymentPay!,
                                  total: attendance.order!.total!,
                                  status: attendance.order!.status!,
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
                  // if (attendance.isLoading && !attendance.hasErr)
                  //   const InCardShimmer(listLength: 9,),

                  if (!attendance.isLoading &&
                      !attendance.hasErr &&
                      attendance.attendance.isNotEmpty)
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: attendance.attendance.length,
                        itemBuilder: (context, index) {
                          return MainCard(
                            color: checkDarkTheme(context.m)
                                ? Colors.black
                                : const Color(0xFFD3D3D3),
                            cardChild: AttendanceCard(
                              date: attendance.attendance[index].updatedAt,
                              dateOfVisits:
                                  attendance.attendance[index].updatedAt,
                              serial: attendance.attendance[index].order != null
                                  ? attendance.attendance[index].order!.serial!
                                  : '',
                              agent: attendance.attendance[index].user!.name,
                              agentImg:
                                  attendance.attendance[index].user!.avatarUrl,

                              customerName:
                                  attendance.attendance[index].attend != null
                                      ? attendance
                                          .attendance[index].attend!.name
                                      : "",
                              email: attendance.attendance[index].attend != null
                                  ? attendance.attendance[index].attend!.email
                                  : "",
                              phone: attendance.attendance[index].attend != null
                                  ? attendance.attendance[index].attend!.phone
                                  : "",
                              city: attendance.attendance[index].attend != null
                                  ? attendance.attendance[index].attend!.city
                                  : "",
                              // city: orders.orders![index].attend!=null ? orders.orders![index].attend!.user :"",

                              bookStatus:
                                  attendance.attendance[index].delivery!,
                              shippingStatus:
                                  attendance.attendance[index].shipping!,

                              remaining:
                                  attendance.attendance[index].order != null
                                      ? attendance
                                          .attendance[index].order!.paymentPay!
                                      : '',
                              total: attendance.attendance[index].order != null
                                  ? attendance.attendance[index].order!.total!
                                  : '',
                              status: attendance.attendance[index].order != null
                                  ? attendance.attendance[index].order!.status!
                                  : '',
                            ),
                          );
                        }),
                ],
              ),
            ),
            SizedBox(
              height: screenHeightMultiply(0.03, context),
            ),
          ],
        ),
      ),
    );
  }
}

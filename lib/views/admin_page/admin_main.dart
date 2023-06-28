//  this page for admin panel
import 'package:flutter/material.dart';
import 'package:omar_system/views/admin_page/pages/agents_report.dart';
import 'package:omar_system/views/admin_page/pages/billing_report.dart';
import 'package:omar_system/views/admin_page/pages/commision_report.dart';
import 'package:omar_system/views/admin_page/pages/effort_report.dart';
import 'package:omar_system/views/admin_page/pages/home_page.dart';
import 'package:provider/provider.dart';

import '../../services/provider.dart';
import '../home_page/components/home_shimmer.dart';
import 'componen/app_bar.dart';
import 'componen/date_fillter.dart';
import 'componen/nav_bar.dart';

class AdminMainPage extends StatefulWidget {
  static String routeName = "/admin-main";
  const AdminMainPage({super.key});

  @override
  State<AdminMainPage> createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  PageController? controllerView;
  int? indexCatId;
  @override
  void initState() {
    controllerView = PageController(
        initialPage: context.read<ProviderListiner>().indexPageView);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // databaseHelper.adminCallRecordReport(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    controllerView!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: adminAppBar(
            context: context,
            voidCallback: () {
              context.read<ProviderListiner>().lisOfTitleCat.length < 2
                  ? const SizedBox()
                  : showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return openFillterDailoge(context, indexCatId);
                      });
            },
          ),
          body: Consumer<ProviderListiner>(
            builder: (BuildContext context, value, Widget? child) {
              if (value.allReportInfo.users == null) {
                return SizedBox(
                  child: ListView(
                    children: const [
                      HomeShimmer(),
                    ],
                  ),
                );
              } else {
                return PageView(
                  controller: controllerView,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    homePage(context, controllerView),
                    agentsReportsPage(context),
                    billingReportPage(context),
                    commisionReport(context),
                    effortReport(context)
                  ],
                );
              }
            },
          ),
          bottomNavigationBar: navBar(context, controllerView)),
    );
  }
}

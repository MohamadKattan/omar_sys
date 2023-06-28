import 'package:flutter/material.dart';
import 'package:omar_system/app_info.dart';
import 'package:omar_system/controllers/order_controller.dart';
import 'package:search_page/search_page.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import '../../models/order_models.dart';
import '../../services/provider.dart';
import '../../size_config.dart';
import '../../widgets/main_card.dart';
import '../../widgets/orders_card.dart';
import '../../widgets/title_widget.dart';



class BillingPage extends StatefulWidget {
  final VoidCallback?  function;

  const BillingPage({Key? key, this.function}) : super(key: key);

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {

  refresh() {
    setState(() {});
  }

  @override
  void initState() {

    if(riverpod.read(billingFirstOpen.notifier).state){
      orders.getHome().then((v) {
        if (orders.hasErr) {
          widget.function!();
          refresh();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(context.t!.weHaveProblem)));
        } else {
          widget.function!=null? widget.function!():null;
          if(!mounted)return;
          refresh();
          setState(() {
            riverpod.read(billingFirstOpen.notifier).state = false;
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
          orders.getHome().then((v) {
            if (orders.hasErr) {
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
                      const TitleWidget(  title: 'Billing', haveBorder: false, ),

                        GestureDetector(
                          onTap: ()=> showSearch(
                            context: context,
                            delegate: SearchPage<OrderModel>(
                              items: orders.orders!,
                              searchLabel: "search",
                              searchStyle: const TextStyle(color: $textColor),
                              suggestion:const Center(
                                child:  Text("search by Section Name"),
                              ),
                              failure: const Center(
                                child: Text('no result'),
                              ),
                              filter: (person) => [
                                person.user!.name,
                                person.user!.phone,
                                person.user!.email,
                                // person.address,
                                // person.numberFund.toString(),
                              ],
                              builder: (orders) =>
                                  MainCard(
                                    color: checkDarkTheme(context.m)
                                        ? Colors.black
                                        : const Color(0xFFD3D3D3),
                                    cardChild: OrdersCard(
                                      date: orders.updatedAt,
                                      dateOfVisits: orders.updatedAt,
                                      serial: orders.serial,
                                      agent: orders.user!.name,
                                      agentImg:orders.user!.avatarUrl,

                                      customerName: orders.attend!=null ? orders.attend!.name :"",
                                      email: orders.attend!=null ? orders.attend!.email :"",
                                      phone: orders.attend!=null ? orders.attend!.phone :"",
                                      city: orders.attend!=null ? orders.attend!.city :"",
                                      // city: orders.orders![index].attend!=null ? orders.orders![index].attend!.city :"",

                                      remaining: orders.rests,
                                      total: orders.total,

                                      status: orders.status,
                                      payment: orders.payment,
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
                  // if (orders.isLoading && !orders.hasErr)
                  //   const InCardShimmer(listLength: 9,),
                  if (orders.orders != null)
                    SizedBox(height: screenHeightMultiply(0.02, context),),
                  if (orders.orders != null)
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:  orders.orders!.length,
                      itemBuilder: (context, index) {
                        return  MainCard(
                          color: checkDarkTheme(context.m)
                              ? Colors.black
                              : const Color(0xFFD3D3D3),
                          cardChild: OrdersCard(
                            date: orders.orders![index].updatedAt,
                            dateOfVisits: orders.orders![index].updatedAt,
                            serial: orders.orders![index].serial,
                            agent: orders.orders![index].user!.name,
                            agentImg:orders.orders![index].user!.avatarUrl,

                            customerName: orders.orders![index].attend!=null ? orders.orders![index].attend!.name :"",
                            email: orders.orders![index].attend!=null ? orders.orders![index].attend!.email :"",
                            phone: orders.orders![index].attend!=null ? orders.orders![index].attend!.phone :"",
                            city: orders.orders![index].attend!=null ? orders.orders![index].attend!.city :"",
                            // city: orders.orders![index].attend!=null ? orders.orders![index].attend!.city :"",

                            remaining: orders.orders![index].rests,
                            total: orders.orders![index].total,

                            status: orders.orders![index].status,
                            payment: orders.orders![index].payment,
                          ),
                        );
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

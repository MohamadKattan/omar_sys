import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:omar_system/services/functions.dart';
import '../app_info.dart';
import '../size_config.dart';

class AttendanceCard extends StatefulWidget {
  final String? date;
  final String? dateOfVisits;
  final String? serial;
  final String? customerName;
  final String? agent;
  final String? agentImg;
  final String? email;
  final String? phone;
  final String? city;
  final String? status;
  final String? bookStatus;
  final String? shippingStatus;
  final String? remaining;

  final String? total;
  const AttendanceCard({
    Key? key,
    this.date,
    this.dateOfVisits,
    this.serial,
    this.customerName,
    this.agent,
    this.email,
    this.phone,
    this.city,
    this.status,
    this.remaining,
    this.total,
    this.bookStatus,
    this.shippingStatus,
    this.agentImg,
  }) : super(key: key);

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('DATE', style: cardMainTextStyle),
                        if(widget.date != "null")
                        Text(functions.getDateString(widget.date!) ,style: TextStyle(color:checkDarkTheme(context.m)?Colors.green:Colors.green,fontWeight: FontWeight.w600 ),),
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Serial', style: cardMainTextStyle),
                        if(widget.serial != "null")
                        Text(widget.serial!),

                      ],
                    ),
                   const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Status',
                          style: cardMainTextStyle,
                        ),
                          Text(widget.status!),

                      ],
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: const [
                       Icon(
                        FontAwesomeIcons.userCheck,
                        color: Colors.orange,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const Text('CUSTOMER', style: cardMainTextStyle),
                  const SizedBox(height: 10,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Name',
                        style: subCardMainTextStyle,
                      ),
                      const  SizedBox(width: 10,),
                      SizedBox(
                          width:screenWidthMultiply(0.45, context),
                          child: Text(widget.customerName!)),

                    ],
                  ),
                  const SizedBox(height: 5,),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     const Text(
                  //       'City',
                  //       style: subCardMainTextStyle,
                  //     ),
                  //     const  SizedBox(width: 10,),
                  //     Text(widget.city!),
                  //   ],
                  // ),
                  // const SizedBox(height: 5,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Phone',
                        style: subCardMainTextStyle,
                      ),
                      const  SizedBox(width: 10,),
                      SizedBox(
                          width:screenWidthMultiply(0.45, context),
                          child: Text(widget.phone!,textDirection: TextDirection.ltr,)
                        ,),
                    ],
                  ),
                  // const SizedBox(height: 5,),
                  //
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //
                  //   children: [
                  //     const Text(
                  //       'Email',
                  //       style: subCardMainTextStyle,
                  //     ),
                  //     const  SizedBox(width: 10,),
                  //     SizedBox(
                  //       width:screenWidthMultiply(0.45, context),
                  //       child: Text(widget.email!,textDirection: TextDirection.ltr,style:const  TextStyle(fontSize: 12),)
                  //       ,),
                  //   ],
                  // ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Agent', style: cardMainTextStyle),
                    CircleAvatar(
                      radius: screenHeightMultiply(0.18, context) / 5.5,
                      backgroundImage:  NetworkImage(widget.agentImg!),
                      backgroundColor: checkDarkTheme(context.m)
                          ? $profilePicDarkBackColor
                          : $profilePicBackColor,
                    ),
                    const SizedBox(height: 10.0),

                    Text(widget.agent!),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),


          const SizedBox(height: 20.0),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Book Status',
                    style: cardMainTextStyle,
                  ),
                  Text(widget.bookStatus!),

                ],
              ),
              const SizedBox(width: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Shipping Status',
                    style: cardMainTextStyle,
                  ),
                  Text(widget.shippingStatus!),

                ],
              ),
            ],
          ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           const Text('Payments', style: cardMainTextStyle),
          //           StatusWidget(  color: Colors.orange, status: "  ${widget.total!} \$  ", textColor: Colors.white,),
          //         ],
          //       ),
          //       const  SizedBox(
          //         width: 20,
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           const Text('Remaining', style: cardMainTextStyle),
          //             StatusWidget(  color: Colors.redAccent, status: "  ${widget.remaining!} \$  ", textColor: Colors.white,),
          //         ],
          //       ),
          //       const  SizedBox(
          //         width: 20,
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           const Text(
          //             'Total',
          //             style: cardMainTextStyle,
          //           ),
          //             StatusWidget(  color: Colors.green, status: "  ${double.parse(widget.remaining!) + double.parse(widget.total!)} \$  ", textColor: Colors.white,),
          //         ],
          //       ),
          //
          //
          //
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 10,),

        ],
      ),
    );
  }
}

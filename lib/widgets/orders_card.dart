import 'package:flutter/material.dart';
import 'package:omar_system/services/functions.dart';
import '../app_info.dart';
import '../models/order_models.dart';
import '../size_config.dart';
import 'status_widget.dart';

class OrdersCard extends StatefulWidget {
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
  final String? remaining;

  final List<PaymentModel>? payment;
  final String? total;
  const OrdersCard({
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
    this.payment,
    this.agentImg,
  }) : super(key: key);

  @override
  State<OrdersCard> createState() => _OrdersCardState();
}

class _OrdersCardState extends State<OrdersCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: screenHeightMultiply(0.15, context) / 5.5,
                  backgroundImage: NetworkImage(widget.agentImg!),
                  backgroundColor: checkDarkTheme(context.m)
                      ? $profilePicDarkBackColor
                      : $profilePicBackColor,
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                    width: screenWidthMultiply(0.20, context),
                    child: Text(
                      widget.agent!,
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('DATE', style: cardMainTextStyle),
                      if (widget.date != "null")
                        Text(
                          functions.getDateString(widget.date!),
                          style: TextStyle(
                              color: checkDarkTheme(context.m)
                                  ? Colors.green
                                  : Colors.green,
                              fontWeight: FontWeight.w600),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Serial', style: cardMainTextStyle),
                      if (widget.serial != "null") Text(widget.serial!),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Status',
                        style: cardMainTextStyle,
                      ),
                      Text(widget.status!),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('CUSTOMER', style: cardMainTextStyle),
                  Text(
                    'Name : ${widget.customerName!}',
                    style: subCardMainTextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'City : ${widget.city!}',
                    style: subCardMainTextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Phone : ${widget.phone!}',
                    style: subCardMainTextStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Email : ${widget.email!}',
                    style: subCardMainTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Payments', style: cardMainTextStyle),
                            StatusWidget(
                              color: Colors.orange,
                              status: "  ${widget.total!} \$  ",
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Remaining', style: cardMainTextStyle),
                            StatusWidget(
                              color: Colors.redAccent,
                              status: "  ${widget.remaining!} \$  ",
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Total',
                              style: cardMainTextStyle,
                            ),
                            StatusWidget(
                              color: Colors.green,
                              status:
                                  "  ${double.parse(widget.remaining!) + double.parse(widget.total!)} \$  ",
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

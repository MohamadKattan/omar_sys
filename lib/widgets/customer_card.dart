import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:omar_system/services/functions.dart';
import '../app_info.dart';
import '../size_config.dart';
import 'status_widget.dart';

class CustomerCard extends StatefulWidget {
  final String? date;
  final String? dateOfVisits;
  final String? dateOfCall;
  final String? customerName;
  final String? agent;
  final String? agentImg;
  final String? email;
  final String? finalResults;
  final String? phone;
  final String? city;
  final String? phoneStatus;
  final String? status;
  const CustomerCard({
    Key? key,
    this.date,
    this.dateOfVisits,
    this.dateOfCall,
    this.customerName,
    this.agent,
    this.email,
    this.finalResults,
    this.phone,
    this.city,
    this.phoneStatus,
    this.status,
    this.agentImg,
  }) : super(key: key);

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
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
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Date Of CALL', style: cardMainTextStyle),
                        if (widget.dateOfCall != "null")
                          Text(functions.getDateString(widget.dateOfCall!)),
                        if (widget.dateOfCall == "null") const Text('____')
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Date Of Visits',
                          style: cardMainTextStyle,
                        ),
                        if (widget.dateOfVisits != null &&
                            widget.dateOfVisits! != 'null')
                          Text(functions.getDateString(widget.dateOfVisits!)),
                        if (widget.dateOfVisits == null ||
                            widget.dateOfVisits! == 'null')
                          const Text('____'),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.eye,
                      color: Colors.grey.shade200,
                    ),
                  ],
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name',
                          style: subCardMainTextStyle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: screenWidthMultiply(0.45, context),
                            child: Text(widget.customerName!)),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'City',
                          style: subCardMainTextStyle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: screenWidthMultiply(0.45, context),
                            child: Text(widget.city!)),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Phone',
                          style: subCardMainTextStyle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: screenWidthMultiply(0.45, context),
                          child: Text(
                            widget.phone!,
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: subCardMainTextStyle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: screenWidthMultiply(0.45, context),
                          child: Text(
                            widget.email!,
                            textDirection: TextDirection.ltr,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Agent', style: cardMainTextStyle),
                    CircleAvatar(
                      radius: screenHeightMultiply(0.18, context) / 5.5,
                      backgroundImage: NetworkImage(widget.agentImg!),
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
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Phone Status', style: cardMainTextStyle),
                    if (widget.phoneStatus != "null")
                      if (widget.phoneStatus == "answer")
                        StatusWithIconsWidget(
                          color: Colors.green,
                          status: widget.phoneStatus!,
                          textColor: Colors.white,
                          icon: Icons.call,
                        ),
                    if (widget.phoneStatus != "answer" &&
                        widget.phoneStatus != "null")
                      StatusWithIconsWidget(
                        color: Colors.yellow,
                        status: widget.phoneStatus!,
                        textColor: Colors.black,
                        icon: Icons.call_end,
                      ),
                    if (widget.phoneStatus == "null") const Text('_____')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Status',
                      style: cardMainTextStyle,
                    ),
                    if (widget.status != "null")
                      if (widget.status != "interested" &&
                          widget.status != "pending" &&
                          widget.status != "null")
                        StatusWidget(
                          color: Colors.redAccent,
                          status: widget.status!,
                          textColor: Colors.white,
                        ),
                    if (widget.status == "pending")
                      StatusWidget(
                        color: Colors.yellow,
                        status: widget.status!,
                        textColor: Colors.black,
                      ),
                    if (widget.status == "interested")
                      StatusWidget(
                        color: Colors.green,
                        status: widget.status!,
                        textColor: Colors.white,
                      ),
                    if (widget.status == "null") const Text('_____')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Final Results', style: cardMainTextStyle),
                    if (widget.finalResults != "reserved" &&
                        widget.finalResults != "null")
                      StatusWidget(
                        color: Colors.redAccent,
                        status: widget.finalResults!,
                        textColor: Colors.white,
                      ),
                    if (widget.finalResults == "reserved")
                      StatusWidget(
                        color: Colors.green,
                        status: widget.finalResults!,
                        textColor: Colors.white,
                      ),
                    if (widget.finalResults == "null") const Text('_____')
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

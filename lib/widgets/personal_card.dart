import 'package:flutter/material.dart';
import '../app_info.dart';
import '../size_config.dart';

class PersonalCard extends StatefulWidget {
  const PersonalCard(
      {super.key,
      required this.image,
      required this.name,
      required this.title,
      required this.day,
      required this.icon,
      required this.iconColor,
      this.jobTitle});
  final String image;
  final String name;
  final String day;
  final String title;
  final IconData icon;
  final String? jobTitle;
  final ColorSwatch<int>? iconColor;

  @override
  State<PersonalCard> createState() => _PersonalCardState();
}

class _PersonalCardState extends State<PersonalCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: screenHeightMultiply(0.18, context) / 4,
                backgroundImage:  NetworkImage(widget.image),
                backgroundColor: checkDarkTheme(context.m)
                    ? $profilePicDarkBackColor
                    : $profilePicBackColor,
              ),
              const SizedBox(
                width: 7,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    // style: kNameTextStyle,
                  ),
                  Text(
                    widget.title,
                    style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                    // style: kNameTextStyle,
                  ),
            ],
          ),

              // const Text(
              //   'FLUTTER DEVELOPER',
              //   // style: kJobTitle,
              // ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.day,
                // style: kJobTitle,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Icon(
                  widget.icon,
                  color: widget.iconColor,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

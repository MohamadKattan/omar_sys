import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../app_info.dart';
import '../../../models/user_model.dart';
import '../../../services/api_links.dart';
import '../../../size_config.dart';

class UserInfo extends StatelessWidget {
  final User user;

  const UserInfo({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageAndCover(
          user: user,
        ),
        NameAndEmail(
          user: user,
        ),
        Divider(
          thickness: 1,
          color: Colors.black.withOpacity(0.2),
        ),
      ],
    );
  }
}

class NameAndEmail extends StatelessWidget {
  final User user;
  const NameAndEmail({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: screenHeightMultiply(0.03, context),
        ),
        Text(
          user.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: screenWidthDivided(20, context),
          ),
        ),
        SizedBox(
          height: screenHeightMultiply(0.01, context),
        ),
        Text(user.email),
        SizedBox(
          height: screenHeightMultiply(0.01, context),
        ),
      ],
    );
  }
}

class ImageAndCover extends StatelessWidget {
  final User user;
  const ImageAndCover({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double coverHeight = screenHeightMultiply(0.20, context);
    final double imageHeight = screenHeightMultiply(0.18, context);
    final double top = coverHeight - imageHeight / 2;
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: imageHeight / 2),
          width: double.infinity,
          height: coverHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular($borderRadius.toDouble()),
                bottomRight: Radius.circular($borderRadius.toDouble())),
            color: checkDarkTheme(context.m) ? $mainDarkColor : $mainColor,
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/cover_w.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(),
          ),
        ),
        Positioned(
            top: top,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(imageHeight / 2 + 5)),
                  color: checkDarkTheme(context.m)
                      ? $profilePicDarkBackColor
                      : $profilePicBackColor),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: user.avatarUrl != defaultImageUrl
                    ? CircleAvatar(
                        radius: imageHeight / 2,
                        backgroundImage: NetworkImage(user.avatarUrl ?? ''),
                        backgroundColor: checkDarkTheme(context.m)
                            ? $profilePicDarkBackColor
                            : $profilePicBackColor,
                      )
                    : CircleAvatar(
                        radius: imageHeight / 2,
                        backgroundImage:
                            const AssetImage('assets/images/profile.png'),
                        backgroundColor: checkDarkTheme(context.m)
                            ? $profilePicDarkBackColor
                            : $profilePicBackColor,
                      ),
              ),
            ))
      ],
    );
  }
}

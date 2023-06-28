import 'package:flutter/material.dart';
import 'package:omar_system/views/edit_profile/components/user_edit_form.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  final VoidCallback? refresh;

  const Body({Key? key,required this.refresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          constraints:
          const BoxConstraints(
              maxWidth: 650 ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidthMultiply(0.05, context)),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height: screenWidthMultiply(0.04, context)),
                  EditProfileForm(refresh: refresh,),
                  SizedBox(height: screenWidthMultiply(0.04, context)),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



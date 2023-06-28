import 'package:flutter/material.dart';

import '../../../app_info.dart';
import '../../../size_config.dart';



class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: screenHeightMultiply(0.4, context),
      decoration: BoxDecoration(
        image:const  DecorationImage(
          image: AssetImage("assets/images/omar2.png"),
          fit: BoxFit.cover,
        ),
        color: const Color(0xff2e2e2e),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular($borderRadius.toDouble()),
          topRight: Radius.circular(
            $borderRadius.toDouble(),
          ),
          bottomLeft: Radius.circular($borderRadius.toDouble()),
          bottomRight: Radius.circular(
            $borderRadius.toDouble(),
          ),
        ),
      ),

      // child:SizedBox(
      //   width: screenWidthMultiply(0.4, context),
      //   child: Text('مجال عملي هو حلول الأعمال وتطوير الشركة والشخصية ، الإدارة ليست ترفا ، ولكنها عنصر أساسي في إدارة المؤسسات والشركات والأفراد والبلدان. وعملى كمتخصص فى حلول الأعمال وذلك من خلال تقديم وتوفير احتياجات الشركات واستكشاف مشاكل والعمل على إيجاد حلول لها.إلى جانب ذلك مساعدة تلك الشركات على التواجد واختراق الاسواق وخلق المزايا التنافسية التى تساعدها الى تحقيق اعلى المكاسب والارباح',
      //   style: TextStyle(color: Colors.white),),
      // ) ,
    );
  }
}


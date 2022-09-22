import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_e_commerce/theme/theme.dart';
import 'package:my_e_commerce/view/widgets/text_utils.dart';

class FooterContainer extends StatelessWidget {
  const FooterContainer({Key? key, required this.text1, required this.text2, required this.navigate}) : super(key: key);
  final String text1 ;
  final String text2 ;
  final Function() navigate;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Get.isDarkMode? pinkClr :mainColor,
borderRadius: BorderRadius.only(topRight: Radius.circular(20),
    topLeft: Radius.circular(20))

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Text_Utils(
              fontWeight: FontWeight.normal,
              text:text1,
              color: Colors.white,
              isUndeLine: false,
              fontsize: 20),
          InkWell(
            onTap: navigate,
            child: Text_Utils(
                fontWeight: FontWeight.normal,
                text: text2,
                color: Colors.white,
                isUndeLine: true,
                fontsize: 20),
          ),
        ],
      ),
    );
  }
}

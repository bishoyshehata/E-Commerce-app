import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: "Search you're looking for",
        hintStyle: TextStyle(
            color:  Colors.black45,
            fontSize: 15,
            fontWeight: FontWeight.normal),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search),
        disabledBorder:  OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)
        ),
        focusedErrorBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)
        ),
        errorBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)
        )

      ),
      keyboardType: TextInputType.text,
    );
  }
}

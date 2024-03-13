import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({required this.ontap, required this.title});

 late Function() ontap;
 late String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Center(
            child: Text(
                  title,
            )),
      ),
    );
  }
}

import 'package:http_amdb/MVVM/resources/Components/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttoncolor,
          borderRadius: BorderRadius.circular(19),
        ),
        child: loading == true
            ? Center(child: CircularProgressIndicator(backgroundColor: Colors.white,))
            : Center(child: Text(title)),
      ),
    );
  }
}

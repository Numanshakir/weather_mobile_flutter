import 'package:flutter/material.dart';
import 'package:weather_mobile_flutter/Common/AppText/AppTextView.dart';
import 'package:weather_mobile_flutter/Theme/colors.dart';

Widget innerAppBar({
  required BuildContext context,
  required String title,
  bool isBackButton = true,
}) {
  return Row(
    children: [
      if (isBackButton)
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: IconButton(
              iconSize: 24,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
                size: 24,
              )),
        ),
      if (!isBackButton)
        const SizedBox(
          width: 30,
        ),
      const Spacer(),
      CustomText(
        title: title,
        size: 16,
        color: AppColor.darkText,
        fontWeight: FontWeights.semiBold,
      ),
      const Spacer(),
      const SizedBox(
        width: 30,
      ),
    ],
  );
}

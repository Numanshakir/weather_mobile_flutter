import 'package:flutter/material.dart';
import 'package:weather_mobile_flutter/Constant/custom_assets.dart';
import 'package:weather_mobile_flutter/Theme/colors.dart';

class SearchField extends StatefulWidget {
  final Function? onChanged;
  final double height;
  final Function? onSubmit;
  final bool onlyRead;
  final String hint;
  final Function? clearCallback;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  const SearchField({
    Key? key,
    this.onChanged,
    this.onSubmit,
    this.padding,
    this.height = 44,
    this.hint = "Search here",
    this.onlyRead = false,
    this.clearCallback,
    this.onTap,
    this.controller,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  // TextEditingController controller = TextEditingController();

  String searchTXT = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Padding(
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          onEditingComplete: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onFieldSubmitted: (value) {
            if (widget.onSubmit != null) {
              widget.onSubmit!(value);
            }
          },
          readOnly: widget.onlyRead,
          textInputAction: TextInputAction.search,
          controller: widget.controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              filled: true,
              contentPadding:
                  const EdgeInsets.only(top: 5, bottom: 10, left: 15),
              fillColor: AppColor.white,
              suffixIcon: Padding(
                padding: EdgeInsets.all(13.0),
                child: Image(
                  image: AssetImage(CustomAssets.search),
                  height: 15,
                  width: 15,
                  color: AppColor.greyText,
                ),
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(15)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(15)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                  borderRadius: BorderRadius.circular(15)),
              hintText: widget.hint,
              hintStyle: const TextStyle(
                color: AppColor.greyText,
                fontFamily: "Poppins",
                fontSize: 15,
                fontWeight: FontWeights.regular,
              )),
          onTap: () {
            if (widget.onTap != null) widget.onTap!();
          },
          onChanged: (value) {
            setState(() {
              searchTXT = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
        ),
      ),
    );
  }
}

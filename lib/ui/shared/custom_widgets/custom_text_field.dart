import 'package:flutter/material.dart';
import 'package:flutter_project/ui/shared/colors.dart';
import 'package:flutter_project/ui/shared/utils.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key, required this.hitText, this.borderColor, this.textColor, this.backColor, this.labelText, required this.controller, this.keyboardType, this.validator, this.prefixName, this.suffixName, this.update, this.onTap, this.hide}) : super(key: key);

  final String hitText;
  final Color? borderColor;
  final Color? textColor;
  final Color? backColor;
  final String? labelText;
  final String? prefixName;
  final String? suffixName;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function? update;
  final Function? onTap;
  final bool? hide;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 1 ,horizontal: 10),
      child: TextFormField(
        onChanged: (value){widget.update!();},
        validator: widget.validator,
        obscureText: widget.hide ?? false,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.all(screenWidth(40)),
            child: widget.suffixName == null ? SizedBox.shrink() : InkWell(onTap: (){widget.onTap!();},
                child: Padding(
              padding:  EdgeInsets.all(screenWidth(50)),
              child: SvgPicture.asset('images/${widget.suffixName}.svg'),
            )),
          ),
          errorStyle: TextStyle(color: AppColors.PlaceholderColor),
          hintText: widget.hitText,
          contentPadding: EdgeInsetsDirectional.symmetric(vertical: 25 ,horizontal: 2),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor ?? AppColors.mainBlueColor)
          ),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.mainBlueColor , width: screenWidth(200)))


        ),
        style: TextStyle(color: widget.textColor ?? Colors.black45),
      ),
    );
  }
}

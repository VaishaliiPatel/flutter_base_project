import 'package:cmsocpp/base_configs/configs/color_config.dart';
import 'package:cmsocpp/base_configs/configs/flavor_config.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/core/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends BaseStatelessWidget {
  const AppTextField({
    Key? key,
    this.focusNode,
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.obscure = false,
    this.onSubmitted,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.onSave,
    this.onPasswordChange,
    this.suffix,
    this.prefix,
    this.title = '',
    this.labelTitle = '',
    this.hintText = '',
    this.isPasswordField = false,
    this.isMobileField = false,
    required this.styles,
    this.maxLength,
    required this.flavor,
    this.hintStyle,
    this.inputStyle,
    this.isCompulsoryField = true,
    this.initialValue,
    this.maxLines = 1,
    this.isDisable = false,
    this.contentPadding,
    this.keyBoardType,
    this.isSpacingFromBottom = true,
  }) : super(key: key);

  final String title;
  final String labelTitle;
  final String hintText;
  final bool isPasswordField;
  final StyleController styles;
  final BaseFlavorConfig flavor;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputType? keyBoardType;
  final TextInputAction? textInputAction;
  final bool obscure;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final void Function()? onPasswordChange;
  final FormFieldValidator<String>? validator;
  final String Function(String?)? onSave;
  final Widget? suffix;
  final Widget? prefix;
  final bool isMobileField;
  final int? maxLength;
  final TextStyle? hintStyle;
  final TextStyle? inputStyle;
  final bool isCompulsoryField;
  final String? initialValue;
  final int? maxLines;
  final bool isDisable;
  final double? contentPadding;
  final bool isSpacingFromBottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Field Title
        (title.isEmpty)
            ? const SizedBox()
            : Text(
                isCompulsoryField ? '$title*' : title,
                style: styles.textFieldLabelStyle,
              ),
        (title.isEmpty)
            ? const SizedBox()
            : SizedBox(
                height: 10.h,
              ),

        /// Text Field
        TextFormField(
          obscureText: obscure,
          controller: controller,
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          textInputAction: textInputAction ?? TextInputAction.done,
          keyboardType: textInputType ?? TextInputType.text,
          cursorColor: ColorConfig.primaryColor,
          onFieldSubmitted: onSubmitted,
          onChanged: onChanged,
          validator: validator,
          onSaved: onSave,
          maxLength: maxLength,
          style: inputStyle ?? styles.textFieldInputStyle,
          initialValue: initialValue,
          maxLines: maxLines,
          readOnly: isDisable,
          decoration: InputDecoration(
            filled: true,
            fillColor: flavor.appColors!.appBgColor,
            errorMaxLines: 2,
            hintText: hintText,
            counterText: '',
            contentPadding: contentPadding != null
                ? EdgeInsets.only(top: contentPadding!, left: 10.r)
                : EdgeInsets.only(top: 14.r, bottom: 14.r, left: 10.r, right: 10.r),
            hintStyle: hintStyle ?? styles.textFieldHintStyle,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: const BorderSide(
                color: ColorConfig.enabledBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: const BorderSide(
                color: ColorConfig.focusedBorderColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: const BorderSide(
                color: ColorConfig.errorColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: const BorderSide(
                color: ColorConfig.errorColor,
              ),
            ),
            suffixIcon: isPasswordField
                ? GestureDetector(
                    onTap: onPasswordChange,
                    child: !obscure
                        ? const Icon(
                            Icons.visibility_off,
                            color: ColorConfig.textFieldHintColor,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: ColorConfig.textFieldHintColor,
                          ),
                  )
                : suffix,
            prefixIcon: prefix,
          ),
        ),
        if (isSpacingFromBottom)
          SizedBox(
            height: 20.h,
          ),
      ],
    );
  }
}

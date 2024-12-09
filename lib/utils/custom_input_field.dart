import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.suffixIcon = false,
    this.isPrefix = false,
    this.prefixIcon,
    this.isDense,
    this.obscureText = false,
    this.controller,
    this.minLines = 1,
    this.maxLines = 1,
    this.showLabel = true,
    this.backgroundColor = Colors.white,
    this.height,
    this.isScrollable = false,
    this.hintColor,
    this.labelColor,
    this.labelDisplay = true,
    this.isReq = false,
    this.isNum = false,
    this.fontSize = 16,
    this.maxLength = 11,
  });

  final String labelText, hintText;
  final bool suffixIcon,
      isPrefix,
      obscureText,
      showLabel,
      isScrollable,
      labelDisplay,
      isReq,
      isNum;
  final IconData? prefixIcon;
  final bool? isDense;
  final TextEditingController? controller;
  final int minLines, maxLines, maxLength;
  final Color backgroundColor;
  final double? height, fontSize;
  final Color? hintColor;
  final Color? labelColor;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        shape: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black),
        ),
        color: widget.backgroundColor,
      ),
      child: TextFormField(
        minLines: widget.obscureText ? 1 : widget.minLines,
        maxLines: widget.obscureText
            ? 1
            : widget.isScrollable
                ? widget.maxLines
                : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.isReq
            ? (textValue) {
                if (textValue == null || textValue.isEmpty) {
                  return 'يجب ملأ هذه الخانة';
                } else if (widget.isNum == true &&
                    textValue.length < widget.maxLength) {
                  return 'يجب ان يكون علي الاقل ${widget.maxLength} رقم';
                } else {
                  return null;
                }
              }
            : null,
        style: TextStyle(fontSize: widget.fontSize),
        keyboardType: widget.isNum ? TextInputType.number : null,
        obscureText: widget.obscureText && _obscureText,
        inputFormatters: widget.isNum
            ? [
                LengthLimitingTextInputFormatter(widget.maxLength),
                FilteringTextInputFormatter.digitsOnly,
              ]
            : null,
        textInputAction: TextInputAction.done,
        onEditingComplete: () {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          fillColor: widget.backgroundColor,
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
          filled: true,
          isDense: widget.isDense ?? false,
          suffixIcon: widget.suffixIcon
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.remove_red_eye
                        : Icons.visibility_off_outlined,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          prefixIcon: widget.isPrefix
              ? Icon(
                  widget.prefixIcon,
                  color: Colors.grey,
                  size: 20,
                )
              : null,
          prefixIconConstraints: widget.isDense != null
              ? const BoxConstraints(maxHeight: 33)
              : null,
          suffixIconConstraints: widget.isDense != null
              ? const BoxConstraints(maxHeight: 33)
              : null,
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 16),
          label: widget.labelDisplay
              ? Text(widget.labelText, style: const TextStyle(fontSize: 16))
              : null,
        ),
        controller: widget.controller,
      ),
    );
  }
}

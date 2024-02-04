import 'package:flutter/material.dart';
import 'package:muze/utils/constants/colors.dart';

enum CustomTextFieldType {
  text,
  email,
  password,
}

class CustomTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final CustomTextFieldType? customTextFieldType;
  final bool backgroundVisible;
  const CustomTextField({super.key, required this.title, required this.hintText, required this.validator, required this.controller, this.customTextFieldType, this.backgroundVisible = true});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.greyText,
                fontSize: 13,
                height: 20 / 13,
              ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
        TextFormField(
          controller: widget.controller,
          cursorColor: AppColors.white,
          obscureText: widget.customTextFieldType == CustomTextFieldType.password ? !passwordVisible : false,
          keyboardType: widget.customTextFieldType == CustomTextFieldType.email ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 15),
            fillColor: AppColors.lightGrey,
            filled: widget.backgroundVisible ? true : false,
            errorMaxLines: 3,
            hintText: widget.hintText,
            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(12)),
            focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.red), borderRadius: BorderRadius.circular(12)),
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.greyText,
                  fontSize: 13,
                  height: 20 / 13,
                ),
            suffixIcon: widget.customTextFieldType == CustomTextFieldType.password
                ? IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    splashColor: Colors.transparent,
                  )
                : null,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}

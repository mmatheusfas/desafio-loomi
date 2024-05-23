import 'package:flutter/material.dart';
import 'package:loomi_ui/loomi_ui.dart';

class LoginFormField extends StatelessWidget {
  const LoginFormField({
    super.key,
    required this.label,
    required this.textEditingController,
    required this.hintText,
    required this.validator,
    required this.onPressed,
    required this.buttonChild,
    this.obscureText,
    this.suffixIcon,
  });

  final String label;
  final TextEditingController textEditingController;
  final String hintText;
  final String? Function(String? value)? validator;
  final VoidCallback onPressed;
  final Widget buttonChild;
  final bool? obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_sharp),
        ),
        const SizedBox(height: 36),
        Text(
          label,
          style: AppFonts.montserratMedium(24),
        ),
        const SizedBox(height: 24),
        TextFormField(
          controller: textEditingController,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: suffixIcon,
          ),
          validator: validator,
        ),
        const SizedBox(height: 16),
        Center(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.yellow,
              minimumSize: const Size(296, 56),
              maximumSize: const Size(296, 56),
            ),
            child: buttonChild,
          ),
        )
      ],
    );
  }
}

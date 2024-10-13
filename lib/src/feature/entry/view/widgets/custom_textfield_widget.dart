import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/style/app_colors.dart';
import '../../../../core/widgets/text_widget.dart';
class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({super.key, required this.controller,  this.label, this.suffix, this.prefix, this.hintText});
  final TextEditingController controller;
  final String? label, hintText;
  final Widget? suffix;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          hintStyle: TextStyle(
            color: context.appTheme.secondary,
            fontWeight: FontWeight.bold
          ),
          labelStyle: TextStyle(
            color: context.appTheme.secondary
          ),
          prefixIcon: prefix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: context.appTheme.primary,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.deepPurpleAccent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}

Widget a(){
  return   Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
    child: TextField(
      decoration: InputDecoration(
        labelText: 'Enter your last name',
        hintText: 'e.g., Rover',
        prefixIcon: const Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.shade700),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
      // You can add additional properties like controller, onChanged, etc.
    ),
  );
}








// class CustomTextField extends StatelessWidget {
//   final String label;
//   final bool isObscureText;
//   final Widget? suffix;
//   final Widget? prefix;
//   final String? hintText;
//   final TextInputAction textInputAction;
//   final TextInputType keyboardType;
//   final VoidCallback? makeObscure;
//   final Color focusBorderColor;
//   final Color enabledBorderColor;
//   final Color labelTextColor;
//   final double? labelSize;
//   final Color? fillColor;
//   final EdgeInsets? edgeInsets;
//   final TextEditingController? controller;
//   final List<TextInputFormatter>? inputFormatters;
//   final FontWeight fontWeight;
//   final TextAlign textAlign;
//   final int maxLines;
//   final void Function(String)? onChange;
//
//   const CustomTextField({
//     this.label = '',
//     this.isObscureText = false,
//     this.fillColor = contex,
//     this.labelTextColor = AppColors.black,
//     this.keyboardType = TextInputType.text,
//     this.enabledBorderColor = AppColors.black,
//     this.focusBorderColor = AppColors.black,
//     this.textInputAction = TextInputAction.next,
//     this.suffix,
//     this.prefix,
//     this.labelSize = 14,
//     this.maxLines = 1,
//     this.hintText,
//     this.controller,
//     this.makeObscure,
//     this.inputFormatters,
//     this.onChange,
//     this.textAlign = TextAlign.start,
//     this.fontWeight = FontWeight.w600,
//     super.key,
//     this.edgeInsets,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomTextWidget(
//           label,
//           fontWeight: fontWeight,
//           fontSize: labelSize,
//           textColor: labelTextColor,
//         ),
//         const SizedBox(height: 4),
//         TextFormField(
//           style: TextStyle(color: context.appTheme.secondary, fontWeight: FontWeight.w400, fontSize: 16),
//           textAlign: textAlign,
//           obscureText: isObscureText,
//           obscuringCharacter: "*",
//           keyboardType: keyboardType,
//           textInputAction: textInputAction,
//           controller: controller,
//           cursorColor: AppColors.black,
//           inputFormatters: inputFormatters,
//           maxLines: maxLines,
//           onChanged: onChange,
//           decoration: InputDecoration(
//             contentPadding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
//             suffixIcon: suffix == null
//                 ? null
//                 : GestureDetector(
//               onTap: makeObscure,
//               child: Padding(padding: const EdgeInsets.all(10), child: suffix),
//             ),
//             prefix: prefix,
//             //isDense: true,
//             filled: true,
//             fillColor: fillColor,
//             hintText: hintText,
//             hintStyle: const TextStyle(
//               fontSize: 16,
//               color: Colors.grey,
//             ),
//             enabledBorder: const OutlineInputBorder(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(10),
//               ),
//               borderSide: BorderSide.none,
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.all(Radius.circular(14)),
//               borderSide: BorderSide(color: focusBorderColor),
//             ),
//           ),
//         ),
//         const SizedBox(height: 4),
//       ],
//     );
//   }
// }
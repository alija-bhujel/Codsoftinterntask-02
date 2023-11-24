import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textfieldd extends StatelessWidget {
  Textfieldd(
      {super.key,
      required this.hint,
      this.icon,
      this.onTap,
      this.readOnly = false,
      this.onChanged,
      this.controller});

  final String hint;
  final IconData?
      icon; // it is nullable because we want to show the icon only on date and time and required is not given
  final void Function()? onTap;
  final bool readOnly;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      onChanged: onChanged,
      decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: onTap,
              child: Icon(
                icon,
                color: Colors.blueGrey[500],
              )),
          hintText: hint,
          hintStyle: GoogleFonts.poppins(color: Colors.grey)),
    );
  }
}

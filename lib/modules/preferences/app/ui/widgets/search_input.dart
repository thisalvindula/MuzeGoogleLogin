import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muze/l10n/l10n.dart';
import 'package:muze/utils/constants/colors.dart';

class SearchInput extends StatefulWidget {
  final Function(String) onSearchChanged;
  final double width;
  const SearchInput({super.key, required this.onSearchChanged, required this.width});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return SizedBox(
      height: MediaQuery.of(context).size.height / 20,
      width: widget.width,
      child: TextField(
        controller: controller,
        style: GoogleFonts.poppins(
          color: AppColors.white,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          height: 19.5 / 13,
        ),
        onChanged: widget.onSearchChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          filled: true,
          fillColor: AppColors.lightGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
          hintText: localizations.search_text,
          hintStyle: GoogleFonts.poppins(color: AppColors.greyText, fontSize: 13, fontWeight: FontWeight.w400, height: 19.5 / 13),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          suffixIconColor: AppColors.greyText,
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/core/widgets/app_checkbox_button.dart';

import '../../../../core/storage/sheared_preferens.dart';
import '../../../../core/widgets/app_material_context.dart';
import '../../../settings/locale_controller.dart';
class LangButton extends StatefulWidget {
  const LangButton({super.key});

  @override
  State<LangButton> createState() => _LangButtonState();
}

class _LangButtonState extends State<LangButton> {
  bool eng = false, uz = false, ru = false;
  late StorageService storageService;
  String lang = "uz"; // Default to "uzbek" if no language found

  @override
  void initState() {
    super.initState();
    _initializeLang();
  }

  Future<void> _initializeLang() async {
    storageService = await StorageService.instance;
    String? storedLang = storageService.read("app_local");
    debugPrint(storedLang ?? "stored lang == null");

    setState(() {
      lang = storedLang ?? "uz"; // Default to "uz" if storedLang is null
      switch (lang) {
        case "en":
          eng = true;
          break;
        case "ru":
          ru = true;
          break;
        case "uz":
        default:
          uz = true;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: context.appTheme.secondary),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLangOption("English", LangCodes.en, eng),
            const SizedBox(width: 5),
            _buildLangOption("Uzbek", LangCodes.uz, uz),
            const SizedBox(width: 5),
            _buildLangOption("Russian", LangCodes.ru, ru),
          ],
        ),
      ),
    );
  }

  Widget _buildLangOption(String lang, LangCodes langCode, bool isSelected) {
    return InkWell(
      onTap: () async {
        setState(() {
          eng = langCode == LangCodes.en;
          uz = langCode == LangCodes.uz;
          ru = langCode == LangCodes.ru;
        });

        // Store selected language
        await storageService.store("app_local", langCode.name);

        localController.changeLocal(langCode);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: context.appTheme.secondary),
          color: isSelected ? context.appTheme.secondary : Colors.transparent,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Text(
          lang,
          style: TextStyle(
            color: isSelected ? Colors.orange : context.appTheme.secondary,
          ),
        ),
      ),
    );
  }
}


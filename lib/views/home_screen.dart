import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:password_generator/domain/generate_password_function.dart';
import 'package:password_generator/views/widgets/switch.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isUpperCaseAllowed = true;
  bool isSymbolsAllowed = true;
  bool isLowerCaseAllowed = true;
  bool isNumberAllowed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          AppLocalizations.of(context)!.passwordGenerator,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context).textTheme.titleMedium!.color),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Center(
                  child: Lottie.asset('assets/password_animation.json',
                      height: 200)),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: generatedPassword,
                      hintStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                      suffixIcon: IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(AppLocalizations.of(context)!
                                    .passwordCopiedToClipboard)));
                            Clipboard.setData(
                                ClipboardData(text: generatedPassword));
                          },
                          icon: Icon(
                            Icons.copy_outlined,
                            color: Theme.of(context).primaryColor,
                          )),
                      filled: true,
                      fillColor:
                          Theme.of(context).primaryColor.withOpacity(0.05),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MySwitch(
                  value: isLowerCaseAllowed,
                  text: AppLocalizations.of(context)!.lowerCase,
                  onChanged: (value) {
                    setState(() {
                      isLowerCaseAllowed = !isLowerCaseAllowed;
                    });
                  }),
              MySwitch(
                  value: isUpperCaseAllowed,
                  text: AppLocalizations.of(context)!.upperCase,
                  onChanged: (value) {
                    setState(() {
                      isUpperCaseAllowed = !isUpperCaseAllowed;
                    });
                  }),
              MySwitch(
                  value: isSymbolsAllowed,
                  text: AppLocalizations.of(context)!.symbols,
                  onChanged: (value) {
                    setState(() {
                      isSymbolsAllowed = !isSymbolsAllowed;
                    });
                  }),
              MySwitch(
                  value: isNumberAllowed,
                  text: AppLocalizations.of(context)!.numbers,
                  onChanged: (value) {
                    setState(() {
                      isNumberAllowed = !isNumberAllowed;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (isLowerCaseAllowed == false &&
                            isNumberAllowed == false &&
                            isSymbolsAllowed == false &&
                            isUpperCaseAllowed == false) {
                          showTopSnackBar(
                              animationDuration: const Duration(seconds: 1),
                              displayDuration: const Duration(seconds: 1),
                              padding: const EdgeInsets.all(25),
                              Overlay.of(context)!,
                              CustomSnackBar.error(
                                  message: AppLocalizations.of(context)!
                                      .selectAtLeast1option));
                        } else {
                          GeneratePassword(
                                  isLowerCaseAllowed: isLowerCaseAllowed,
                                  isNumberAllowed: isNumberAllowed,
                                  isSymbolsAllowed: isSymbolsAllowed,
                                  isUpperCaseAllowed: isUpperCaseAllowed)
                              .generatePassword();
                          setState(() {});
                        }
                      },
                      child:
                          Text(AppLocalizations.of(context)!.generatePassword)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

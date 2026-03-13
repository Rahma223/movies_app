import 'package:flutter/material.dart';
import 'package:movies_app/features/auth/view/login_screen.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_strings.dart';
import 'package:movies_app/ui/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

import '../view_model/on_boarding_view_model.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnBoardingViewModel(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  void goNext(BuildContext context, OnBoardingViewModel vm) {
    if (vm.isLast) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } else {
      vm.next();
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OnBoardingViewModel>();

    if (vm.currentIndex == 0) {
      return _FullScreenPage(
        vm: vm,
        buttonLabel: AppStrings.exploreNow,
        onNext: () => goNext(context, vm),
        showBorder: false,
      );
    }

    if (vm.currentIndex == 1) {
      return _FullScreenPage(
        vm: vm,
        buttonLabel: AppStrings.next,
        onNext: () => goNext(context, vm),
        showBorder: true,
      );
    }

    return _OtherPage(vm: vm, onNext: () => goNext(context, vm));
  }
}

class _FullScreenPage extends StatelessWidget {
  final OnBoardingViewModel vm;
  final String buttonLabel;
  final VoidCallback onNext;
  final bool showBorder;

  const _FullScreenPage({
    required this.vm,
    required this.buttonLabel,
    required this.onNext,
    required this.showBorder,
  });

  @override
  Widget build(BuildContext context) {
    final page = vm.pages[vm.currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              page.image,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xFF0D0D0D)],
                  stops: [0.45, 0.80],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: showBorder
                    ? const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
                    : BorderRadius.zero,
              ),
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 40),
              child: Column(
                children: [
                  Text(
                    page.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 14),
                  if (page.description.isNotEmpty)
                    Text(
                      page.description,
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                  const SizedBox(height: 32),
                  PrimaryButton(label: buttonLabel, onPressed: onNext),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OtherPage extends StatelessWidget {
  final OnBoardingViewModel vm;
  final VoidCallback onNext;

  const _OtherPage({required this.vm, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final page = vm.pages[vm.currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              page.image,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration:  BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 40),
              child: Column(
                children: [
                  Text(
                    page.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (page.description.isNotEmpty)
                    Text(
                      page.description,
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                        color: AppColors.lightBlack,
                        fontSize: 20,
                        height: 1.5,
                      ),
                    ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    label: vm.isLast ? AppStrings.finish : AppStrings.next,
                    onPressed: onNext,
                  ),
                  const SizedBox(height: 12),
                  SecondaryButton(
                    label: AppStrings.back,
                    onPressed: () => context.read<OnBoardingViewModel>().back(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
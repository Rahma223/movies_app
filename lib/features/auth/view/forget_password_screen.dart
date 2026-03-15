import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_strings.dart';
import 'package:movies_app/ui/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_view_model.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.yellow),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppStrings.forgetPassword,
          style: TextStyle(
            color: AppColors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 32),

              SizedBox(
                height: 300,
                child: Image.asset(
                  AppAssets.forgetPassword,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlack,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.lock_reset,
                      color: AppColors.yellow,
                      size: 50,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 48),

              CustomTextField(
                controller: emailController,
                hint: 'Email',
                iconAsset: AppAssets.email,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 8),

              if (vm.errorMessage != null)
                Text(
                  vm.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),

              const SizedBox(height: 16),

              vm.isLoading
                  ? CircularProgressIndicator(color: AppColors.yellow)
                  : PrimaryButton(
                      label: AppStrings.verifyEmail,
                      onPressed: () async {
                        final ok = await context
                            .read<AuthViewModel>()
                            .verifyEmail(emailController.text.trim());
                        if (ok && context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Email sent!')),
                          );
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/features/home/view/main_screen.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_strings.dart';
import 'package:movies_app/ui/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_view_model.dart';
import 'register_screen.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 10),

              Image.asset(AppAssets.logo, width: 200, height: 200),

              const SizedBox(height: 20),

              CustomTextField(
                controller: emailController,
                hint: 'Email',
                iconAsset: AppAssets.email,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              PasswordTextField(
                controller: passwordController,
                hint: 'Password',
                isVisible: vm.showPassword,
                onToggle: () => context.read<AuthViewModel>().togglePassword(),
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgetPasswordScreen(),
                    ),
                  ),
                  child: Text(
                    'Forget Password ?',
                    style: TextStyle(color: AppColors.yellow),
                  ),
                ),
              ),

              if (vm.errorMessage != null)
                Text(
                  vm.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),

              const SizedBox(height: 8),

              vm.isLoading
                  ? CircularProgressIndicator(color: AppColors.yellow)
                  : PrimaryButton(
                      label: AppStrings.login,
                      onPressed: () async {
                        final ok = await context.read<AuthViewModel>().login(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                        if (ok && context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MainScreen(),
                            ),
                          );
                        }
                      },
                    ),

              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have Account ? ",
                    style: TextStyle(color: AppColors.gray),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    ),
                    child: Text(
                      'Create One',
                      style: TextStyle(
                        color: AppColors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade700)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('OR', style: TextStyle(color: AppColors.gray)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade700)),
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    AppAssets.googleIcon,
                    width: 24,
                    height: 24,
                  ),
                  label: const Text(
                    AppStrings.loginWithGoogle,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              LanguageToggle(
                isEnglish: vm.isEnglish,
                onTap: () => context.read<AuthViewModel>().toggleLanguage(),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

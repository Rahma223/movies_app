import 'package:flutter/material.dart';
import 'package:movies_app/ui/utils/app_assets.dart';
import 'package:movies_app/ui/utils/app_colors.dart';
import 'package:movies_app/ui/utils/app_strings.dart';
import 'package:movies_app/ui/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';


import '../view_model/auth_view_model.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController            = TextEditingController();
  final emailController           = TextEditingController();
  final passwordController        = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController           = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
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
          icon:  Icon(Icons.arrow_back, color: AppColors.yellow),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text(
          AppStrings.register,
          style: TextStyle(color: AppColors.yellow, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(AppAssets.avatars.length, (index) {
                bool isSelected = index == vm.selectedAvatar;
                double size = isSelected ? 150 : 80;

                return GestureDetector(
                  onTap: () => context.read<AuthViewModel>().pickAvatar(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(color: AppColors.yellow, width: 3)
                          : null,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        AppAssets.avatars[index],
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => CircleAvatar(
                          backgroundColor: AppColors.gray,
                          child: Icon(
                            Icons.person,
                            color: Colors.grey,
                            size: isSelected ? 45 : 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),

            const SizedBox(height: 8),
            const Text('Avatar', style: TextStyle(color: Colors.white)),
            const SizedBox(height: 24),

            CustomTextField(
              controller: nameController,
              hint: 'Name',
              iconAsset: AppAssets.name,
            ),
            const SizedBox(height: 14),

            CustomTextField(
              controller: emailController,
              hint: 'Email',
              iconAsset: AppAssets.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 14),

            PasswordTextField(
              controller: passwordController,
              hint: 'Password',
              isVisible: vm.showPassword,
              onToggle: () => context.read<AuthViewModel>().togglePassword(),
            ),
            const SizedBox(height: 14),

            PasswordTextField(
              controller: confirmPasswordController,
              hint: 'Confirm Password',
              isVisible: vm.showConfirmPassword,
              onToggle: () => context.read<AuthViewModel>().toggleConfirmPassword(),
            ),
            const SizedBox(height: 14),

            CustomTextField(
              controller: phoneController,
              hint: 'Phone Number',
              iconAsset: AppAssets.phone,
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 8),

            if (vm.errorMessage != null)
              Text(vm.errorMessage!, style: const TextStyle(color: Colors.red)),

            const SizedBox(height: 20),

            vm.isLoading
                ?  CircularProgressIndicator(color: AppColors.yellow)
                : PrimaryButton(
              label: AppStrings.createAccount,
              onPressed: () async {
                final ok = await context.read<AuthViewModel>().register(
                  nameController.text.trim(),
                  emailController.text.trim(),
                  passwordController.text.trim(),
                  confirmPasswordController.text.trim(),
                  phoneController.text.trim(),
                );
                if (ok && context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                }
              },
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text('Already Have Account ? ',
                    style: TextStyle(color: AppColors.gray)),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  ),
                  child:  Text(
                    'Login',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            LanguageToggle(
              isEnglish: vm.isEnglish,
              onTap: () => context.read<AuthViewModel>().toggleLanguage(),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
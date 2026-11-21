import 'dart:math' as math;

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const Color _dioRed = Color(0xFFF00008);
  static const Color _hintGrey = Color(0xFF858585);
  static const String _supportNumber = '775353597';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      return;
    }

    // TODO: اربط هذه الدالة بخادم تسجيل الدخول للتحقق من بيانات المستخدم.
    // لا توجد مصادقة فعلية في هذه النسخة لأنها تحتاج إلى رابط API وبيانات الخادم.
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Text(
            'واجهة الدخول جاهزة، لكن خدمة تسجيل الدخول لم يتم ربطها بالخادم بعد.',
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color(0xFF333333),
        ),
      );
  }

  String? _requiredValidator(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return 'يرجى إدخال $fieldName';
    }
    return null;
  }

  Widget _buildInput({
    required double height,
    required double fontSize,
    required String hint,
    required TextEditingController controller,
    required String fieldName,
    bool obscureText = false,
    TextInputAction textInputAction = TextInputAction.next,
  }) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        textInputAction: textInputAction,
        autocorrect: false,
        enableSuggestions: !obscureText,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
        validator: (value) => _requiredValidator(value, fieldName),
        onFieldSubmitted: (_) {
          if (textInputAction == TextInputAction.done) {
            _login();
          }
        },
        decoration: InputDecoration(
          hintText: hint,
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(
            color: _hintGrey,
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: height * 0.20,
            vertical: height * 0.18,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.black, width: 3.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.black, width: 3.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: _dioRed, width: 3.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.red, width: 2.5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.red, width: 3),
          ),
          errorStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double screenWidth = constraints.maxWidth;
              final double screenHeight = constraints.maxHeight;
              final double contentWidth = math.min(screenWidth * 0.92, 850);
              final double fieldHeight =
                  (screenWidth * 0.132).clamp(58.0, 112.0).toDouble();
              final double fieldFontSize =
                  (screenWidth * 0.044).clamp(18.0, 35.0).toDouble();
              final double buttonFontSize =
                  (screenWidth * 0.060).clamp(23.0, 44.0).toDouble();
              final double logoWidth =
                  (screenWidth * 0.45).clamp(155.0, 390.0).toDouble();
              final double itemGap = screenWidth * 0.040;
              final double sectionGap = screenHeight * 0.185;
              final double footerGap = screenHeight * 0.105;

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: screenHeight),
                  child: Center(
                    child: SizedBox(
                      width: contentWidth,
                      child: Column(
                        children: [
                          SizedBox(height: screenHeight * 0.165),
                          Image.asset(
                            'assets/images/dio_logo.png',
                            width: logoWidth,
                            fit: BoxFit.contain,
                            semanticLabel: 'Dio',
                          ),
                          SizedBox(height: sectionGap),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                _buildInput(
                                  height: fieldHeight,
                                  fontSize: fieldFontSize,
                                  hint: 'اسم المستخدم',
                                  controller: _usernameController,
                                  fieldName: 'اسم المستخدم',
                                ),
                                SizedBox(height: itemGap),
                                _buildInput(
                                  height: fieldHeight,
                                  fontSize: fieldFontSize,
                                  hint: 'كلمة المرور',
                                  controller: _passwordController,
                                  fieldName: 'كلمة المرور',
                                  obscureText: true,
                                  textInputAction: TextInputAction.done,
                                ),
                                SizedBox(height: itemGap),
                                SizedBox(
                                  width: double.infinity,
                                  height: fieldHeight,
                                  child: ElevatedButton(
                                    onPressed: _login,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _dioRed,
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    child: Text(
                                      'تسجيل الدخول',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: buttonFontSize,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: footerGap),
                          Text(
                            'للتواصل مع خدمة العملاء',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _hintGrey,
                              fontSize: (screenWidth * 0.043)
                                  .clamp(17.0, 34.0)
                                  .toDouble(),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _supportNumber,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF777777),
                              fontSize: (screenWidth * 0.043)
                                  .clamp(17.0, 34.0)
                                  .toDouble(),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.045),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

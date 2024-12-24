import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.title,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 65,
    this.isDisabled = false,
    this.isLoading = false,
    this.onTap,
  });

  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final bool? isDisabled;
  final bool? isLoading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: !isDisabled! || !isLoading! ? onTap ?? () {} : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          padding: WidgetStateProperty.all(EdgeInsets.all(18)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        child: isLoading!
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}

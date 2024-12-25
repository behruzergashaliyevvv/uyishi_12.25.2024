import 'package:flutter/material.dart';

class Utils {
  /// Ranglarni yaratish uchun yordamchi funksiyalar
  static Color hexToColor(String hexCode) {
    final hex = hexCode.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  /// Snackbar ko'rsatish uchun funksiya
  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  /// Narx formatlash
  static String formatPrice(double price) {
    return '\$${price.toStringAsFixed(2)}';
  }

  /// Yulduzcha reyting ko'rsatish vidjeti
  static Widget buildRatingStars(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return Icon(Icons.star, color: Colors.yellow, size: 16);
        } else {
          return Icon(Icons.star_border, color: Colors.grey, size: 16);
        }
      }),
    );
  }
}

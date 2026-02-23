import 'dart:async';
import 'package:flutter/material.dart';
import 'car_installment_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CarInstallmentUi(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 47, 139, 139),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // รูป
            Image.asset(
              'assets/images/aaa11.png',
              width: 250,
            ),

            const SizedBox(height: 20),

            // ชื่อแอป
            const Text(
              'Car Installment',
              style: TextStyle(
                fontSize: 35,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'คำนวณค่างวดรถยนต์',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 60),

            // วงกลมโหลด
            const CircularProgressIndicator(
              color: Colors.white,
            ),

            const SizedBox(height: 50),

            // ข้อความล่างสุด
            const Text(
              'Created by Nimin DTI-SAU',
              style: TextStyle(
                fontSize: 14,
                color: Colors.yellow,
              ),
            ),

            const Text(
              'Version 1.0.0',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'nic_controller.dart';
import 'result_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController nicController = TextEditingController();
  final NicController getxController = Get.put(NicController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const Text(
                "Find NIC Details at Your Fingertips",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextField(
                  controller: nicController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFF7ECDF),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: const BorderSide(color: Colors.brown)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
                    hintText: "Enter NIC number here",
                    contentPadding: const EdgeInsets.all(20),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search, color: Colors.brown),
                      onPressed: () {
                        if (nicController.text.isNotEmpty) {
                          getxController.decodeNIC(nicController.text);
                          Get.to(() => ResultScreen());
                        }
                      },
                    ),
                  ),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      getxController.decodeNIC(value);
                      Get.to(() => ResultScreen());
                    }
                  },
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/bg.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

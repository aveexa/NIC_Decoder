import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'nic_controller.dart';

class ResultScreen extends StatelessWidget {
  final NicController nicController = Get.find();

  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6EC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.brown), // Change back button color
        title: const Text(
          "NIC Details",
          style: TextStyle(color: Colors.brown, fontSize: 26),
        ),
        centerTitle: true,
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  infoCard("NIC Number", nicController.nicNumber.value),
                  const SizedBox(height: 20),
                  infoCard("NIC Type", nicController.nicType.value),
                  const SizedBox(height: 20),
                  infoCard("Birthday", nicController.birthDate.value),
                  const SizedBox(height: 20),
                  infoCard("Age", nicController.age.string),
                  const SizedBox(height: 20),
                  infoCard("Weekday", nicController.weekday.value),
                  const SizedBox(height: 20),
                  infoCard("Gender", nicController.gender.value),
                  const SizedBox(height: 20),
                  infoCard("Voting Eligibility", nicController.votingEligibility.value),
                  // const SizedBox(height: 100)
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }

  Widget infoCard(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown.shade200)),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              color: Color(0xFFF7ECDF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.brown)),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:icheckit_final/reusable widgets/reusable_widgets.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('iCheckIt'), backgroundColor: Colors.red[400]),
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            buildCoverImage(),
            const Positioned(
              bottom: 8,
              child: Center(
                child: Text(
                  'About',
                  style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 36, 24, 28),
                child: Text(
                  'The College of Information and Computing Sciences (CICS), formerly known as Institute of Information'
                  'and Computing Sciences (IICS) was founded in 2014 and was separated to become an independent'
                  'academic unit from the Faculty of Engineering and provides students in taking the degree programs BS'
                  'in Computer Science, BS in Information Technology, and BS in Information System. This Higher'
                  'Education Institution (HEI) continues to nurture students with quality education on the choice of field'
                  'and at the same time manage the students’ welfare. With this, a capstone group during the academic'
                  'year 2021-2022 designed and developed a web and mobile based application entitled "iCheckIt: A Web'
                  'and Mobile Checklist and Notification System for Semestral and Annual Tasks under the College of'
                  'Information and Computing Sciences", wherein the system will help students, faculty, and'
                  'administrators in managing academic tasks. During the year 2022-2023, a version 2 had been'
                  'implemented to the system. iCheckIt is limited only to the students, professors, and administrators'
                  'under the College of Information and Computing Sciences.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.apply(fontSizeDelta: 4)
                      .copyWith(fontWeight: FontWeight.w400, height: 1.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

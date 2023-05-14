import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:icheckit_final/reusable widgets/reusable_widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final double coverHeight = 220;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('iCheckIt'), backgroundColor: Colors.red[400]),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 36),
        physics: const BouncingScrollPhysics(),
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              buildCoverImage(),
              Column(
                children: const [
                  Center(
                    child: Text(
                      'Contact CICS',
                      style:
                          TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          for (final adminkey in admindata.keys)
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 24, 16, 4),
              child: DecoratedBox(
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: ColoredBox(
                        color: Colors.grey.shade900,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            adminkey,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    for (final person in admindata[adminkey]!)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                person.values.first,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                              onPressed: () async {
                                await launchUrlString('mailto:${person.keys.first}');
                              },
                              child: Text(
                                person.keys.first,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Text('You may also contact CICS through:'),
              SizedBox(height: 16),
              Text('Address:\nAdministration Office 3/F Roque Ruaño Building, '
                  'University of Santo Tomas,\n'
                  'España Boulevard, Sampaloc,'),
              Text(
                'Manila 1008, Philippines',
              ),
              SizedBox(height: 16),
              Text('Telephone: +63-2-3406-1611 local 8518'),
              SizedBox(height: 16),
              Text('Monday to Saturday:'),
              Text('7:00 a.m. – 12:00 n.n., 1:00 p.m. – 8:00 p.m.'),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () async {
                  await launchUrlString('mailto:cics@ust.edu.ph');
                },
                child:
                    Text('Email: cics@ust.edu.ph', style: TextStyle(color: Colors.blue.shade700)),
              ),
              SizedBox(height: 8),
              Text('Facebook: @USTCICS2014Official', style: TextStyle(color: Colors.blue.shade700)),
            ]),
          ),
        ],
      ),
    );
  }
}

const admindata = {
  "College Dean": [
    {"jtpadua@ust.edu.ph": "Asst. Prof. Jerralyn T. Padua, MSCS"},
  ],
  'College Secretary': [
    {"drmariano@ust.edu.ph": 'Asst. Prof. Divinagracia Mariano, MBA'},
  ],
  "Department Chairs": [
    {"jlseno@ust.edu.ph": "Asst. Prof. Jose Seno, MS (Computer Science)"},
    {"avperol@ust.edu.ph": "Inst. Alma V. Perol, MIT (Information System)"},
    {"erzhuo@ust.edu.ph": "Asst. Prof. Eugenia R. Zhuo, DIT (Information Technology)"},
  ]
};

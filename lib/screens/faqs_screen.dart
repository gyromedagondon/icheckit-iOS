import 'package:flutter/material.dart';
import 'package:icheckit_final/reusable widgets/reusable_widgets.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({Key? key}) : super(key: key);

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('iCheckIt'), backgroundColor: Colors.red[400]),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 64.0),
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              buildCoverImage(),
              Column(
                children: const [
                  Center(
                    child: Text(
                      'FAQs',
                      style:
                          TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          for (String faq in faqsdata.keys)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(title: Text(faq), children: [
                for (final answer in faqsdata[faq]!)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 8, 8, 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('•  '),
                          Expanded(child: Text(answer)),
                        ],
                      ),
                    ),
                  ),
              ]),
            ),
        ],
      ),
    );
  }
}

const Map<String, List<String>> faqsdata = {
  "How to process email verification?": [
    "After registration, click on 'Send to Email' button and a link will be sent on your ust email.",
    "Click the link that has been sent. There should be a pop-up new tab containing a verification message.",
    "Logout of the app, then login again using your email and password."
  ],
  "How to submit your proof of completion for a specific task?": [
    "Navigate to the task dashboard. ",
    "Click on an available task.",
    "Attach a file required to submit.",
    "Tap the submit button.",
    "Wait for its approval. You can check the pending for approval task on the Pending Tasks Page.",
  ],
  "How to edit your profile?": [
    "Navigate to the 'My Profile' page located in the sidebar.",
    "Click on the pencil icon for each information you want to edit.",
    "Enter the new information and click on Save.",
  ],
  "How to edit your account password?": [
    "Navigate to the 'My Profile' page located in the sidebar.",
    "Click on 'Change Password'.",
    "Check your email address for the password reset link.",
    "Enter your new password.",
    "Confirm your new password.",
    "Click on Save and Login on your account again.",
  ],
  "How to delete your account?": [
    "Navigate to the 'My Profile' page located in the sidebar.",
    "Click on 'Delete Account'.",
    "Check your email address for the deletion of account confirmation.",
  ],
  "How to reset your account password?": [
    "In the login page, after typing your email and your (forgotten) password, click on 'Ask to reset'.",
    "Check your email address for the password reset link.",
    "Input your new account password then click 'Confirm Password'.",
    "Proceed to login with the new account password.",
  ],
};

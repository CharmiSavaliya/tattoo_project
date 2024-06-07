import 'package:flutter/material.dart';
import 'package:tattoo_project/stylescreen.dart';

class QuestionbookingScreen extends StatefulWidget {
  const QuestionbookingScreen({super.key});

  @override
  State<QuestionbookingScreen> createState() => _QuestionbookingScreenState();
}

class _QuestionbookingScreenState extends State<QuestionbookingScreen> {
  List<String> styles = [
    'The shop manager is responsible for \n handling all bookings',
    'Each artist at the studio manages their \n own bookings',
    'I have a booking assistant that manages\n my bookings',
    "I'm an independent artist and manage\n my own bookings",
  ];
  String? selectedStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 80),
                    const Text(
                      'Question 2/2',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 0),
                      const Text(
                        "How does your business manage \n                    bookings? ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: styles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildListItem(styles[index], index);
                        },
                      ),
                      const SizedBox(height: 200),
                      SizedBox(
                        height: 50,
                        width: 375,
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StyleScreen(),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xff1849D6),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const StyleScreen(),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListItem(String style, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              style,
              style: const TextStyle(fontSize: 16),
            ),
            Radio<String>(
              value: style,
              groupValue: selectedStyle,
              onChanged: (String? value) {
                setState(() {
                  selectedStyle = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

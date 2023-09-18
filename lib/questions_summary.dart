import "package:flutter/material.dart";

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            // Determine if the question is answered correctly
            bool isCorrect = data["user_answer"] == data["correct_answer"];

            // Define a color based on correctness
            Color circleColor = isCorrect
                ? Colors.green
                : const Color.fromARGB(255, 40, 3, 104);

            return Container(
              margin: const EdgeInsets.only(bottom: 8.0), // Add top margin

              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text at the top
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(100),
                      shape: BoxShape.circle, // Create a circle
                      color: circleColor, // Set color based on correctness
                    ),
                    padding:
                        const EdgeInsets.all(8.0), // Padding within the circle

                    // margin: const EdgeInsets.only(top: 2.0), // Add top margin
                    child: Text(
                      ((data["question_index"] as int) + 1).toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ), // The Expanded widget Creates a widget that expands a child of a
                  //[Row], [Column], or [Flex] so that the child fills the available
                  //space along the flex widget's main axis so that the Column,
                  //Row,widget dont take space that extends beyond the available space.
                  //it kinda break long text to not take the entire space
                  // Text(((data["question_index"] as int) + 1).toString()),
                  Expanded(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 8.0), // Add top margin
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text at the top
                        children: [
                          Text(
                            data["question"] as String,
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight.bold, // Style for question text
                              color: Colors.white,
                              fontSize: 18.0, // Adjust the font size as needed
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Your Answer: ${data["user_answer"] as String}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 40, 3, 104),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Correct Answer: ${data["correct_answer"] as String}",
                            style: const TextStyle(
                              color: Colors
                                  .greenAccent, // Style for correct answer
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'shopping_page.dart'; // Import your shopping cart page file

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key); // Fixed super.key syntax
  final user = FirebaseAuth.instance.currentUser;

  // Function to handle feedback submission
  void _submitFeedback(BuildContext context) {
    // TODO: Implement code to send feedback to Firebase
    // You can use a dialog to get feedback from the user
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Feedback'),
          content: TextFormField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Enter your feedback here...',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement code to send feedback to Firebase
                // Here you would send the feedback to Firebase and handle success/failure
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.login),
          ),
          IconButton(
            onPressed: () {
              // Navigate to the shopping cart page when the shopping cart icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShoppingCartPage()),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Center(
        child: Text(user!.email.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call function to handle feedback submission when FAB is pressed
          _submitFeedback(context);
        },
        tooltip: 'Provide Feedback',
        child: Icon(Icons.feedback),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
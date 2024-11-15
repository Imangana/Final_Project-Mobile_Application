import 'package:flutter/material.dart';
import 'register.dart'; // Import RegisterPage here

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Key to identify the form
  final TextEditingController _emailController = TextEditingController(); // Controller for email input
  final TextEditingController _passwordController = TextEditingController(); // Controller for password input
  bool _obscureText = true; // To toggle password visibility

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle the visibility of the password
    });
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Handle login action (you can add your logic here)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logging in...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: TextStyle(color: Colors.white)), // White text for AppBar title
         backgroundColor: Color.fromARGB(255, 38, 27, 102), // Brown background for AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // White back icon
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Container(
        color: Colors.grey[300], // Light gray background
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                width: 350, // Fixed width for the form
                height: 400, // Fixed height for the form
                padding: EdgeInsets.all(20),
                color: Colors.brown[50], // Light brown background for card
                child: Form(
                  key: _formKey, // Attach the form key
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(197, 0, 0, 0)),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController, // Set controller for email
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.brown),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown[200]!),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null; // Validation passed
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController, // Set controller for password
                        obscureText: _obscureText, // Toggle password visibility
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.brown),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.brown[200]!),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText ? Icons.visibility_off : Icons.visibility,
                              color: Colors.brown, // Color for visibility icon
                            ),
                            onPressed: _togglePasswordVisibility, // Toggle password visibility
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null; // Validation passed
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _login, // Call the login method
                        child: Text('Login Now', style: TextStyle(color: Colors.white)), // Button text color is white
                        style: ElevatedButton.styleFrom(
                           backgroundColor: Color.fromARGB(255, 0, 0, 0),  // Brown background for the button
                        ),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          // Navigate to Register Page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterPage()),
                          );
                        },
                        child: Text(
                          'Don\'t have an account? Register here',
                          style: TextStyle(color: Color.fromARGB(255, 2, 1, 10), fontWeight: FontWeight.bold), // Changed to bold
                          
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:example_test/provider/product_controller.dart';
import 'package:example_test/screen/select_product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                ),
                Image(image: AssetImage('assets/images/img_pumkin.png')),
                _buildTextFormFieldEmail(),
                SizedBox(
                  height: 20,
                ),
                _buildTextFormFieldPassword(),
                SizedBox(
                  height: 20,
                ),
                _buildButtonLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormFieldEmail() {
    return TextFormField(
      onChanged: (item) {},
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
        hintText: 'Email',
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildTextFormFieldPassword() {
    return TextFormField(
      onChanged: (item) {},
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.1),
          ),
        ),
        hintText: 'Password',
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildButtonLogin() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    ChangeNotifierProvider<ProductController>(
                      create: (BuildContext context) => ProductController(context: context),
                      child: SelectProductPage(),
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.deepOrange,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'login',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

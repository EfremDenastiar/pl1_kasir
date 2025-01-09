import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Admin.dart';


class Loginpage extends StatefulWidget {
  const Loginpage ({super.key});

  @override
  _Loginpagestate createState() => _Loginpagestate();
}

class _Loginpagestate extends State<Loginpage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == 'Administrator' && password == 'Admin123') {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => Admin()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Username atau password salah!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor: Colors.grey.shade400,
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/logo.png',
                      height: MediaQuery.of(context).size.height * 0.19,
                      width: MediaQuery.of(context).size.width * 0.19,
                      ),
                    SizedBox(width: MediaQuery.of(context).size.width *0.02,),
                    Text('OOKBUS',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF181D27),),)
                  ],
                ),
                Text('Sign In and Start Working', 
                  style: GoogleFonts.poppins(
                    color: Color(0xFF181D27),
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.027,
                  ),
                ),
                Text('Your sales data is just a login away',
                  style: GoogleFonts.poppins(
                    color: Color(0xFFA4A7AE),
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07,),
                Padding( 
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Username',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF181D27),
                      ),),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Type your username',
                          labelStyle: GoogleFonts.poppins(
                            color: Color(0xFFA4A7AE),
                            fontSize: MediaQuery.of(context).size.height * 0.015
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.2)),
                          )
                        )
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.013,),
                      Text('Password',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF181D27),
                      ),),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Type your password',
                          labelStyle: GoogleFonts.poppins(
                            color: Color(0xFFA4A7AE),
                            fontSize: MediaQuery.of(context).size.height * 0.015,
                          ),
                          suffixIcon: Icon(Icons.visibility_off, color: Colors.grey.withOpacity(0.2),),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.2)
                            )
                          )
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.013,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {},),
                                Text('Remember Me', 
                                style: GoogleFonts.poppins(
                                  color: Color(0xFFA4A7AE),
                                ),),
                              ],
                            )
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: ElevatedButton(
                          onPressed: _login, 
                          child: Text('Sign In',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold
                          ),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: ElevatedButton(
                          onPressed: (){}, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF181D27),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            )
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/google.png',
                                width: MediaQuery.of(context).size.width * 0.035,
                                height: MediaQuery.of(context).size.height * 0.035,),
                                SizedBox(width: MediaQuery.of(context).size.width * 0.015),
                                Text('Sign In With Google')
                              ],
                            ),
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ],
          ),
        ),
      ),
    );
  }
} 
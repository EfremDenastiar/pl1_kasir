import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup ({super.key});

  @override
  _Signupstate createState() => _Signupstate();
}

class _Signupstate extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.arrow_back_ios
          )),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 4, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/logo.png',
                  width: MediaQuery.of(context).size.width * 0.19,
                  height: MediaQuery.of(context).size.height * 0.19,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                Text('OOKBUS',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF181D27)
                  ),
                )
              ],
            ),
            Text('Sign Up and Start Working',
              style: GoogleFonts.poppins(
                color: Color(0xFF181D27),
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.027
              )
            ),
            Text('Your sales data is just a login away',
              style: GoogleFonts.poppins(
                color: Color(0xFFFA4A7AE),
                fontSize: MediaQuery.of(context).size.height * 0.018
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF181D27),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Input new username',
                      labelStyle: GoogleFonts.poppins(
                        color: Color(0xFFA4A7AE),
                        fontSize: MediaQuery.of(context).size.height * 0.015
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2)
                        )
                      )
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                  Text('Password',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF181D27),
                    )
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Input new password',
                      labelStyle: GoogleFonts.poppins(
                        color: Color(0xFFA4A7AE),
                        fontSize: MediaQuery.of(context).size.height * 0.015
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2)
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2)
                        )
                      )
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            onPressed: (){}, 
                            child: Text('Sign Up',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              )
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            onPressed: (){}, 
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/google.png',
                                  height: MediaQuery.of(context).size.height * 0.035,
                                  width: MediaQuery.of(context).size.width * 0.035,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width * 0.04,),
                                Text('Sign Up With Google')
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Color(0xFF181D27),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Admin extends StatefulWidget {
  const Admin ({super.key});

  @override
  _adminState createState() => _adminState();
}
class _adminState extends State<Admin> {
  // final List<Map<String, dynamic>> data = [
  //   {
  //     'text' : 'test'
  //   },
  //   {
  //     'text' : 'test2'
  //   },
  //   {
  //     'text' : 'test3'
  //   },
  //   {
  //     'text' : 'test4'
  //   }
  // ];
  List <Map<String, dynamic>> food= [];

  @override
  void initState(){
    super.initState();
    fetchFood();
  }

  Future<void> fetchFood() async{
    final response = await Supabase.instance.client.from('Produk').select();

    setState(() {
      food = List<Map<String, dynamic>>.from(response);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Barang',
          style: GoogleFonts.poppins(
            color: Color(0xFF181D27),
            fontSize: MediaQuery.of(context).size.height * 0.025
          ),),
      ),
      drawer: Drawer(

      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/logo.png',
                  width: MediaQuery.of(context).size.width * 0.19,
                  height: MediaQuery.of(context).size.height * 0.19
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                Text('OOKBUS',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF181D27),
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.025
                  )
                ),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.notifications)),
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.73,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle: GoogleFonts.poppins(

                      ),
                      prefixIcon: Icon(Icons.search),
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
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.sort))
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.height * 0.0019
                ), 
                itemCount: food.length,
                itemBuilder: (context, index) {
                  final list = food[index];
                  return Container(
                    // height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                        ],
                      )
                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
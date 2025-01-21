import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_ukk/Admin/EditProduk.dart';
import 'package:latihan_ukk/Admin/HapusProduk.dart';
import 'package:latihan_ukk/Admin/Signup.dart';
import 'package:latihan_ukk/Admin/TambahProduk.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  _adminState createState() => _adminState();
}

class _adminState extends State<Admin> {
  List<Map<String, dynamic>> food = [];
  List<Map<String, dynamic>> filteredFood = [];
  String category = 'all';

  @override
  void initState() {
    super.initState();
    fetchFood();
  }

  Future<void> fetchFood() async {
    final response = await Supabase.instance.client.from('Produk').select();
    setState(() {
      food = List<Map<String, dynamic>>.from(response);
      filteredFood = food;
    });
  }

  void filterfood(String category){
    setState(() {
      this.category = category;
      if(category == 'all') {
        filteredFood = food;
      }
      else {
        filteredFood = food.where((item) => item['typeFood'] == category).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'OOKBUS',
              style: GoogleFonts.poppins(
                  color: Color(0xFF181D27),
                  fontSize: MediaQuery.of(context).size.height * 0.025,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Image.asset(
            'assets/logo.png',
            height: MediaQuery.of(context).size.height * 0.19,
            width: MediaQuery.of(context).size.width * 0.19,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text(
                      'OOKBUS',
                      style: GoogleFonts.poppins(
                          color: Color(0xFF181D27),
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    )
                  ],
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'Pendataan Barang',
                    style: GoogleFonts.poppins(
                        color: Color(0xFF181D27),
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                  leading: Image.asset(
                    'assets/file-grey.png',
                    width: MediaQuery.of(context).size.width * 0.085,
                    height: MediaQuery.of(context).size.height * 0.085,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'Stok Barang',
                    style: GoogleFonts.poppins(
                        color: Color(0xFF181D27),
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                  leading: Image.asset(
                    'assets/shopping.png',
                    width: MediaQuery.of(context).size.width * 0.085,
                    height: MediaQuery.of(context).size.height * 0.085,
                  ),
                ),
                ListTile(
                  onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context)=> Signup())
                    );
                  },
                  title: Text(
                    'Registrasi',
                    style: GoogleFonts.poppins(
                        color: Color(0xFF181D27),
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                  leading: Image.asset(
                    'assets/user.png',
                    width: MediaQuery.of(context).size.height * 0.075,
                    height: MediaQuery.of(context).size.height * 0.075,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/file.png',
                  width: MediaQuery.of(context).size.width * 0.05,
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                // Icon(Icons.file_copy),
                // Image.asset('assets/logo.png',
                //   width: MediaQuery.of(context).size.width * 0.19,
                //   height: MediaQuery.of(context).size.height * 0.19
                // ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Text('List Barang',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF181D27),
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.height * 0.025
                  )
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.73,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Search',
                        labelStyle: GoogleFonts.poppins(),
                        prefixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.2))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.2)))),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.sort),
                  onSelected: filterfood,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'all',
                      child: Text('All')
                    ),
                    PopupMenuItem(
                      value: 'Drink',
                      child: Text('Drink')),
                    PopupMenuItem(
                      value: 'Food',
                      child: Text('Food')
                    ),
                  ])
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Expanded(
              child: ListView.builder(
                // padding: EdgeInsets.all(20),
                itemCount: filteredFood.length,
                itemBuilder: (context, index) {
                  final list = filteredFood[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width *0.2,
                      // height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(list['NamaProduk'] ?? 'No name',
                                style: GoogleFonts.poppins(
                                  color: Color(0xFF181D27),
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    height: MediaQuery.of(context).size.height * 0.043,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEFF8FF),
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Center(
                                      child: Text('${list['Stok']} Portions',
                                        style: GoogleFonts.poppins(
                                          color: Color(0xFF2E90FA)
                                        ),
                                      ),
                                    )
                                  ),
                                  Text('Rp${list['Harga']} / Portions',
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFFA4A7AE)
                                    ),
                                  )
                                ],
                              ),
                            ] 
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(''),
                            ],
                          ),
                          Column(
                            children: [
                              PopupMenuButton<String>(
                                icon: Icon(
                                  Icons.more_vert
                                ),
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => Editproduk(data: list,)));
                                    },
                                    child: Text('Edit')
                                  ),
                                  PopupMenuItem(
                                    onTap: (){
                                      showDeleteDialog(context, list['ProdukID']);
                                    },
                                    child: Text('Hapus')
                                  )
                                ]
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => Tambahproduk()
            )
          );
        },
        child: Icon(Icons.add)
      ),
    );
  }
}

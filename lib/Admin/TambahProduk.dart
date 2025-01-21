import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_ukk/Admin/Admin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Tambahproduk extends StatefulWidget{
  const Tambahproduk ({super.key});

  @override
  _Tambahprodukstate createState() => _Tambahprodukstate();
}

class _Tambahprodukstate extends State<Tambahproduk>{
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _stockController = TextEditingController();
  final _typeController = SingleValueDropDownController();

  Future<void> _addProduct() async{
    if (!_formkey.currentState!.validate()) {
      return;
    }
    final product = _productController.text;
    final price = _priceController.text;
    final stock = _stockController.text;
    final type = _typeController.dropDownValue!.value;

    final response = await Supabase.instance.client.from('Produk').insert([
      {
        'NamaProduk' : product,
        'Harga' : price,
        'Stok' : stock,
        'typeFood' : type
      }
    ]);

    if(response != null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${response}')
        )
      );
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Product Added'
          )
        )
      );
      _productController.clear();
      _priceController.clear();
      _stockController.clear();
      _typeController.dropDownValue = null;

      Navigator.pop(context, true);
      Navigator.pushReplacement(
        context, MaterialPageRoute(
          builder: (context) => Admin()
        )
      );
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.arrow_back_ios
          )
        )
      ),
      body: Padding(
        padding: EdgeInsets.only( right: 24, left: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Image.asset('assets/logomark.png',
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.08,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                  Text('Cashier App',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.027,
                      color: Color(0xFF181D27)
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text('Add Product',
                style: GoogleFonts.poppins(
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontWeight: FontWeight.w600
                )
              ),
            ),
            Text('Get your product information ready and start selling faster!',
              style: GoogleFonts.poppins(
                color: Color(0xFFA4A7AE),
                fontSize: MediaQuery.of(context).size.height * 0.02
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product Name',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF181D27)
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    TextFormField(
                      controller: _productController,
                      style: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.height * 0.02
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please enter product name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Product Name',
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.013,),
                    Text('Price',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF181D27)
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    TextFormField(
                      controller: _priceController,
                      style: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.height * 0.02
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter price';
                          }
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Price',
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.013,),
                    Text('Stock',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF181D27)
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    TextFormField(
                      controller: _stockController,
                      style: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.height * 0.02
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter stock';
                          }
                          return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Stock',
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.013,),
                    Text('Type'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    DropDownTextField(
                      controller: _typeController,
                      textStyle: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.height * 0.02
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select type';
                          }
                          return null;
                      },
                      textFieldDecoration: InputDecoration(
                        labelText: 'Enter Type',
                        labelStyle: GoogleFonts.poppins(
                          color: Color(0xFFA4A7AE),
                          fontSize: MediaQuery.of(context).size.height * 0.015
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2)
                          )
                        )
                      ),
                      dropDownList:[
                        DropDownValueModel(
                          name: 'Food', 
                          value: 'Food'
                        ),
                        DropDownValueModel(
                          name: 'Drink', 
                          value: 'Drink'
                        )
                      ]
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: ElevatedButton(
                          onPressed: _addProduct, 
                          child: Text('Add Product',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.height * 0.02
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10  )
                            )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
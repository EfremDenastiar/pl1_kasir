import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_ukk/Admin/Admin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Editproduk extends StatefulWidget{
  final Map data;
  const Editproduk ({super.key, required this.data});

  @override
  _editProdukstate createState() => _editProdukstate();
}

class _editProdukstate extends State<Editproduk>{
  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    var _productController = TextEditingController(text: widget.data['NamaProduk']);
    var _priceController = TextEditingController(text: widget.data['Harga'].toString());
    var _stockController = TextEditingController(text: widget.data['Stok'].toString());
    var _typeController = SingleValueDropDownController(data: DropDownValueModel(name: widget.data['typeFood'], value: widget.data['typeFood']));

    Future<void> _editProduct() async {
      if (!_formKey.currentState!.validate()){
        return;
      }
      final product = _productController.text;
      final price = _priceController.text;
      final stock = _stockController.text;
      final type = _typeController.dropDownValue!.value;
      // final response = await Supabase.instance.client.from('Produk').update({
      //   'NamaProduk' : product,
      //   'Harga' : price,
      //   'Stok' : stock,
      //   'typeFood' : type
      // }).eq('ProdukID', widget.data['ProdukID']);
      // print('Response: ${response.data}, Error: ${response.error}');

      // if(response != null){
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text('Error: ${response}'))
      //   );
      // }
      // else{
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(
      //         'Product Edited'
      //       )
      //     )
      //   );
      //   Navigator.pop(context);
      //   Navigator.pushReplacement(
      //     context, MaterialPageRoute(
      //       builder: (context) => Admin()
      //     )
      //   );
      // }

      try{
        await Supabase.instance.client.from('Produk').update({
          'NamaProduk' : product,
          'Harga' : price,
          'Stok' : stock,
          'typeFood' : type
        }).eq('ProdukID', widget.data['ProdukID']);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Product Edited'),
          )
        );

        Navigator.pop(context);
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(
            builder: (context) => Admin()
          )
        );
      }
      catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e')
          )
        );
      }
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.arrow_back_ios
          )
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 24, left: 24),
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
                      color: Color(0xFF181D27),
                      fontSize: MediaQuery.of(context).size.height * 0.027
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text('Edit Product',
                style: GoogleFonts.poppins(
                  color: Color(0xFF181D27),
                  fontSize: MediaQuery.of(context).size.height * 0.03,
                  fontWeight: FontWeight.w600
                ),),
            ),
            Text('Edit and Manage Your Products Seamlessly',
              style: GoogleFonts.poppins(
                color: Color(0xFFA4A7AE),
                fontSize: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product Name',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF181D27),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    TextFormField(
                      style: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                      controller: _productController,
                      decoration: InputDecoration(
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
                        color: Color(0xFF181D27),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    TextFormField(
                      style: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.height * 0.02,
                      ),
                      controller: _priceController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
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
                        color: Color(0xFF181D27),
                      ),
                    ),
                    TextFormField(
                      style: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.height * 0.02
                      ),
                      controller: _stockController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
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
                    Text('Type',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF181D27),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                    DropDownTextField(
                      controller: _typeController,
                      textStyle: GoogleFonts.poppins(
                        fontSize: MediaQuery.of(context).size.height * 0.02
                      ),
                      textFieldDecoration: InputDecoration(
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
                      dropDownList: [
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
                        width: MediaQuery.of(context).size.width *0.9,
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: ElevatedButton(
                          onPressed: _editProduct, 
                          child: Text('Save Edit',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.height * 0.02
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
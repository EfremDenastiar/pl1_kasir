import 'package:flutter/material.dart';
import 'package:latihan_ukk/Admin/Admin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DeleteProductDialog extends StatelessWidget {
  final int produkId;

  const DeleteProductDialog({Key? key, required this.produkId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Hapus Produk"),
      content: const Text("Apakah Anda yakin ingin menghapus produk ini?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: const Text("Batal"),
        ),
        TextButton(
          onPressed: () async {
            await _deleteProduct(produkId, context);
          },
          child: const Text(
            "Hapus",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  Future<void> _deleteProduct(int id, BuildContext context) async {
    // final supabase = Supabase.instance.client;

    try {
      final response = await Supabase.instance.client
          .from('Produk')
          .delete()
          .eq('ProdukID', id); 

      if (response == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Produk berhasil dihapus.")),
        );
      } else {
        throw response!;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal menghapus produk: $e")),
      );
    } finally {
      Navigator.of(context).pop(); 
      Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context) => Admin()));
    }
  }
}

void showDeleteDialog(BuildContext context, int produkId) {
  showDialog(
    context: context,
    builder: (context) => DeleteProductDialog(produkId: produkId),
  );
}

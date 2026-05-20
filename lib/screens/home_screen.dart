import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../core/transitions.dart'; // Vamos criar esse depois

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenCut', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.video_library, size: 120, color: Colors.white54),
            const SizedBox(height: 30),
            
            const Text(
              "Crie vídeos incríveis",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Estilo CapCut - 100% grátis",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            
            const SizedBox(height: 50),
            
            // Botão principal
            ElevatedButton.icon(
              onPressed: _importVideo,
              icon: const Icon(Icons.add, size: 32),
              label: const Text(
                "Novo Projeto",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
            
            const SizedBox(height: 20),
            const Text(
              "Toque para importar um vídeo",
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _importVideo() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.video,
      );

      if (result != null && result.files.single.path != null) {
        Fluttertoast.showToast(
          msg: "Vídeo importado! (Em breve abrirá o editor)",
          backgroundColor: Colors.green,
        );
        
        // Aqui vamos abrir o editor depois
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Editor em desenvolvimento...")),
          );
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Erro ao importar vídeo");
    }
  }
}

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const ARFurnitureApp());

class ARFurnitureApp extends StatelessWidget {
  const ARFurnitureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const ARScreen(),
    );
  }
}

class ARScreen extends StatelessWidget {
  const ARScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Mobilya Yerleştirme'),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          // 3D Modelin Gösterildiği Çerçeveli Alan
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: const ModelViewer(
                  backgroundColor: Color(0xFFEEEEEE),
                  src: 'https://modelviewer.dev/shared-assets/models/Chair.glb',
                  alt: 'AR Mobilya Modeli',
                  ar: true,
                  arModes: ['scene-viewer', 'webxr', 'quick-look'],
                  autoRotate: true,
                  cameraControls: true,
                  arScale: ArScale.auto,
                ),
              ),
            ),
          ),
          
          // Alt Kısımdaki Talimat Kartı
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Card(
              color: Colors.white70,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  '1. 3D modeli parmağınızla çevirin.\n2. Sağ alt köşedeki AR butonuna basarak kamerayı açın.\n3. Modeli zemine yerleştirin.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

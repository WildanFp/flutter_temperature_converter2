import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_temperature_converter2/perhitunganTerakhir.dart';
import 'package:flutter_temperature_converter2/riwayatPerhitungan.dart';
import 'KonversiSuhu.dart';
import 'TargetPerhitungan.dart';
import 'inputSuhu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const MyHomePage(title: 'converter suhu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController etInput = TextEditingController();
  List<String> listSatuanSuhu = ["kelvin", "reamor", "farenheit"];
  String selectedDropdown = "reamor";
  double hasilPerhitungan = 0;
  List<String> listHasil = [];

  void onDropdownChange(Object? value) {
    return setState(() {
      
      if (etInput.text.isNotEmpty) {
        switch (selectedDropdown) {
          case "kelvin":
            hasilPerhitungan = int.parse(etInput.text) + 273.15;
            listHasil.add("kelvin :");
            break;
          case "reamor":
            hasilPerhitungan = int.parse(etInput.text) * 4 / 5;
            listHasil.add("reamor :");
            break;
          case "farenheit":
            hasilPerhitungan = (int.parse(etInput.text) * 9 / 5) * 32;
            listHasil.add("farenheit :");
            break;
          default:
        }
        listHasil.add(selectedDropdown + " : " + hasilPerhitungan.toString());
      }
    });
  }

  void konversiSuhu() {
   
  }

  @override
  Widget build(BuildContext context) {
    var listItem = ["kelvin", "reamr"];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            inputSuhu(etInput: etInput, onPressed: konversiSuhu),
            const SizedBox(height: 8),
            targetPerhitungan(
              selectedDropdown: selectedDropdown,
              listSatuanSuhu: listSatuanSuhu,
              onDropDownChanged: onDropdownChange,
              onPressed: konversiSuhu,
          
            ),
            Text("hasil", style: TextStyle(fontSize: 20)),
            perhitunganTerakhir(hasilPerhitungan: hasilPerhitungan),
            SizedBox(height: 10),
            KonversiSuhu(
              onPressed: konversiSuhu,
            ),
            SizedBox(
              height: 20,
            ),
            Text("riwayat konversi", style: TextStyle(fontSize: 15)),
            riwayatPerhitungan(listHasil: listHasil),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class inputSuhu extends StatelessWidget {
  const inputSuhu({
    Key? key,
    required this.etInput, required void Function() onPressed,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: etInput,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Celcius',
        hintText: 'Enter temperature in celcius',
      ),
    );
  }
}
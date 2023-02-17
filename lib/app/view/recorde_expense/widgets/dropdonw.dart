import 'package:flutter/material.dart';

class Dropdonw extends StatelessWidget {
  final Function(String?)? onChanged;
  final String? selected;
  final String? title;

  const Dropdonw({
    Key? key,
    required this.onChanged,
    required this.dropOpcoes,
    this.selected,
    this.title,
  }) : super(key: key);
  final List<String> dropOpcoes;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Text(
          title!,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      value: selected,
      isExpanded: true,
      icon: const Icon(Icons.arrow_drop_down),
      style: const TextStyle(
        color: Colors.black87,
      ),
      onChanged: onChanged,
      items: dropOpcoes
          .map((op) => DropdownMenuItem(
                value: op,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Text(op),
                ),
              ))
          .toList(),
    );
  }
}

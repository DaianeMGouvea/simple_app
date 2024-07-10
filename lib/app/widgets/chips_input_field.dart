import 'package:flutter/material.dart';

class ChipInputWidget extends StatefulWidget {
  const ChipInputWidget({super.key});

  @override
  _ChipInputWidgetState createState() => _ChipInputWidgetState();
}

class _ChipInputWidgetState extends State<ChipInputWidget> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _chips = ['Palavra 1', 'Palavra 2'];

  void _addChip() {
    final text = _controller.text;
    if (text.isNotEmpty) {
      setState(() {
        _chips.add(text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: const InputDecoration(
              labelText: 'Choose options', border: InputBorder.none),
          controller: _controller,
          onSubmitted: (value) => _addChip(),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Wrap(
              spacing: 8.0,
              children: _chips.map((chip) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _chips.remove(chip);
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFD72AD),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          chip,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

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
          height: 46,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFB6BBC0)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            child: Wrap(
              spacing: 42.0,
              children: _chips.map((chip) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _chips.remove(chip);
                    });
                  },
                  child: Container(
                    height: 32,
                    width: 122,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFD72AD),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

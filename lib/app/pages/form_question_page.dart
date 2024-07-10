import 'package:flutter/material.dart';
import 'package:simple_app/app/widgets/chips_input_field.dart';
import '../models/form_question_model.dart';

class FormQuestionPage extends StatefulWidget {
  const FormQuestionPage({super.key});

  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormQuestionPage> {
  final FormQuestionModel _model = FormQuestionModel();
  final TextEditingController _choiceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double _sliderValue = 0.2;

  @override
  void initState() {
    super.initState();
    _model.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.removeListener(() {});
    _choiceController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulário salvo com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                    'Aqui teremos duas linhas para escrever algumas palavras !'),
                const SizedBox(height: 8),
                const Text(
                    'E aqui também, mas duas linhas para descrever mais.'),
                const SizedBox(height: 16),
                const ChipInputWidget(),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: 'opção 1',
                  items: <String>['opção 1', 'opção 2', 'opção 3']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {},
                  decoration: const InputDecoration(labelText: 'Drop Down'),
                ),
                const SizedBox(height: 16),
                const Text('Pergunta de 01?'),
                Slider(
                  activeColor: Color(0XFF2E3192),
                  value: _sliderValue,
                  onChanged: (newValue) {
                    setState(() {
                      _sliderValue = newValue;
                    });
                  },
                  min: 0,
                  max: 1,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _saveForm,
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

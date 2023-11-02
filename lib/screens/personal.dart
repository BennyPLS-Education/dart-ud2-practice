import 'package:flutter/material.dart';
import 'package:practice/dataclass/persona.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage() : super(key: null);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  Persona persona = Persona.empty();

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments;

    if (arg != null) {
      setState(() {
        persona = arg as Persona;
      });
      _nameController.text = persona.name;
      _surnameController.text = persona.surname;
      _emailController.text = persona.email;
      _passwordController.text = persona.password;
      _dateController.text =
          "${persona.bornDate.year}-${persona.bornDate.month}-${persona.bornDate.day}";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aguilo Pons'),
        automaticallyImplyLeading: false,
      ),
      body: _body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'Personal',
        icon: const Icon(Icons.save),
        label: const Text('Save'),
        onPressed: () {
          Navigator.of(context).pop(persona);
        },
      ),
    );
  }

  _body() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      children: [
        _userName(),
        _spacer(),
        _userSurname(),
        _spacer(),
        _userEmail(),
        _spacer(),
        _userPassword(),
        _spacer(),
        _userBornDate(context),
      ],
    );
  }

  Widget _spacer() {
    return const Divider(color: Colors.black);
  }

  Widget _userName() {
    return TextField(
      controller: _nameController,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        hintText: 'Nom de l\'usuari',
        labelText: 'Nom',
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          persona.name = valor;
        });
      },
    );
  }

  Widget _userSurname() {
    return TextField(
      controller: _surnameController,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        hintText: 'Cognom de l\'usuari',
        labelText: 'Cognom',
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          persona.surname = valor;
        });
      },
    );
  }

  Widget _userEmail() {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Correu electrònic',
        labelText: 'Correu electrònic',
        icon: const Icon(Icons.email),
      ),
      onChanged: (valor) => setState(() {
        persona.email = valor;
      }),
    );
  }

  Widget _userPassword() {
    return TextField(
      controller: _passwordController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Password',
        labelText: 'Password',
        icon: const Icon(Icons.lock),
      ),
      obscureText: true,
      onChanged: (valor) {
        setState(() {
          persona.password = valor;
        });
      },
    );
  }

  /// This method returns a TextField with a date picker dialog
  Widget _userBornDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _dateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Data naixement',
        labelText: 'Data naixement',
        icon: const Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  /// This method shows a date picker dialog and updates the date field
  void _selectDate(BuildContext context) async {
    int maxLived = DateTime.now().year.toInt() - 100;

    DateTime? picked = await showDatePicker(
      locale: const Locale('es', 'ES'),
      context: context,
      initialDate: persona.bornDate,
      firstDate: DateTime(maxLived),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        persona.bornDate = picked;
        _dateController.text = "${picked.year}-${picked.month}-${picked.day}";
      });
    }
  }
}

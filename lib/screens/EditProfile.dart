import 'package:delivery_app/providers/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  bool _stateSwitch = false;
  late TextEditingController nameAndSurnameController;
  late TextEditingController passwordController;
  Icon eyeIcon = Icon(Icons.visibility_off);
  bool isPasswordVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameAndSurnameController = TextEditingController();
    passwordController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        nameAndSurnameController.text =
            context.read<SessionProvider>().session.name;
        passwordController.text =
            context.read<SessionProvider>().session.password;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRX-cskA2FbOzFi7ACNiGruheINgAXEqFL1TQ&s",
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text('Error loading image'));
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                  "Bienvenido, ${context.watch<SessionProvider>().session.name}",
                  style: TextStyle(fontSize: 20)),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Nombre y Apellido", style: TextStyle(fontSize: 16)),
            Center(
              child: Container(
                width: 350,
                height: 50,
                child: BoxForms(
                  controlador: nameAndSurnameController,
                  isPasword: false,
                  label: "Nombre y Apellido",
                  placeholder: "${context.watch<SessionProvider>().session.name}",
                  validatorText: 'Por favor ingresa tu nombre y apellido',
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text("Nombre y Apellido", style: TextStyle(fontSize: 16)),
            Center(
              child: Row(
                children: [
                  Container(
                    width: 350,
                    height: 50,
                    child: Row(
                      children: [
                        BoxForms(
                          controlador: passwordController,
                          isPasword: isPasswordVisible,
                          label: "Password",
                          placeholder: "Password",
                          validatorText: 'Por favor ingresa tu nombre y apellido',
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (eyeIcon.icon == Icons.visibility_off) {
                            isPasswordVisible = false;
                            eyeIcon = Icon(Icons.visibility);
                          } else {
                            isPasswordVisible = true;
                            eyeIcon = Icon(Icons.visibility_off);
                          }
                        });
                      },
                      icon: eyeIcon)
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 250,
              child: SwitchListTile(
                title: Text("Modo Oscuro"),
                value: _stateSwitch, onChanged: (_) {
                 setState(() {
                  _stateSwitch = !_stateSwitch;
                 });
              },),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
                child: ElevatedButton(child: Text('Regresar'),onPressed: (){
                context.pop();
              },),
            )
          ],
        ),
      ),
    );
  }
}

class BoxForms extends StatefulWidget {
  final TextEditingController controlador;
  final bool isPasword;
  final String label;
  final String placeholder;
  final validatorText;

  const BoxForms(
      {super.key,
      required this.controlador,
      required this.isPasword,
      required this.label,
      required this.placeholder,
      this.validatorText});

  @override
  State<BoxForms> createState() => _BoxFormsState();
}

class _BoxFormsState extends State<BoxForms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // Cambia la posición de la sombra
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(30),
        color:
            Colors.transparent, // Asegúrate de que el Material sea transparente
        child: Ink(
          decoration: BoxDecoration(
            color: Color(0xFFf1f1f1),
            borderRadius: BorderRadius.circular(30),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              // Esto asegura que el campo de texto obtenga el foco al tocar
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (widget.controlador.text.isEmpty) {
                    return widget.validatorText;
                  } else {
                    return null;
                  }
                },
                controller: widget.controlador,
                obscureText: widget.isPasword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
                  labelText: widget.label,
                  hintText: widget.placeholder,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

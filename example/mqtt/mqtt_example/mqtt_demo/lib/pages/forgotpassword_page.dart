import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {

  const ForgotPasswordPage({super.key});

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Se ha enviado un correo electrónico de restablecimiento de contraseña')),
      );
    } catch (error) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al enviar el correo electrónico de restablecimiento de contraseña')),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Contraseña'),
      ),
      body: Stack(
        children: [
          const FondoPassword(),
          ContenidoPassword(resetPassword: resetPassword),
        ],
      ),
    );
  }
}

class FondoPassword extends StatelessWidget {
  const FondoPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade300, Colors.blue],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
    );
  }
}

class ContenidoPassword extends StatefulWidget {
  final Function(String, BuildContext) resetPassword;
  const ContenidoPassword({super.key, required this.resetPassword});

  @override
  State<ContenidoPassword> createState() => _ContenidoState();
}

class _ContenidoState extends State<ContenidoPassword> {
  final TextEditingController _emailControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Restablecer Contraseña',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          DatosPassword(resetPassword: widget.resetPassword),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class DatosPassword extends StatelessWidget {
  final Function(String, BuildContext) resetPassword;
   DatosPassword({super.key, required this.resetPassword});

  final TextEditingController _emailControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Correo electrónico',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            controller: _emailControllerPassword,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Ingresa tu correo electrónico',
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {
              resetPassword(_emailControllerPassword.text, context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xff142047),
              ),
            ),
            child: const Text('Restablecer Contraseña',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
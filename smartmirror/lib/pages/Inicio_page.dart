import 'package:flutter/material.dart';
import 'config_page.dart'; 

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Fondo(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoWidget(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ConfigPage()),
                    );
                  },
                  child: const Text('Ingresar'),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'SmartMirror',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Fondo extends StatelessWidget {
  const Fondo({super.key});

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

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        'web/icons/LogoSmart.jpg',
        fit: BoxFit.contain,
      ),
    );
  }
}

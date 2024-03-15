import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override

  // ignore: library_private_types_in_public_api
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  bool mostrarNoticias = false;
  bool mostrarClima = false;
  bool mostrarCalendario = false;
  bool recibirNotificaciones = false;
  bool mostrarFraseMotivacional = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0), 
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Mostrar noticias',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Switch(
                    value: mostrarNoticias,
                    onChanged: (value) {
                      setState(() {
                        mostrarNoticias = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0), 
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Mostrar clima',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Switch(
                    value: mostrarClima,
                    onChanged: (value) {
                      setState(() {
                        mostrarClima = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0), 
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Mostrar calendario',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Switch(
                    value: mostrarCalendario,
                    onChanged: (value) {
                      setState(() {
                        mostrarCalendario = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recibir notificaciones',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Switch(
                    value: recibirNotificaciones,
                    onChanged: (value) {
                      setState(() {
                        recibirNotificaciones = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0), 
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Mostrar frase motivacional',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Switch(
                    value: mostrarFraseMotivacional,
                    onChanged: (value) {
                      setState(() {
                        mostrarFraseMotivacional = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
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
            _buildConfigItem(
              'Mostrar noticias',
              mostrarNoticias,
              (value) {
                setState(() {
                  mostrarNoticias = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildConfigItem(
              'Mostrar clima',
              mostrarClima,
              (value) {
                setState(() {
                  mostrarClima = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildConfigItem(
              'Mostrar calendario',
              mostrarCalendario,
              (value) {
                setState(() {
                  mostrarCalendario = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildConfigItem(
              'Recibir notificaciones',
              recibirNotificaciones,
              (value) {
                setState(() {
                  recibirNotificaciones = value;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildConfigItem(
              'Mostrar frase motivacional',
              mostrarFraseMotivacional,
              (value) {
                setState(() {
                  mostrarFraseMotivacional = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigItem(
    String label,
    bool value,
    Function(bool) onChanged,
  ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18.0),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

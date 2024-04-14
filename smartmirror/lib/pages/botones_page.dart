import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class BotonesPage extends StatelessWidget {
  final MqttServerClient client = MqttServerClient('192.168.0.124', '1883');

  BotonesPage({Key? key}) : super(key: key) {
    // Configurar cliente MQTT
    client.logging(on: false);
    client.keepAlivePeriod = 60;
    client.onDisconnected = () => onDisconnected(client);
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;

    final connMess = MqttConnectMessage()
        .withClientIdentifier('dart_client')
        .withWillTopic('testEspejo')
        .withWillMessage('My Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    print('Client connecting....');
    client.connectionMessage = connMess;

    // Conectar al cliente MQTT al construir la página
    _connectClient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control del espejo'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF73726f),
              Color(0xFF73726f),
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // Cuando se presiona el botón "Encender", envía el mensaje "show"
                  await _sendMessage('show');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  backgroundColor: const Color(0xFF1082e0),
                ),
                child: const Text(
                  'Encender',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Cuando se presiona el botón "Apagar", envía el mensaje "hide"
                  await _sendMessage('hide');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  backgroundColor: const Color(0xFF1082e0),
                ),
                child: const Text(
                  'Apagar',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para conectar el cliente MQTT
  Future<void> _connectClient() async {
    try {
      await client.connect();
      print('Client connected');
    } on Exception catch (e) {
      print('Error al conectar el cliente MQTT: $e');
    }
  }

  // Método para enviar un mensaje MQTT
  Future<void> _sendMessage(String message) async {
    final pubTopic = 'testEspejo';

    final builder = MqttClientPayloadBuilder();
    builder.addString(message);

    print('Publishing message: $message');
    client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);
  }

  // Métodos de devolución de llamada MQTT
  void onSubscribed(String topic) {
    print('Subscription confirmed for topic $topic');
  }

  void onDisconnected(MqttServerClient client) {
    print('OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      print('OnDisconnected callback is solicited, this is correct');
    }
  }

  void onConnected() {
    print('OnConnected client callback - Client connection was successful');
  }

  void pong() {
    print('Ping response client callback invoked');
  }
}

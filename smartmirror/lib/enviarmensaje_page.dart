import 'dart:async';
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

void main() {
  // Llama a la función _sendMessage desde cualquier parte de tu código
  _sendMessage('mensaje');
}

Future<void> _sendMessage(String message) async {
  final client = MqttServerClient('192.168.137.203', '1883');

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

  try {
    await client.connect();
  } on NoConnectionException catch (e) {
    print('Client exception: $e');
    client.disconnect();
  } on SocketException catch (e) {
    print('Socket exception: $e');
    client.disconnect();
  }

  if (client.connectionStatus!.state == MqttConnectionState.connected) {
    print('Client connected');
  } else {
    print(
        'Client connection failed - disconnecting, status is ${client.connectionStatus}');
    client.disconnect();
    exit(-1);
  }

  final pubTopic = 'testEspejo';

  final builder = MqttClientPayloadBuilder();
  builder.addString(message);

  print('Publishing message: $message');
  client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);

  await MqttUtilities.asyncSleep(2);

  print('Disconnecting');
  client.disconnect();
}

/// The subscribed callback
void onSubscribed(String topic) {
  print('Subscription confirmed for topic $topic');
}

/// The unsolicited disconnect callback
void onDisconnected(MqttServerClient client) {
  print('OnDisconnected client callback - Client disconnection');
  if (client.connectionStatus!.disconnectionOrigin ==
      MqttDisconnectionOrigin.solicited) {
    print('OnDisconnected callback is solicited, this is correct');
  }
  exit(-1);
}

/// The successful connect callback
void onConnected() {
  print('OnConnected client callback - Client connection was successful');
}

/// Pong callback
void pong() {
  print('Ping response client callback invoked');
}

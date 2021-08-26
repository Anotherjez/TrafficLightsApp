import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class HomeController extends GetxController {
  MqttServerClient client =
      MqttServerClient.withPort('HOST_NAME', 'android', 1883);
  RxBool isGreen = false.obs;
  RxBool isYellow = false.obs;
  RxBool isWaiting = false.obs;

  @override
  void onInit() {
    connect();
    super.onInit();
  }

  Future<MqttServerClient> connect() async {
    void _onConnected() {
      client.subscribe("traffic-lights", MqttQos.exactlyOnce);

      const pubTopic = 'identify';
      final builder = MqttClientPayloadBuilder();
      builder.addString('Santo Domingo, Av. Maximo Gomez');
      client.publishMessage(pubTopic, MqttQos.atMostOnce, builder.payload!);
    }

    client.logging(on: true);
    client.onConnected = _onConnected;

    try {
      await client.connect();
    } catch (e) {
      print('Exception: $e');
      client.disconnect();
    }

    client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      if (payload == 'green') {
        this.isGreen.value = true;
        this.isYellow.value = false;
        this.isWaiting.value = false;
      } else if (payload == 'yellow') {
        this.isYellow.value = true;
        this.isWaiting.value = false;
        this.isGreen.value = false;
      } else {
        this.isYellow.value = false;
        this.isWaiting.value = false;
        this.isGreen.value = false;
        vibrate();
      }
    });

    return client;
  }

  vibrate() {
    final Iterable<Duration> pauses = [
      const Duration(milliseconds: 500),
      const Duration(milliseconds: 1000),
      const Duration(milliseconds: 500),
    ];
    Vibrate.vibrateWithPauses(pauses);
  }

  void publishRequestStop() {
    final builder = MqttClientPayloadBuilder();
    builder.addString('waiting');
    client.publishMessage('people', MqttQos.atLeastOnce, builder.payload!);
    this.isWaiting.value = true;
  }
}

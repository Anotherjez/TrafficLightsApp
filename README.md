# Traffic Lights App

Aplicación móvil del proyecto final IoT - ITLA C2-2021, desarrollada en Flutter que se comunica con el [semaforo](https://github.com/Anotherjez/TrafficLightsWebApp) a través de un broker en el protocolo mqtt. Esta aplicación consiste en notificarle al usuario el estado del semaforo, si puede cruzar o no y le permite al usuario solicitar un cruce peatonal, el ejecutará un proceso interno para reducir el tiempo de la señal activa.

## 💻 Requisitos

- Cualquier sistema operativo (es decir, MacOS X, Linux, Windows)
- Cualquier IDE con Flutter SDK instalado (es decir, IntelliJ, Android Studio, VSCode, etc.)
- Un poco de conocimiento de Dart y Flutter.
- Mqtt Server inicializado (como Mosquitto)

## Getting started

#### 1. [Setup Flutter](https://flutter.dev/docs/get-started/install)

#### 2. Clone the repo

```sh
$ git clone https://github.com/Anotherjez/TrafficLightsApp.git
$ cd TrafficLightsApp/
```

#### 3. Setup Mqtt broker

En /lib/controllers/home_controller.dart, cambia el server hostname y el server port por los de tu servidor.

```
  MqttServerClient client =
      MqttServerClient.withPort('HOST_NAME', 'android', 1883);
```

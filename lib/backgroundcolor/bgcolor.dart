import 'package:circles_background/circles_background.dart';
import 'package:flutter/material.dart';

class BackgroundColor {
  static theme() {
    final ThemeData dark = ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(backgroundColor: Colors.black));
    return dark;
  }

  static const backgroundcolor = Color.fromARGB(255, 174, 222, 240);
  static const gradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 83, 138, 199),
      Color.fromARGB(255, 255, 255, 255),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final List<CircleInfo> circles = [
    CircleInfo(
        size: const Size(300, 500),
        color: Colors.blue,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(200)),
        alignment: Alignment.topRight),
    CircleInfo(
        size: const Size(500, 500),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[800]!, Colors.white]),
        borderRadius: const BorderRadius.only(),
        alignment: Alignment.topLeft),
    CircleInfo(
        size: const Size(500, 500),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[800]!, Colors.white]),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50), topLeft: Radius.circular(150)),
        alignment: Alignment.bottomRight),
  ];
  static final List<CircleInfo> circles1 = [
    CircleInfo(
        size: const Size(200, 200),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[800]!, Colors.white]),
        // color: Colors.blue,
        borderRadius: const BorderRadius.only(),
        alignment: Alignment.topRight),
    CircleInfo(
        size: const Size(200, 200),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[800]!, Colors.white]),
        borderRadius: const BorderRadius.only(),
        alignment: Alignment.topLeft),
    CircleInfo(
        size: const Size(200, 200),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[800]!, Colors.white]),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50), topLeft: Radius.circular(150)),
        alignment: Alignment.bottomRight),
  ];
}

import 'package:flutter/material.dart';
const shadowList = <Shadow>[
      Shadow(
        offset: Offset(1, 1),
        blurRadius: 3.0,
        color: Colors.grey,
      ),
    ];

const shadowBox = <BoxShadow>[
  BoxShadow(
    color: Color.fromARGB(80, 0, 0, 0),
    spreadRadius: 5,
    blurRadius: 10,
    offset: Offset(0, 1), // changes position of shadow
  ),
];
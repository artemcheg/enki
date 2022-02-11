import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' as gmap;
import 'dart:ui' as ui;

import 'package:web_site/resources/string_res.dart';

Widget myMap(width, height) {
  String htmlId = "7";

  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final latLng = gmap.LatLng(44.95231081794478, 34.11482289494804);

    final mapOptions = gmap.MapOptions()
      ..zoom = 15
      ..minZoom = 10
      ..maxZoom = 20
      ..scrollwheel = false
      ..center = latLng;

    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%";
    final map = gmap.GMap(elem, mapOptions);

    final icon = gmap.Icon()
      ..scaledSize = gmap.Size(70, 60)
      ..origin = gmap.Point(0, 0)
      ..anchor = gmap.Point(0, 60)
      ..url = 'assets/flag.png';




    final marker = gmap.Marker(gmap.MarkerOptions()
      ..position = latLng
      ..map = map
      ..clickable = true
      ..icon = icon
      ..title = 'Строительная компания ENKI');



    final infowindow = gmap.InfoWindow(
        gmap.InfoWindowOptions()..content = StringRes.mapMarkerInfo);
    marker.onClick.listen((event) {
      infowindow.open(map, marker);
    });
    infowindow.open(map, marker);
    return elem;
  });

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
    child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
          boxShadow:  [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(
                  0, 3), // changes position of shadow
            ),
          ],),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child:HtmlElementView(viewType: htmlId),
        )),
  );



}

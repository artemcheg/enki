import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' as gmap;
import 'package:web_site/resources/html_res.dart';
import 'dart:ui' as ui;

Widget mapContact(width, height) {
  String htmlId = "8";
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final latLng = gmap.LatLng(44.95231081794478, 34.11482289494804);
    final mapOptions = gmap.MapOptions()
      ..zoom = 15
      ..minZoom = 10
      ..maxZoom = 20
      ..center = latLng;


    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%";
    final map = gmap.GMap(elem, mapOptions);


    final icon = gmap.Icon()
      ..scaledSize = gmap.Size(40, 55)
      ..origin = gmap.Point(0, 0)
      ..anchor = gmap.Point(20, 55)
      ..url = 'assets/map/flag.png';




    final marker = gmap.Marker(gmap.MarkerOptions()
      ..position = latLng
      ..map = map
      ..clickable = true
      ..icon = icon
      ..title = 'Строительная компания ENKI');



    final infowindow = gmap.InfoWindow(
        gmap.InfoWindowOptions()..content = HtmlRes.mapMarkerInfo);
    marker.onClick.listen((event) {
      infowindow.open(map, marker);
    });
    infowindow.open(map, marker);
    return elem;
  });

  return Container(
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
      ));
}
import 'dart:html';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' as gmap;
import 'dart:ui' as ui;
import '../resources/html_res.dart';

Widget myMap(width, height) {
  String htmlId = "7";
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final latLng = gmap.LatLng(44.7248815497487, 34.00923624811407);
    const myMapTypeId = 'custom_style';
    final mapOptions = gmap.MapOptions()
      ..zoom = 9
      ..minZoom = 9
      ..maxZoom = 12
      ..mapTypeControlOptions = (gmap.MapTypeControlOptions()
      ..mapTypeIds = [gmap.MapTypeId.ROADMAP,myMapTypeId])
      ..mapTypeId = myMapTypeId
      ..center = latLng;


    final elem = DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%";
    final map = gmap.GMap(elem, mapOptions);
    final styledMapTypeOptions = gmap.StyledMapTypeOptions()..name = 'Выполненые объекты';
    final customMapType = gmap.StyledMapType(roadAtlasStyles, styledMapTypeOptions);
    map.mapTypes!.set(myMapTypeId, customMapType);


    final marker = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.675790804298124, 34.41000774576945)
      ..map = map
      ..clickable = true
      ..title = 'Алушта');

    final infowindow = gmap.InfoWindow(
        gmap.InfoWindowOptions()
          ..content = HtmlRes.mapMarkerAlushta);
    marker.onClick.listen((event) {
      infowindow.open(map, marker);
    });

    final marker2 = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.490633337164894, 34.15343605128542)
      ..map = map
      ..clickable = true
      ..title = 'Ялта');

    final marker3 = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.955539665693635, 34.10680972420991)
      ..map = map
      ..clickable = true
      ..title = 'Симферополь');

    final marker4 = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.63268610508009, 33.86200003047836)
      ..map = map
      ..clickable = true
      ..title = 'Бельбек');




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

final roadAtlasStyles = <gmap.MapTypeStyle>[
  gmap.MapTypeStyle()
    ..elementType = 'geometry'
    ..stylers = [
      jsify({'color': '#f5f5f5'}),
    ],
  gmap.MapTypeStyle()
    ..elementType = 'labels.icon'
    ..stylers = [
      jsify({'visibility': 'off'}),
    ],
  gmap.MapTypeStyle()
    ..elementType = 'labels.text.fill'
    ..stylers = [
      jsify({'color': '#616161'}),
    ],
  gmap.MapTypeStyle()
    ..elementType = 'labels.text.stroke'
    ..stylers = [
      jsify({'color': '#f5f5f5'}),
    ],
  gmap.MapTypeStyle()
    ..elementType = 'geometry'
    ..featureType = "administrative"
    ..stylers = [
      jsify({'visibility': 'off'}),
    ],
  gmap.MapTypeStyle()
    ..elementType = 'labels'
    ..featureType = "administrative.land_parcel"
    ..stylers = [
      jsify({'visibility': 'off'}),
    ],
  gmap.MapTypeStyle()
    ..elementType = 'labels.text.fill'
    ..featureType = "administrative.land_parcel"
    ..stylers = [
      jsify({'color': '#bdbdbd'}),
    ],
  // gmap.MapTypeStyle()
  //   ..elementType = 'poi'
  //   ..stylers = [
  //     jsify({'visibility': 'off'}),
  //   ],
  // gmap.MapTypeStyle()
  //   ..elementType = 'geometry'
  //   ..featureType = "poi"
  //   ..stylers = [
  //     jsify({'color': '#eeeeee'}),
  //   ],
  // gmap.MapTypeStyle()
  //   ..featureType = 'poi'
  //   ..elementType = 'labels.text'
  //   ..stylers = [
  //     jsify({'visibility': 'off'}),
  //   ],
  // gmap.MapTypeStyle()
  //   ..elementType = 'labels.text.fill'
  //   ..featureType = "poi"
  //   ..stylers = [
  //     jsify({'color': '#757575'}),
  //   ],
  // gmap.MapTypeStyle()
  //   ..elementType = 'geometry'
  //   ..featureType = "poi.park"
  //   ..stylers = [
  //     jsify({'color': '#e5e5e5'}),
  //   ],
  // gmap.MapTypeStyle()
  //   ..featureType = "poi.park"
  //   ..elementType = 'labels.text.fill'
  //   ..stylers = [
  //     jsify({'color': '#9e9e9e'}),
  //   ],
  gmap.MapTypeStyle()
    ..featureType = "road"
    ..elementType = 'geometry'
    ..stylers = [
      jsify({'color': '#ffffff'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = 'road'
    ..elementType = 'labels.icon'
    ..stylers = [
      jsify({'visibility': 'off'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = 'road.arterial'
    ..stylers = [
      jsify({'visibility': 'off'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = "road.arterial"
    ..elementType = 'labels.text.fill'
    ..stylers = [
      jsify({'color': '#757575'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = "road.highway"
    ..elementType = 'geometry'
    ..stylers = [
      jsify({'color': '#dadada'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = 'road.highway'
    ..elementType = 'labels'
    ..stylers = [
      jsify({'visibility': 'off'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = "road.highway"
    ..elementType = 'labels.text.fill'
    ..stylers = [
      jsify({'color': '#616161'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = 'road.local'
    ..stylers = [
      jsify({'visibility': 'off'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = 'road.local'
    ..elementType = 'labels'
    ..stylers = [
      jsify({'visibility': 'off'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = "road.local"
    ..elementType = 'labels.text.fill'
    ..stylers = [
      jsify({'color': '#9e9e9e'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = 'transit'
    ..stylers = [
      jsify({'visibility': 'off'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = "transit.line"
    ..elementType = 'geometry'
    ..stylers = [
      jsify({'color': '#e5e5e5'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = "transit.station"
    ..elementType = 'geometry'
    ..stylers = [
      jsify({'color': '#eeeeee'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = "water"
    ..elementType = 'geometry'
    ..stylers = [
      jsify({'color': '#c9c9c9'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = "water"
    ..elementType = 'labels.text.fill'
    ..stylers = [
      jsify({'color': '#9e9e9e'}),
    ],
];



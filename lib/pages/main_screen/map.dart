import 'dart:html' as html;
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart' as gmap;
import 'dart:ui' as ui;

import 'package:web_site/widgets/small_changes.dart';

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
        ..mapTypeIds = [gmap.MapTypeId.ROADMAP, myMapTypeId])
      ..mapTypeId = myMapTypeId
      ..center = latLng;

    final elem = html.DivElement()
      ..id = htmlId
      ..style.width = "100%"
      ..style.height = "100%";
    final map = gmap.GMap(elem, mapOptions);
    final styledMapTypeOptions = gmap.StyledMapTypeOptions()
      ..name = 'Объекты';
    final customMapType =
        gmap.StyledMapType(_roadAtlasStyles, styledMapTypeOptions);
    map.mapTypes!.set(myMapTypeId, customMapType);

    final markerAlushta = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.675790804298124, 34.41000774576945)
      ..map = map
      ..clickable = true
      ..title = 'Алушта');

    // final infoWindow = gmap.InfoWindow(gmap.InfoWindowOptions()
    //   ..content =_markers('Отделка в Алуште', '150m2', 'alushta.jpg'));
    // markerAlushta.onClick.listen((event) {
    //   infoWindow.open(map, markerAlushta);
    // });

    final markerYalta = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.490996694088665, 34.15309234251512)
      ..map = map
      ..clickable = true
      ..title = 'Ялта');

    final markerPartenit = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.57712988358715, 34.34261608073508)
      ..map = map
      ..clickable = true
      ..title = 'Партенит');

    final markerZaprudnoe = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.59307681593301, 34.3181235273855)
      ..map = map
      ..clickable = true
      ..title = 'Запрудное');

    final markerAlupka = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.414413977617556, 34.037883429847)
      ..map = map
      ..clickable = true
      ..title = 'Алупка');

    final markerDolasi = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.535337617168835, 34.18622852451088)
      ..map = map
      ..clickable = true
      ..title = 'Санаторий «Доласы»');

    final markerSimferopol = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.94740012445997, 34.109212983411304)
      ..map = map
      ..clickable = true
      ..title = 'Симферополь');

    final markerMirnoe = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.97029576468402, 34.05912446714529)
      ..map = map
      ..clickable = true
      ..title = 'Мирное');

    final markerStrogonovka = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.942557821047046, 34.18625183616007)
      ..map = map
      ..clickable = true
      ..title = 'Строгоновка');

    final markerBeloe = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.992745874649216, 34.12402460449341)
      ..map = map
      ..clickable = true
      ..title = 'Белое');

    final markerBeloglinka = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.99335221873771, 34.041331886179364)
      ..map = map
      ..clickable = true
      ..title = 'Белоглинка');

    final markerTrudovoe = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.99363975996104, 34.20277866163557)
      ..map = map
      ..clickable = true
      ..title = 'Трудовое');

    final markerUrojainoe = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(45.05576931553086, 34.12081314698927)
      ..map = map
      ..clickable = true
      ..title = 'Урожайное');

    final markerIvanovka = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.9392576687307, 34.254445575295634)
      ..map = map
      ..clickable = true
      ..title = 'Ивановка');

    final markerFontani = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.90412739303602, 34.073908772869565)
      ..map = map
      ..clickable = true
      ..title = 'Фонтаны');

    final markerGvardeiskoe = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(45.114186354133984, 34.02333055975897)
      ..map = map
      ..clickable = true
      ..title = 'Гвардейское');

    final markerSevastopol = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.574245028341636, 33.67719018020914)
      ..map = map
      ..clickable = true
      ..title = 'Севастополь');

    final markerBelbek = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.69241490184108, 33.590561189743184)
      ..map = map
      ..clickable = true
      ..title = 'Бельбек');

    final markerKoktebel = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.96639101693612, 35.24360343266249)
      ..map = map
      ..clickable = true
      ..title = 'Коктебель');

    final markerSudak = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.850174722827504, 34.97512733797544)
      ..map = map
      ..clickable = true
      ..title = 'Судак');

    final markerKerch = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(45.35686398729864, 36.465779246818634)
      ..map = map
      ..clickable = true
      ..title = 'Керчь');

    final markerPionerskoe = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.88046342835337, 34.196897955727074)
      ..map = map
      ..clickable = true
      ..title = 'Пионерское');

    final markerDobroe = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.87123515549392, 34.229724709049336)
      ..map = map
      ..clickable = true
      ..title = 'Доброе');

    final markerLuchistoe = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.73757978998374, 34.4043633774351)
      ..map = map
      ..clickable = true
      ..title = 'Лучистое');

    final markerLazurnoe = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.63243554600018, 34.38811720496864)
      ..map = map
      ..clickable = true
      ..title = 'Лазурное');

    final markerMasandra = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(44.518039075422024, 34.1859171983714)
      ..map = map
      ..clickable = true
      ..title = 'Масандра');

    final markerEvpatoria = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(45.19038240958944, 33.365993828492215)
      ..map = map
      ..clickable = true
      ..title = 'Евпатория');

    final markerKrasnogvardeiskoe = gmap.Marker(gmap.MarkerOptions()
      ..position = gmap.LatLng(45.496482850268244, 34.29640844563424)
      ..map = map
      ..clickable = true
      ..title = 'Красногвардейское');

    return elem;
  });



  return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
        boxShadow: shadowBox,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: HtmlElementView(viewType: htmlId),
      ));
}

String _markers(String textWhat,String textMetres,String assets){
  String mapMarkerAlushta = '''
  <div 
  style='color: black;
   margin: 1px;
   float:top;
   padding-top:5px;
   text-align:center;'><b>$textWhat<br/>$textMetres</b>
   </div>
   
  <div 
  style='background-image:url("./assets/map/$assets");
  background-repeat: no-repeat; 
  height:150px; width:120px; 
  background-size: 100%; 
  float:top; 
  margin-left: auto; 
  border-radius: 10px;'></div>
  ''';
  return mapMarkerAlushta;
}

final _roadAtlasStyles = <gmap.MapTypeStyle>[
  gmap.MapTypeStyle()
    ..elementType = 'geometry'
    ..stylers = [
      jsify({'color': '#ffedd8'}),
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
  gmap.MapTypeStyle()
    ..featureType = "road"
    ..elementType = 'geometry'
    ..stylers = [
      jsify({'color': '#9b26'}),
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
      jsify({'color': '#ddb892'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = "road.arterial"
    ..elementType = 'labels.text.fill'
    ..stylers = [
      jsify({'color': '#faedcd'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = "road.highway"
    ..elementType = 'geometry'
    ..stylers = [
      jsify({'color': '#ddb892'}),
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
      jsify({'color': '#faedcd'}),
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
      jsify({'color': '#d6e2e9'}),
    ],
  gmap.MapTypeStyle()
    ..featureType = "water"
    ..elementType = 'labels.text.fill'
    ..stylers = [
      jsify({'color': '#9e9e9e'}),
    ],
];


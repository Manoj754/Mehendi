import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _jkl = prefs.getString('ff_jkl') ?? _jkl;
  }

  late SharedPreferences prefs;

  bool _heartisclicked = false;
  bool get heartisclicked => _heartisclicked;
  set heartisclicked(bool _value) {
    notifyListeners();

    _heartisclicked = _value;
  }

  bool _unlikeclick = false;
  bool get unlikeclick => _unlikeclick;
  set unlikeclick(bool _value) {
    notifyListeners();

    _unlikeclick = _value;
  }

  String _jkl = '';
  String get jkl => _jkl;
  set jkl(String _value) {
    notifyListeners();

    _jkl = _value;
    prefs.setString('ff_jkl', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

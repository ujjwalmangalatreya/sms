import 'package:flutter/material.dart';

Drawer _appDrawer() {
  return Drawer(
    child: _listTile("H O M E"),
  );
}

ListTile _listTile(String title) {
  return ListTile(
    title: Text(title),
  );
}

library resource_checker;

import 'dart:convert';

import 'package:flutter/services.dart';

class ResourceChecker {
  static ResourceChecker? _instance;
  late final Map<String, Object> _assetsMap;

  ResourceChecker._(this._assetsMap);

  static Future<ResourceChecker> _getInstance() async {
    if (_instance == null) {
      final allAssets = await rootBundle.loadString('AssetManifest.json');
      final assetsMap = json.decode(allAssets) as Map<String, Object>;
      _instance = ResourceChecker._(assetsMap);
    }
    return _instance!;
  }

  static Future<ResourceChecker> get instance async => await _getInstance();

  bool assetLoaded(String path) => _assetsMap.containsKey(path);
}

// material page function

import 'package:flutter/material.dart';

materialPage(settings, page) {
  return MaterialPageRoute(
    settings: settings,
    builder: (_) => page,
  );
}

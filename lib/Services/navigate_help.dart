import 'package:flutter/material.dart';

goTo(ctx, Widget? location) {
  return Navigator.push(
    ctx,
    MaterialPageRoute(
      builder: (context) {
        return location!;
      },
    ),
  );
}

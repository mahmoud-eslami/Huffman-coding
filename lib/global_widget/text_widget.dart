import 'package:flutter/material.dart';

textWidget(
  text, {
  style,
  isCenter = true,
}) {
  return Row(
    mainAxisAlignment:
        isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
    children: [
      Expanded(
        child: Text(
          text,
          style: style,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
        ),
      ),
    ],
  );
}

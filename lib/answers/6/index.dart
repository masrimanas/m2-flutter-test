// 6. What is padding, margin, and alignment? Please provide some code on
// how to use it, and provide a picture to describe visually.

// answer: I think, in Flutter, padding is space of parent widget to its child,
// margin is space of widget to its its parent. Aligment is position of child
// widget in parent widget.

import 'package:flutter/material.dart';

Widget box() {
  return Center(
    child: Container(
      color: Colors.blue,
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(40), // we set 40 space of parent to child
      child: Container(
        color: Colors.grey,
        child: Container(
          color: Colors.green,
          margin:
              const EdgeInsets.all(40), // we set 40 space of child to parent
          child: const Align(
            alignment:
                Alignment.centerRight, // we set the alignment of center right
            child: Text('Boksu'),
          ),
        ),
      ),
    ),
  );
}

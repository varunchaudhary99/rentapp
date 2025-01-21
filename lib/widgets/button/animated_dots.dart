import 'package:flutter/material.dart';

import '../widgets/colors.dart';


class AnimatedDot extends StatelessWidget {
 AnimatedDot({
super.key,
required this.isActive,
});

final bool isActive;

@override
Widget build(BuildContext context) {
return AnimatedContainer(
duration: const Duration(milliseconds: 100),
height: 6,
width: isActive ? 20 : 6,
decoration: BoxDecoration(
color:
isActive ? ColorSelect.pinkColor : const Color(0xFF868686).withOpacity(0.25),
borderRadius: const BorderRadius.all(Radius.circular(20)),
),
);
}
}
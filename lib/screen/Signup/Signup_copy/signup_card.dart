import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signupcard extends StatelessWidget {
  const signupcard({
    Key? key,
    this.svg,
    this.press,
  }) : super(key: key);

  final String? svg;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function()?,
      child: Container(
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        // child: SvgPicture.asset(icon!),

        child: TextButton(
          onPressed: () {},
          child: SvgPicture.asset(
            svg!,
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}

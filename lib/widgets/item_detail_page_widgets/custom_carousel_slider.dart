import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatefulWidget {
  final double width;
  final List<String> images;

  const CustomCarouselSlider({Key? key, required this.width, required this.images}) : super(key: key);
  @override
  _CustomCarouselSliderState createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  // @override
  bool _isFirstImage = true;
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.width <= 414 ? 300 : 500,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _isFirstImage = !_isFirstImage;
                });
              }),
          items: widget.images.map((imageURL) {
            return Image.network(imageURL);
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: widget.width <= 414 ? 6 : 8,
              height:  widget.width <= 414 ? 6 : 8,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isFirstImage ? Color(0xFFC4C4C4) : Color(0xFFE5E5E5),
              ),
            ),
            Container(
              width:  widget.width <= 414 ? 6 : 8,
              height:  widget.width <= 414 ? 6 : 8,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isFirstImage ? Color(0xFFE5E5E5) : Color(0xFFC4C4C4)
              ),
            )
          ],
        )
      ],
    );
  }
}
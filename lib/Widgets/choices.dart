import 'package:flutter/material.dart';
import 'package:mrc/utils/utils.dart';

class Choices extends StatefulWidget {
  final List filters;
  final String category;
  const Choices({Key? key, required this.filters, required this.category})
      : super(key: key);

  @override
  State<Choices> createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  int trackValue = 0;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
          widget.filters.length,
          (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    searchFilter[widget.category] =
                        widget.filters[index]["name"];
                    trackValue = index + 1;
                  });
                },
                child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: widget.filters[index]["value"] == trackValue
                              ? primaryColor
                              : kblack,
                        ),
                        color: widget.filters[index]["value"] == trackValue
                            ? primaryColor.withOpacity(0.1)
                            : kWhite,
                        borderRadius: BorderRadius.circular(15)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      widget.filters[index]["name"].toString(),
                      style: TextStyle(
                          color: widget.filters[index]["value"] == trackValue
                              ? primaryColor
                              : kblack,
                          fontWeight: FontWeight.bold),
                    )),
              )),
    );
  }
}

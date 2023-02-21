import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:testing/data/filterchips.dart';
import 'package:testing/model/filterchip.dart';

class HomeChipPage extends StatefulWidget {
  const HomeChipPage({super.key});

  @override
  State<HomeChipPage> createState() => _HomeChipPageState();
}

class _HomeChipPageState extends State<HomeChipPage> {
  final double spacing = 8;

  var logger = Logger();
  List<FilterChipData> filterChips = FilterChips.all;

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple[100],
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            //!chip1
            InkWell(
              onTap: () {
                // log("hello");
                logger.d("debug");
                logger.e("error");
                logger.i("info");
                logger.v("verbose");
                logger.w("warning");
                logger.wtf("wtf");
                logger.log(Level.debug, "debug log");
              },
              child: const Chip(
                label: Text("chip"),
              ),
            ),
            //! chip2
            Chip(
                backgroundColor: Colors.blue,
                deleteButtonTooltipMessage: "deleteButtonTooltipMessage",
                clipBehavior: Clip.antiAlias,
                onDeleted: () {
                  logger.d("blue");
                },
                label: const Text(
                  "chip with del",
                  selectionColor: Colors.amber,
                )),

            //!chip3
            const Chip(
                backgroundColor: Colors.green,
                autofocus: true,
                label: Text(
                  "chip autofocus",
                  // selectionColor: Colors.red,
                )),
            //!chip4
            Chip(
              backgroundColor: Colors.cyan,
              shadowColor: Colors.red,
              elevation: 3,
              label: const Text("chip with avatar + Shadow"),
              avatar: CircleAvatar(
                backgroundColor: Colors.amber.withOpacity(.7),
                child: const Text(
                  "T3",
                ),
              ),
            ),
            InputChip(
              label: const Text("Inputchip"),
              elevation: 2,
              shadowColor: Colors.black,
              onPressed: () {
                logger.e("inputChip");
              },
            ),
            Container(
              height: 48,
              width: double.maxFinite,
              color: Colors.amber[100],
              child: SizedBox(
                width: 400,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return buildFilterChips();
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget buildFilterChips() => Wrap(
        runSpacing: spacing,
        spacing: spacing,
        children: filterChips
            .map((filterChip) => FilterChip(
                  label: Text(filterChip.label),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: filterChip.color,
                  ),
                  backgroundColor: filterChip.color.withOpacity(0.1),
                  onSelected: (isSelected) => setState(() {
                    filterChips = filterChips.map((otherChip) {
                      return filterChip == otherChip
                          ? otherChip.copy(isSelected: isSelected)
                          : otherChip;
                    }).toList();
                  }),
                  selected: filterChip.isSelected,
                  checkmarkColor: filterChip.color,
                  showCheckmark: false,
                  selectedColor: Colors.green.withOpacity(0.5),
                  shadowColor: Colors.black,
                  elevation: 2,
                ))
            .toList(),
      );
}

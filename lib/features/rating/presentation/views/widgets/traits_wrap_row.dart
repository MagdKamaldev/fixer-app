import 'package:fixer/features/rating/presentation/views/widgets/traits_container_model.dart';
import 'package:flutter/material.dart';

class TraitsWrapRow extends StatefulWidget {
  const TraitsWrapRow({super.key});

  @override
  State<TraitsWrapRow> createState() => _TraitsWrapRowState();
}

class _TraitsWrapRowState extends State<TraitsWrapRow> {
  List<bool> isSelectedList = List.filled(6, false);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      alignment: WrapAlignment.start,
      children: List.generate(
        6, // Replace with your desired number of items
        (index) => TraitsContainerModel(
          isSelected: isSelectedList[index],
          onTap: () {
            setState(() {
              isSelectedList[index] = !isSelectedList[index];
            });
          },
        ),
    )
    );
  }
}
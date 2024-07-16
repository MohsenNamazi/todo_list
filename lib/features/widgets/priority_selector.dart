import 'package:flutter/material.dart';
import 'package:todo_list/features/common/extensions/build_context.dart';

class PrioritySelector extends StatefulWidget {
  const PrioritySelector({required this.onChanged, super.key});
  final Function(int?) onChanged;

  @override
  State<PrioritySelector> createState() => _PrioritySelectorState();
}

class _PrioritySelectorState extends State<PrioritySelector> {
  int? selectedProject;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final prioritiesMap = <int, String>{
      1: l10n.priority1,
      2: l10n.priority2,
      3: l10n.priority3,
      4: l10n.priority4,
    };

    final icon = selectedProject == null
        ? const Icon(Icons.keyboard_arrow_down)
        : InkWell(
            onTap: () {
              widget.onChanged(null);
              setState(() {
                selectedProject = null;
              });
            },
            child: const Icon(Icons.close));

    return DropdownButton<int>(
      underline: const SizedBox.shrink(),
      value: selectedProject,
      icon: icon,
      elevation: 16,
      hint: Text(l10n.priority),
      items: prioritiesMap.entries
          .map((entry) => DropdownMenuItem<int>(
                value: entry.key,
                child: Text(entry.value),
              ))
          .toList(),
      onChanged: (int? num) {
        widget.onChanged(num);
        setState(() {
          selectedProject = num;
        });
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class Boxstyle extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final void Function(bool?)? onChanged; // Fixed function signature
  final Function(BuildContext)? deletefunction; // Fixed function type

  const Boxstyle({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deletefunction, // Ensure it's required
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletefunction, // Fixed function type
              icon: Icons.delete,
              backgroundColor: Colors.green,
              borderRadius: BorderRadius.circular(24),
            ),
          ],
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.green,
                checkColor: Colors.black,
              ),
              Expanded( // Ensure text doesn't overflow
                child: Text(
                  taskName, // Show actual task name
                  style: GoogleFonts.pressStart2p(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevents overflow
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

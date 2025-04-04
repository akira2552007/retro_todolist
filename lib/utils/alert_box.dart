import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_to_do_app/utils/buttons.dart';

class AlertBox extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onsave;
  final VoidCallback oncancel;

  const AlertBox({super.key, required this.controller, required this.oncancel, required this.onsave});

  @override
  State<AlertBox> createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: widget.controller, // Use widget.controller
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2),
                ),
                hintText: "ADD A NEW TASK",
                hintStyle: GoogleFonts.pressStart2p(color: Colors.green, fontSize: 12),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Buttons(text: "Save", onPressed: widget.onsave),  // Fixed
                Buttons(text: "Cancel", onPressed: widget.oncancel), // Fixed
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// A separate widget that handles text editing for the journal.
/// It encapsulates TextEditingControllers for both title and description,
/// and provides a rich formatting toolbar (moved to the bottom) styled to look cool,
/// similar to Samsung Notes.
class JournalTextEditor extends StatefulWidget {
  const JournalTextEditor({super.key});

  @override
  JournalTextEditorState createState() => JournalTextEditorState();
}

class JournalTextEditorState extends State<JournalTextEditor> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  int descriptionCharCount = 0;

  @override
  void initState() {
    super.initState();
    descriptionCharCount = descriptionController.text.length;
    titleController.addListener(() => setState(() {}));
    descriptionController.addListener(() {
      setState(() {
        descriptionCharCount = descriptionController.text.length;
      });
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  /// Returns the current journal data as a map.
  Map<String, String> getJournalData() {
    return {
      'title': titleController.text,
      'description': descriptionController.text,
    };
  }

  /// Wraps the currently selected text in the description field with [leftMarker] and [rightMarker].
  void _applyFormatting(String leftMarker, String rightMarker) {
    final text = descriptionController.text;
    final selection = descriptionController.selection;
    if (!selection.isValid) return;

    final selectedText = selection.textInside(text);
    final newText =
        selection.textBefore(text) +
        leftMarker +
        selectedText +
        rightMarker +
        selection.textAfter(text);
    final newSelection = selection.copyWith(
      baseOffset: selection.start + leftMarker.length,
      extentOffset: selection.end + leftMarker.length,
    );
    descriptionController.text = newText;
    descriptionController.selection = newSelection;
  }

  /// Inserts [marker] at the beginning of the current line in the description field.
  void _insertAtLineStart(String marker) {
    final text = descriptionController.text;
    final selection = descriptionController.selection;
    int lineStart = text.lastIndexOf('\n', selection.start - 1);
    if (lineStart == -1) {
      lineStart = 0;
    } else {
      lineStart += 1;
    }
    final newText =
        text.substring(0, lineStart) + marker + text.substring(lineStart);
    final newSelection = selection.copyWith(
      baseOffset: selection.start + marker.length,
      extentOffset: selection.end + marker.length,
    );
    descriptionController.text = newText;
    descriptionController.selection = newSelection;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title TextField with conditional helper text and clear button.
        TextField(
          controller: titleController,
          cursorColor: Colors.white,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            helperText: titleController.text.isEmpty ? 'Enter Title' : null,
            helperStyle: const TextStyle(color: Colors.grey),
            suffixIcon:
                titleController.text.isNotEmpty
                    ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          titleController.clear();
                        });
                      },
                    )
                    : null,
          ),
        ),
        const SizedBox(height: 8),
        // Description TextField with helper text and clear button.
        TextField(
          controller: descriptionController,
          cursorColor: Colors.white,
          style: const TextStyle(fontSize: 14, color: Colors.white),
          maxLines: null,
          decoration: InputDecoration(
            border: InputBorder.none,
            helperText: 'Enter Description',
            helperStyle: const TextStyle(color: Colors.grey),
            suffixIcon:
                descriptionController.text.isNotEmpty
                    ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          descriptionController.clear();
                        });
                      },
                    )
                    : null,
          ),
        ),
        const SizedBox(height: 8),
        // Cool formatting toolbar moved to the bottom.
        Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2E2E2E), Color(0xFF1C1C1C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    IconButton(
                      tooltip: 'Bullet List',
                      icon: const Icon(
                        Icons.format_list_bulleted,
                        color: Colors.white,
                      ),
                      onPressed: () => _insertAtLineStart("• "),
                    ),
                    IconButton(
                      tooltip: 'Todo List',
                      icon: const Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.white,
                      ),
                      onPressed: () => _insertAtLineStart("- [ ] "),
                    ),
                    IconButton(
                      tooltip: 'Bold',
                      icon: const Icon(Icons.format_bold, color: Colors.white),
                      onPressed: () => _applyFormatting("**", "**"),
                    ),
                    IconButton(
                      tooltip: 'Italic',
                      icon: const Icon(
                        Icons.format_italic,
                        color: Colors.white,
                      ),
                      onPressed: () => _applyFormatting("_", "_"),
                    ),
                    IconButton(
                      tooltip: 'Underline',
                      icon: const Icon(
                        Icons.format_underline,
                        color: Colors.white,
                      ),
                      onPressed: () => _applyFormatting("<u>", "</u>"),
                    ),
                    IconButton(
                      tooltip: 'Strikethrough',
                      icon: const Icon(
                        Icons.format_strikethrough,
                        color: Colors.white,
                      ),
                      onPressed: () => _applyFormatting("~~", "~~"),
                    ),
                    IconButton(
                      tooltip: 'Highlight',
                      icon: const Icon(Icons.highlight, color: Colors.white),
                      onPressed: () => _applyFormatting("==", "=="),
                    ),
                    // Additional formatting buttons can be added here.
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '$descriptionCharCount characters',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
// If you haven't already, add dotted_border to your pubspec.yaml
import 'package:dotted_border/dotted_border.dart';

class FileUploadBox extends StatelessWidget {
  final String label;
  final String description;
  final VoidCallback onTap;

  const FileUploadBox({
    Key? key,
    required this.label,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        dashPattern: [8, 4],
        color: Colors.purple,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              Icon(Icons.cloud_upload, size: 40, color: Colors.purple),
              const SizedBox(height: 8),
              Text(label, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 4),
              Text(description, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
} 
import 'package:flutter/material.dart';

class AddStylistDialog extends StatefulWidget {
  const AddStylistDialog({Key? key}) : super(key: key);

  @override
  State<AddStylistDialog> createState() => _AddStylistDialogState();
}

class _AddStylistDialogState extends State<AddStylistDialog> {
  final nameController = TextEditingController();
  final specializationController = TextEditingController();
  final bioController = TextEditingController();
  final avatarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title and close
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Add New Stylist',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Fill in the details for the new stylist.',
                style: TextStyle(color: Colors.black54, fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 18),
              // Form fields
              _buildField('Name', nameController),
              const SizedBox(height: 12),
              _buildField('Specialization', specializationController),
              const SizedBox(height: 12),
              _buildField('Bio', bioController, maxLines: 3),
              const SizedBox(height: 12),
              _buildField('Avatar URL', avatarController),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // TODO: Add stylist logic
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Add Stylist',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Row(
      crossAxisAlignment: maxLines > 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 110,
          child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
} 
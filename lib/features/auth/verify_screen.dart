import 'package:flutter/material.dart';
import 'dart:io';
import '../../core/widgets/file_upload_box.dart';
import '../../core/widgets/gradient_button.dart';
import '../mainnav/mainnav_screen.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  String? commercialDoc;
  String? stylistCert;
  final additionalInfoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: theme.shadowColor.withOpacity(0.1),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Hairvana',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium?.copyWith(
                        color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Verify Your Salon',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.textTheme.titleLarge?.color, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Upload required documents to complete verification',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
                    )),
                const SizedBox(height: 24),
                Text('Commercial Registration Document',
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Upload your business license or commercial registration certificate',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                    )),
                const SizedBox(height: 8),
                FileUploadBox(
                  label: commercialDoc == null
                      ? 'Click to upload or drag and drop'
                      : 'Uploaded: \\${commercialDoc!.split(Platform.pathSeparator).last}',
                  description: 'PDF, JPG, PNG (max 5MB)',
                  onTap: (){}, //pickCommercialDoc,
                ),
                const SizedBox(height: 24),
                Text('Stylist Certification',
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.secondary, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('Upload professional certification or cosmetology license',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                    )),
                const SizedBox(height: 8),
                FileUploadBox(
                  label: stylistCert == null
                      ? 'Click to upload or drag and drop'
                      : 'Uploaded: \\${stylistCert!.split(Platform.pathSeparator).last}',
                  description: 'PDF, JPG, PNG (max 5MB)',
                  onTap: (){}, // pickStylistCert,
                ),
                const SizedBox(height: 24),
                Text('Additional Information (Optional)',
                    style: theme.textTheme.bodyMedium),
                const SizedBox(height: 4),
                TextField(
                  controller: additionalInfoController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Any additional information about your salon, certifications, or special services...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.verified, color: theme.colorScheme.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Verification Process\nOur team will review your documents within 24-48 hours. You\'ll receive an email notification once verification is complete.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.textTheme.bodySmall?.color?.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GradientButton(
                  text: 'Submit for Verification',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const MainNavScreen()),
                    );
                  },
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Back to Registration'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 
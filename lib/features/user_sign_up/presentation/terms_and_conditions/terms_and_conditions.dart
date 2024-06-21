import 'package:fixer/core/themes/colors.dart';
import 'package:fixer/core/themes/text_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms and Conditions',
          style: TextStyles.headings,
        ),
        backgroundColor: ColorManager.white,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '1. Introduction',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to our craftsman service app. By using our services, you agree to the following terms and conditions. Please read them carefully.',
            ),
            SizedBox(height: 16),
            Text(
              '2. Services Provided',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Our app connects you with skilled craftsmen who can assist with various household repairs and maintenance tasks. We act as an intermediary platform and are not responsible for the actual services provided by the craftsmen.',
            ),
            SizedBox(height: 16),
            Text(
              '3. User Responsibilities',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'As a user, you are responsible for providing accurate information when requesting a service. You must ensure that the craftsmen have safe and reasonable access to the location where the service is needed.',
            ),
            SizedBox(height: 16),
            Text(
              '4. Payment Terms',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Payments for services are handled through our app. You agree to pay the quoted amount for the requested services. All payments are final and non-refundable once the service has been completed.',
            ),
            SizedBox(height: 16),
            Text(
              '5. Limitation of Liability',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Our app is not liable for any damages or losses resulting from the services provided by the craftsmen. We do not guarantee the quality of the services, and any disputes must be resolved directly with the craftsman.',
            ),
            SizedBox(height: 16),
            Text(
              '6. Termination',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We reserve the right to terminate or suspend your access to our app at any time, without prior notice, if you violate these terms and conditions or engage in any conduct that we deem inappropriate or harmful.',
            ),
            SizedBox(height: 16),
            Text(
              '7. Changes to Terms',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We may update these terms and conditions from time to time. Any changes will be posted on this page, and your continued use of the app signifies your acceptance of the updated terms.',
            ),
            SizedBox(height: 16),
            Text(
              '8. Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions or concerns about these terms and conditions, please contact us at fixregypt@gmail.com.',
            ),
          ],
        ),
      ),
    );
  }
}

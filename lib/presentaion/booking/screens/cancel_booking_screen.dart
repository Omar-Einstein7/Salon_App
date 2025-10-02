import 'package:flutter/material.dart';
import 'package:salon_app/core/config/widgets/custom_appbar_wdt.dart';
import 'package:salon_app/core/config/widgets/custom_button.dart';
import 'package:salon_app/presentaion/booking/widgets/payment_option_wdgt.dart';

class CancelBookingScreen extends StatefulWidget {
  const CancelBookingScreen({super.key});

  @override
  State<CancelBookingScreen> createState() => _CancelBookingScreenState();
}

class _CancelBookingScreenState extends State<CancelBookingScreen> {
  int? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IOSAppBar(title: const Text('Cancel Booking'), context: context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose Payment Method for Refund',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            PaymentOptionWdgt(
              
              icon: Icons.apple,
              title: 'Apple Pay',
              index: 0,
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
            PaymentOptionWdgt(
              icon: Icons.android,
              title: 'Google Pay',
              index: 1,
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
            PaymentOptionWdgt(
              icon: Icons.payment,
              title: 'PayPal',
              index: 2,
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
            PaymentOptionWdgt(
              icon: Icons.credit_card,
              title: 'Master Card',
              index: 3,
              groupValue: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: CustomButton(
                txt: 'Add New Card',
                onPressed: () {
                  // Handle add new card
                },
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Paid:',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '\$14.00',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                     
                    ),

                  ),
                  SizedBox(width: 5),
                  Text(
                    'Refund:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$12.50',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                   
                    ),
                  ),
                ],
              ),
            ),

            CustomButton(
              txt: "Confirm Cancelation",
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 64,
                      ),
                      title: Text(
                        'Booking Cancelled Successfully',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Your refund of \$12.50 will be processed within 3-5 business days to your selected payment method.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Booking Reference: #BK12345',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(
                                  context,
                                ).pop(); // Return to previous screen
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: const EdgeInsets.all(16),
                                minimumSize: const Size(double.infinity, 50),
                              ),
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }


}

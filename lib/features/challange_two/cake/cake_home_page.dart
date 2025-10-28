import 'package:flutter/material.dart';
import 'package:flutter_animations/features/challange_two/cake/widgets/cake_button.dart';
import 'package:flutter_animations/features/challange_two/cake_data/cake_data.dart';

class CakeHomePage extends StatefulWidget {
  const CakeHomePage({super.key});

  @override
  State<CakeHomePage> createState() => _CakeHomePageState();
}

class _CakeHomePageState extends State<CakeHomePage> {
  final cakeDataDb = CakeData.cakes;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: cakeDataDb[index].,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CakeButton(value: Icon(Icons.access_alarms)),

                  Row(
                    spacing: 20,
                    children: [
                      CakeButton(value: Icon(Icons.access_alarms)),
                      CakeButton(value: Icon(Icons.access_alarms)),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),

              CakeButton(value: Text('Choose Your favourite')),

              Center(
                heightFactor: 2,
                child: Image.asset(
                  width: 300,
                  height: 300,
                  cakeDataDb[index].image,
                ),
              ),

              Spacer(),

              Row(
                spacing: 10,
                children: [
                  CakeButton(value: Icon(Icons.arrow_back_ios)),
                  Expanded(
                    child: CakeButton(value: Text('Select this cake')),
                  ),

                  GestureDetector(
                    onTap: () {
                      if (index >= 6) {
                        setState(() {
                          index = 0;
                        });
                      } else {
                        setState(() {
                          index += 1;
                        });
                      }
                      print(index);
                    },
                    child: CakeButton(value: Icon(Icons.arrow_forward_ios)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}








// bool _isLoading = false;
//   void _handlePaymentStart() {
//     setState(() => _isLoading = true);
//   }

//   void _handlePaymentResult(Map<String, dynamic> result) {
//     setState(() => _isLoading = false);

//     if (result['status'] == 'success') {
//       widget.onPaymentResult(result);
//       NovaNotificationOverlay.show(
//         context: context,
//         message: 'Payment successful',
//         type: NovaNotificationType.success,
//       );
//     } else if (result['status'] == 'failed' ||
//         result['status'] == 'cancelled') {
//       NovaNotificationOverlay.show(
//         context: context,
//         message: result['status'] == 'cancelled'
//             ? 'Payment cancelled'
//             : 'Payment failed',
//         type: NovaNotificationType.error,
//       );
//     }
//   }

//   void _handlePaymentError(Object? error) {
//     print('Payment error: $error');
//     setState(() => _isLoading = false);
//   }
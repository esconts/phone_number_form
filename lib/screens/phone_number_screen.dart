import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_test_task/components/submit_button.dart';
import 'package:form_test_task/libs/masked_text.dart';
import 'package:form_test_task/constants.dart';

class PhoneNumberScreen extends StatefulWidget {
  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  //using MaskedTextController from package flutter_masked_text for masking text
  var phoneController = MaskedTextController(mask: '(000) 000-0000');

  String phoneNumber = '';
  //variable for checking the visibility of the button to clear the field
  bool clearButtonIsVisible = false;
  //variable for checking the ability to press the confirm button
  bool submitButtonIsActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get Started',
                style: kMainTextStyle,
              ),
              SizedBox(height: 200),
              TextFormField(
                onChanged: (value) {
                  setState(
                    () {
                      phoneNumber = value;
                      print(phoneNumber);
                      if (phoneNumber.length >= 1) {
                        clearButtonIsVisible = true;
                      } else {
                        clearButtonIsVisible = false;
                      }
                      if (phoneNumber.length == 10) {
                        submitButtonIsActive = true;
                      } else {
                        submitButtonIsActive = false;
                      }
                    },
                  );
                },
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  //restriction for entering digits only
                  FilteringTextInputFormatter.digitsOnly,
                  //limiting string length no more than 10 characters
                  LengthLimitingTextInputFormatter(10),
                ],
                decoration: InputDecoration(
                  suffixIcon: clearButtonIsVisible
                      ? IconButton(
                          icon: Icon(
                            (Icons.clear),
                          ),
                          onPressed: () {
                            setState(() {
                              clearButtonIsVisible = false;
                              submitButtonIsActive = false;
                              phoneController.clear();
                            });
                          },
                        )
                      : null,
                  helperText: 'Enter your phone number',
                  helperStyle: kTextGreyStyle.copyWith(fontSize: 14),
                  hintText: '(201) 555-0123',
                  hintStyle: kTextGreyStyle,
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        kBorderSideStyle.copyWith(color: Colors.grey.shade300),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: kBorderSideStyle,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(right: 16),
                child: submitButtonIsActive
                    ? SubmitButton(
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            showConfirmDialog();
                          });
                        },
                      )
                    : SubmitButton(
                        color: Colors.grey,
                        onPressed: null,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//function that shows confirm alert dialog
  showConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Phone confirmed!'),
          content: Text('Do you want to try it again?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  phoneController.clear();
                  submitButtonIsActive = false;
                  clearButtonIsVisible = false;
                });
                Navigator.pop(context);
              },
              child: Text('Try it again!'),
            ),
          ],
        );
      },
    );
  }
}

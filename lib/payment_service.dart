import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  final int amount;
  final String url;

  PaymentService({this.amount = 10, this.url = ""});

  get paymentIntent => null;

  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            'pk_test_51JlpnmAIjSj6oSFjf927QKB7ji1O4IkCzl5tDkXBUbQ7KKKMFSjGXlUT2XEZ7QjAtBjHfqSSW6Aew6akwlUgyRsr006sUT3hN3',
        androidPayMode: 'test',
        merchantId: 'test'));
  }

  Future<PaymentMethod?> createPaymentMethod() async {
    print('The transaction amount to be charged is: $amount');
    PaymentMethod paymentMethod =
        await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    );
    return paymentMethod;
  }

  Future<void> processPayment(PaymentMethod paymentMethod) async {
    final http.Response response = await http.post(
        Uri.parse('$url?amount=$amount&currency=PHP&paym=${paymentMethod.id}'));

    if (response.body != 'error') {
      final PaymentIntent = jsonDecode(response.body);
      final status = PaymentIntent['paymentIntent']['status'];

      if (status == 'succeeded') {
        print(
            'Payment Completed. ${paymentIntent['paymentIntent']['amount'].toString()} sucessfully charged');
      }
    } else {
      print('Payment Failed.');
    }
  }
}

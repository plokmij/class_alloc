import 'package:flutter/material.dart';


class ErrorRetryWidget extends StatelessWidget {
  const ErrorRetryWidget({
    super.key,
    required this.errorMessage,
    required this.onRetryPressed,
  });

  final String errorMessage;
  final VoidCallback onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(errorMessage),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: onRetryPressed,
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }
}

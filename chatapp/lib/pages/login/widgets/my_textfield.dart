import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final String hint;
  final bool obscure;
  final bool isSuffixIcon;
  final TextEditingController textController;
  final FocusNode? focusNode;

  const MyTextfield({
    super.key,
    required this.hint,
    this.obscure = false,
    this.isSuffixIcon = false,
    required this.textController,
    this.focusNode
  });

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      focusNode: widget.focusNode,
      obscureText: _isObscure,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: widget.hint,
        suffixIcon: widget.isSuffixIcon
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure; 
                  });
                },
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }
}

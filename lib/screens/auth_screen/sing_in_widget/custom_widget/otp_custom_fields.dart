import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpCustomFields extends StatefulWidget {
  final int length;
  final double width;
  final double fieldWidth;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onCompleted;

  OtpCustomFields(
      {this.length = 6,
      this.width = 10,
      this.fieldWidth = 20,
      this.keyboardType = TextInputType.number,
      this.onChanged,
      this.onCompleted});

  @override
  _OtpCustomFieldsState createState() => _OtpCustomFieldsState();
}

class _OtpCustomFieldsState extends State<OtpCustomFields> {
  List<FocusNode> _focusNodes;
  List<TextEditingController> _textControllers;

  List<Widget> _textFields;
  List<String> _pin;

  @override
  void initState() {
    _focusNodes =
        List<FocusNode>.generate(widget.length, (index) => FocusNode());

    _textControllers = List<TextEditingController>.generate(
        widget.length, (index) => TextEditingController());

    _pin = List.generate(widget.length, (index) => '');

    _textFields =
        List.generate(widget.length, (index) => buildTextField(context, index));

    super.initState();
  }

  @override
  void dispose() {
    // ignore: avoid_function_literals_in_foreach_calls
    _textControllers.forEach((controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _textFields,
      ),
    );
  }

  Widget buildTextField(BuildContext context, int i) {
    return Container(
      width: widget.fieldWidth,
      child: TextField(
        controller: _textControllers[i],
        keyboardType: widget.keyboardType,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: TextStyle(fontSize: 40, color: Colors.white),
        focusNode: _focusNodes[i],
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))],
        decoration: InputDecoration(
          counterText: '',
          hintText: '*',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 40),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[900],
              width: 2.5,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: widget.fieldWidth,
            ),
          ),
        ),
        onChanged: (String str) {
          if (str.isEmpty) {
            if (i == 0) return;
            _focusNodes[i].unfocus();
            _focusNodes[i - 1].requestFocus();
          }
          setState(() {
            _pin[i] = str;
          });

          if (str.isNotEmpty) _focusNodes[i].unfocus();
          if (i + 1 != widget.length && str.isNotEmpty)
            FocusScope.of(context).requestFocus(_focusNodes[i + 1]);

          String currentPin = '';
          // ignore: avoid_function_literals_in_foreach_calls
          _pin.forEach((String val) {
            currentPin += val;
          });

          if (!_pin.contains(null) &&
              !_pin.contains('') &&
              currentPin.length == widget.length) {
            widget.onCompleted(currentPin);
          }
          if (widget.onChanged != null) {
            widget.onChanged(currentPin);
          }
        },
      ),
    );
  }
}

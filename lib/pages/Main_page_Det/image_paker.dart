import 'package:flutter/material.dart';
import 'dart:io';
import 'package:makany/Thems/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  //========================
  File _image;
  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
      setState(() {
        _image = image;
      });
      Navigator.pop(context);
    });
  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  Text('Pick Your Image'),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    textColor: accentColor,
                    child: Text('Use Camera'),
                    onPressed: () {
                      _getImage(context, ImageSource.camera);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FlatButton(
                    textColor: accentColor,
                    child: Text('Use Gallary'),
                    onPressed: () {
                      _getImage(context, ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OutlineButton(
          borderSide: BorderSide(
            color: accentColor,
            width: 2.0,
          ),
          onPressed: () {
            _openImagePicker(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.camera_alt,
                color: accentColor,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Add Image',
                style: TextStyle(color: accentColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        _image == null
            ? Text('please set image.')
            : Image.file(
                _image,
                fit: BoxFit.cover,
                height: 200,
                width: MediaQuery.of(context).size.width,
              )
      ],
    );
  }
}

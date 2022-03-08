import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_instagram/bloc/image_pick/image_pick_bloc.dart';
import 'package:flutter_instagram/ui/menu_screen.dart';
import 'package:flutter_instagram/widgets/gallery.dart';
import 'package:image_picker/image_picker.dart';

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class UploadPostScreen extends StatefulWidget {
  const UploadPostScreen({Key? key}) : super(key: key);

  @override
  _UploadPostScreenState createState() => _UploadPostScreenState();
}

class _UploadPostScreenState extends State<UploadPostScreen> {
  bool _isPrivate = false;
  XFile? _imageFile;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  set _setImageFile(XFile? value) {
    _imageFile = value ?? null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Nuevo Post',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) {
          return ImagePickBloc();
        },
        child: BlocConsumer<ImagePickBloc, ImagePickState>(
            listenWhen: (context, state) {
              return state is ImageSelectedSuccessState;
            },
            listener: (context, state) {},
            buildWhen: (context, state) {
              return state is ImagePickInitial ||
                  state is ImageSelectedSuccessState;
            },
            builder: (context, state) {
              if (state is ImageSelectedSuccessState) {
                print('PATH ${state.pickedFile.path}');
              }
              return registerForm(context, state);
            }),
      ),
    );
  }

  Widget registerForm(BuildContext context, state) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFE1E1E1)),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                SizedBox(
                  height: 700,
                  child: Card(
                    color: Colors.white,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                  onTap: () {
                                    BlocProvider.of<ImagePickBloc>(context).add(
                                        const SelectImageEvent(
                                            ImageSource.camera));
                                  },
                                  child: state is ImagePickInitial
                                      ? Image.asset(
                                          'assets/images/upload_post.png',
                                          width: 150,
                                        )
                                      : ClipRRect(
                                          child: Image.file(
                                            File(state.pickedFile.path),
                                            fit: BoxFit.cover,
                                            width: 150,
                                          ),
                                        ))),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            height: 160,
                            child: const Gallery(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                                controller: _titleController,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: const Color(0xFFFAFAFA),
                                  hintText: "Título",
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  focusColor: const Color(0xFFFFFFFF),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFF7F7F7), width: 1.0),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(),
                            child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                controller: _descriptionController,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(10),
                                  filled: true,
                                  fillColor: const Color(0xFFFAFAFA),
                                  hintText: "Descripción del post",
                                  hintStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  focusColor: const Color(0xFFFFFFFF),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFF7F7F7), width: 1.0),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                const Text('¿Quieres que el post sea privado?',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF00376B))),
                                Checkbox(
                                  value: _isPrivate,
                                  onChanged: (value) {
                                    setState(() {
                                      _isPrivate = !_isPrivate;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(275, 40),
                              primary: const Color(0xFF0095F6),
                              onPrimary: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const MenuScreen()));
                            },
                            child: GestureDetector(
                              child: const Text('Subir',
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

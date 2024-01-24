import 'package:flutter/material.dart';
import 'package:photos_app/src/config/helpers/color_helper.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({Key? key}) : super(key: key);

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final _messageController = TextEditingController();

  @override
  void initState() {
    _messageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('SingleChatPage'),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        foregroundColor: AppColors.blackColor,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(child: _listMessageWidget()),
          _inputMessageWidget(),
        ],
      ),
    );
  }

  _listMessageWidget() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const Text('');
      },
    );
  }

  _inputMessageWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(80),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ]),
              child: Row(
                children: [
                  const SizedBox(width: 4),
                  const Icon(Icons.insert_emoticon),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Scrollbar(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: "Type a message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.link),
                  const SizedBox(width: 5),
                  const Icon(Icons.camera_alt),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.circular(45),
            ),
            child: Icon(
              _messageController.text.isEmpty ? Icons.mic : Icons.send,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}

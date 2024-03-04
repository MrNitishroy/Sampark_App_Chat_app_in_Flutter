import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sampark/Controller/ContactController.dart';
import 'package:sampark/Pages/Home/Widget/ChatTile.dart';

import '../../../Config/Images.dart';

class NewGroup extends StatelessWidget {
  const NewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    ContactController contactController = Get.put(ContactController());
    return Scaffold(
      appBar: AppBar(
        title: Text('New Group'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.arrow_forward),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder(
          stream: contactController.getContacts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            }
            if (snapshot.data == null) {
              return const Center(
                child: Text("No Messages"),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ChatTile(
                    imageUrl: snapshot.data![index].profileImage ??
                        AssetsImage.defaultProfileUrl,
                    name: snapshot.data![index].name!,
                    lastChat: snapshot.data![index].about ?? "",
                    lastTime: "",
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

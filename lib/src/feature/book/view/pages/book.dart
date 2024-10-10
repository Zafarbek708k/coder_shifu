//var headers = {
//   'X-API-KEY': '9fe21bcc3c49eaa1df5d00bc414b721bfed686cc',
//   'Content-Type': 'application/json'
// };

// var request = http.Request('POST', Uri.parse('https://google.serper.dev/search'));
//var request = http.Request('POST', Uri.parse('https://google.serper.dev/images'));
//var request = http.Request('POST', Uri.parse('https://google.serper.dev/videos'));
// https://serper.dev/playground

// request.body = json.encode({
// "q": "apple inc"
// });

import 'dart:developer';

import 'package:coder_shifu/src/core/constants/context_extension.dart';
import 'package:coder_shifu/src/core/widgets/text_widget.dart';
import 'package:coder_shifu/src/data/entity/image_model.dart';
import 'package:coder_shifu/src/data/entity/search_model.dart';
import 'package:coder_shifu/src/data/repository/app_repository_impl.dart';
import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  AppRepositoryImpl repo = AppRepositoryImpl();
  bool isLoading = false;
  SearchModel? model;
  ImageModel? imageModel;

  Future<void> getImage()async{
    isLoading = true;
    setState(() {

    });
     model = (await repo.search())!;
     await repo.images();
    if(model != null){
      isLoading = false;
      setState(() {
        log("book page model credits => ${model?.credits ??"null credits"}");
      });
    }

  }

  @override
  void initState() {
    getImage();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  isLoading ? const Center(child: CircularProgressIndicator()):
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: SingleChildScrollView(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               Container(
                 decoration: BoxDecoration(
                   image: DecorationImage(image: NetworkImage(model?.knowledgeGraph?.imageUrl ??"https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"))
                 ),
               ),


               CustomTextWidget(model?.peopleAlsoAsk?[0].question ?? "no question", textColor: context.appTheme.secondary),
               Image.network(model?.knowledgeGraph?.imageUrl ??"https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),

               CustomTextWidget(model?.knowledgeGraph?.title ?? "no question", textColor: context.appTheme.secondary),
               Image.network(model?.knowledgeGraph?.imageUrl ??"https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),

               CustomTextWidget(model?.knowledgeGraph?.imageUrl ?? "no question", textColor: context.appTheme.secondary),
               Image.network(model?.knowledgeGraph?.imageUrl ??"https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),

               CustomTextWidget(model?.knowledgeGraph?.description ?? "no question", textColor: context.appTheme.secondary),
               Image.network(model?.knowledgeGraph?.imageUrl ??"https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),

               CustomTextWidget(model?.knowledgeGraph?.descriptionLink ?? "no question", textColor: context.appTheme.secondary),
               Image.network(model?.knowledgeGraph?.imageUrl ??"https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),

               CustomTextWidget(model?.knowledgeGraph?.descriptionSource ?? "no question", textColor: context.appTheme.secondary),
               Image.network(model?.knowledgeGraph?.imageUrl ??"https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),

               CustomTextWidget(model?.knowledgeGraph?.attributes?.largestSpecies ?? "no question", textColor: context.appTheme.secondary),
               const SizedBox(height: 150)
             ],
           ),
         ),
       ),
    );
  }
}

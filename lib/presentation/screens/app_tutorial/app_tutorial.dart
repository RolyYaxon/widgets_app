import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      "Buscar la comida",
      "TutoQuis anim nisi fugiat voluptate velit ullamco.rial",
      "assets/images/1.png"),
  SlideInfo("Pagina2", "Nostrud esse laborum elit velit ipsum.",
      "assets/images/2.png"),
  SlideInfo(
      "Pagina3",
      "Lorem nulla ut magna cillum nulla cillum reprehenderit eiusmod eu sunt.",
      "assets/images/3.png"),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = "tutorial_screen";
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      } else {
        endReached = false;
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((sliders) => _slide(
                    title: sliders.title,
                    caption: sliders.caption,
                    imageUrl: sliders.imageUrl))
                .toList(),
          
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text("Skip"),
                onPressed: () {
                  context.pop();
                },
              )
              ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 10,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text("Empeza"),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: titleStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            caption,
            style: captionStyle,
          )
        ],
      )),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = "infinite_screen";
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    addImages();
    isLoading = false;

    if (!isMounted) return;

    setState(() {});
    moveScrolltoBotom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));

    if (!isMounted) return;
    final lastId = imagesIds.last;
    isLoading = false;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addImages();

    setState(() {});
  }

  void moveScrolltoBotom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn);
  }

  void goUp() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 3), curve: Curves.bounceIn);
  }

  void addImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: RefreshIndicator(
          edgeOffset: 15,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
              controller: scrollController,
              itemCount: imagesIds.length,
              itemBuilder: (context, index) {
                return FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    placeholder:
                        const AssetImage("assets/images/jar-loading.gif"),
                    image: NetworkImage(
                        'https://picsum.photos/id/${imagesIds[index]}/500/300'));
              }),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
         
          children: [
            Expanded(child: 
            Align(alignment: Alignment.bottomLeft,
            child:  FloatingActionButton(
              onPressed: () {
                context.pop();
              },
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.blue,
              child: isLoading
                  ? SpinPerfect(
                      infinite: true, child: const Icon(Icons.refresh_rounded))
                  : FadeIn(child: const Icon(Icons.arrow_back)),
            ),)
            
            ),
           
             const SizedBox(width: 16),
            Expanded(child: 
            Align(alignment: Alignment.bottomRight,
            child:       
            TextButton(onPressed:()
            {
              goUp();
            }, 
            child:
            const Icon(Icons.arrow_upward_sharp)),
            )
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

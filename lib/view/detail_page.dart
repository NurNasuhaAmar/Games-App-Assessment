import 'package:base_app/controller/games_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

class GameDetailsPage extends GetView<GamesController> {
  const GameDetailsPage({super.key, this.gameId});
  final int? gameId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GetBuilder<GamesController>(
          id: 'DetailPage',
          initState: (_) {
            controller.getGameDetail(gameId: gameId!);
            controller.getGameScreenshots(gameId: gameId!);
          },
          builder: (ctrl) {
            return controller.isLoadingGameDetail
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
                : CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        expandedHeight: MediaQuery.of(context).size.height * 0.3,
                        backgroundColor: Colors.transparent,
                        pinned: false,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                image: NetworkImage(controller.details.backgroundImage ?? ''),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          )),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Game Name
                                Text(
                                  controller.details.name ?? '-',
                                  style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                                ),

                                /// Description
                                const Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    'Description',
                                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: ReadMoreText(
                                    controller.details.descriptionRaw ?? '-',
                                    trimLines: 3,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: ' more',
                                    trimExpandedText: ' less',
                                    style: const TextStyle(fontSize: 16, color: Colors.white),
                                  ),
                                ),

                                /// Screenshots
                                if (controller.listScreenshots.isNotEmpty)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Screenshots',
                                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                if (controller.listScreenshots.isNotEmpty)
                                  SizedBox(
                                    height: 300,
                                    child: ListView.builder(
                                      itemCount: controller.listScreenshots.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      itemBuilder: (ctx, index) {
                                        return Container(
                                          width: 280,
                                          height: 200,
                                          padding: const EdgeInsets.only(right: 10),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: Image.network(
                                              controller.listScreenshots[index].image ?? '-',
                                              fit: BoxFit.cover,
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) return child;
                                                return Shimmer.fromColors(
                                                  baseColor: Colors.grey,
                                                  highlightColor: Colors.grey[350]!,
                                                  child: Container(
                                                    decoration: const BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                /// Other Platforms
                                if (controller.details.platforms!.isNotEmpty)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Other Platforms',
                                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                if (controller.details.genres!.isNotEmpty)
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: controller.details.platforms?.length,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    itemBuilder: (ctx, index) {
                                      return Row(
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            size: 10,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            controller.details.platforms?[index].platform?.name ?? '-',
                                            style: const TextStyle(fontSize: 16, color: Colors.white),
                                          ),
                                        ],
                                      );
                                    },
                                  ),

                                /// Genres
                                if (controller.details.genres!.isNotEmpty)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Genres',
                                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                if (controller.details.genres!.isNotEmpty)
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: controller.details.genres?.length,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    itemBuilder: (ctx, index) {
                                      return Row(
                                        children: [
                                          const Icon(
                                            Icons.circle,
                                            size: 10,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            controller.details.genres?[index].name ?? '-',
                                            style: const TextStyle(fontSize: 16, color: Colors.white),
                                          ),
                                        ],
                                      );
                                    },
                                  ),

                                /// Developers
                                if (controller.details.developers!.isNotEmpty)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Developers',
                                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                if (controller.details.developers!.isNotEmpty)
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: controller.details.developers?.length,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    itemBuilder: (ctx, index) {
                                      return Text(
                                        controller.details.developers?[index].name ?? '-',
                                        style: const TextStyle(fontSize: 16, color: Colors.white),
                                      );
                                    },
                                  ),

                                /// Publishers
                                if (controller.details.publishers!.isNotEmpty)
                                  const Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Text(
                                      'Publishers',
                                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                if (controller.details.publishers!.isNotEmpty)
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: controller.details.publishers?.length,
                                    shrinkWrap: true,
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    itemBuilder: (ctx, index) {
                                      return Text(
                                        controller.details.publishers?[index].name ?? '-',
                                        style: const TextStyle(fontSize: 16, color: Colors.white),
                                      );
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
          }),
    );
  }
}

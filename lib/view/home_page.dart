import 'package:base_app/controller/games_controller.dart';
import 'package:base_app/view/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final GamesController controller = GamesController.getInstance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder(
          id: 'HomePage',
          init: GamesController(),
          initState: (_) {
            controller.getLatestGames();
          },
          builder: (ctrl) {
            return ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    color: Colors.black,
                    height: MediaQuery.of(context).size.height * 0.1,
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/ps5_badge.webp',
                          width: 120,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Latest Released Games',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        controller.isLoadingLatestGames
                            ? SizedBox(height: MediaQuery.of(context).size.height * 0.9, child: const Center(child: CircularProgressIndicator(color: Colors.black)))
                            : ListView.builder(
                                itemCount: controller.listGames.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                itemBuilder: (ctx, index) {
                                  return InkWell(
                                    onTap: () => Get.to(() => GameDetailsPage(gameId: controller.listGames[index].id)),
                                    child: Container(
                                      height: 80,
                                      margin: const EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 80,
                                            margin: const EdgeInsets.symmetric(vertical: 5),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(15),
                                              child: Image.network(
                                                controller.listGames[index].backgroundImage ?? '-',
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
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 5),
                                                    child: Text(
                                                      controller.listGames[index].name ?? '-',
                                                      overflow: TextOverflow.clip,
                                                      maxLines: 1,
                                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom: 2),
                                                    child: Text(
                                                      'Released Date: ${controller.listGames[index].released ?? '-'}',
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Metacritic Score: ${controller.listGames[index].metacritic ?? '-'}',
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 25,
                                            width: 50,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.black,
                                            ),
                                            child: const Text(
                                              'View',
                                              style: TextStyle(fontSize: 12, color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  );
                }
              },
            );
          }),
    );
  }
}

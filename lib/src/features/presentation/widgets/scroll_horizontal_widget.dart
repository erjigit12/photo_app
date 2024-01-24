import 'package:flutter/material.dart';
import 'package:photos_app/src/config/config.dart';
import 'package:photos_app/src/core/routes/page_names.dart';
import 'package:photos_app/src/features/domain/entities/article_entity.dart';

class ScrollHorizontalCard extends StatelessWidget {
  const ScrollHorizontalCard({
    super.key,
    required this.images,
  });

  final List<ArticleEntity> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 343,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final photo = images[index];
          final img = photo.urls?['small'];
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: 343,
                      height: 343,
                      color: Colors.red,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, PageNames.openPhotoPage,
                              arguments: img);
                        },
                        child: Image(
                          image: NetworkImage('$img'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Positioned(
                    bottom: 3,
                    left: 5,
                    child: SizedBox(
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/Rectangle 2.8.png'),
                          ),
                          const SizedBox(width: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ridhwan Nordin',
                                style: AppTextStyle.f13w700,
                              ),
                              Text(
                                '@ridzjcob',
                                style: AppTextStyle.f11w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

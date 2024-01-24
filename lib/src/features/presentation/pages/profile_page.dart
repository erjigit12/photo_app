import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photos_app/src/config/config.dart';
import 'package:photos_app/src/config/widgets/widget.dart';
import 'package:photos_app/src/core/routes/page_names.dart';
import 'package:photos_app/src/features/domain/entities/article_entity.dart';
import 'package:photos_app/src/features/features.dart';
import 'package:photos_app/src/features/presentation/logic/httpResponse/articles_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 60),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(''),
                  PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<AuthCubit>(context).loggedOut();
                              Navigator.pushNamedAndRemoveUntil(context,
                                  PageNames.registerPage, (route) => false);
                            },
                            child: const Text("logout"),
                          ),
                        ),
                      ];
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/splash.png'),
              ),
              const SizedBox(height: 16),
              const LargeTextWidget(text: 'Jane'),
              const SizedBox(height: 16),
              Text(
                'San francisco, ca'.toUpperCase(),
                style: AppTextStyle.f13w900cBlack,
              ),
              const SizedBox(height: 32),
              ButtonBlackBackground(text: 'Follow Jane'.toUpperCase()),
              const SizedBox(height: 16),
              ButtonWhiteBackground(text: 'Message'.toUpperCase()),
              const SizedBox(height: 32),
              BlocBuilder<ArticlesBloc, ArticlesState>(
                builder: (context, state) {
                  if (state is ArticlesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ArticlesFailure) {
                    return const Center(child: Text('Second State came'));
                  }
                  if (state is ArticlesSuccess) {
                    List<ArticleEntity> articlesList = state.articles;
                    return SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: MasonryGridView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: articlesList.length,
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final articles = articlesList[index];
                          final image = articles.urls?['small'];
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image(
                              image: NetworkImage('$image'),
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 32),

              // See More button
              SeeMoreButtonWidget(
                onTap: () {},
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

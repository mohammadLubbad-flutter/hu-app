import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hu/core/enums/bloc_enums.dart';

import 'package:hu/core/servicelocator/service_locator.dart';

import 'package:hu/presentation/controller/mainScreen/bloc/mainscreenbloc_bloc.dart';
import 'package:hu/presentation/screens/error_screen.dart';
import 'package:hu/presentation/widgets/main_screen_widgets/main_screen_shimmer.dart';

import '../../core/utils/strings.dart';
import '../widgets/main_screen_widgets/build_user_info_row.dart';
import '../widgets/main_screen_widgets/main_screen_sections_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> mainScreenbuttonsTitles = [
      AppLocalizations.of(context)!.courseBtn,
      AppLocalizations.of(context)!.gradesBtn,
      AppLocalizations.of(context)!.exploreBtn,
      AppLocalizations.of(context)!.settingsBtn,
      AppLocalizations.of(context)!.logoutBtn,
    ];

    final mediaQuerysize = MediaQuery.of(context).size;
    return Scaffold(
        body: BlocProvider<MainscreenblocBloc>(
            create: (context) =>
                MainscreenblocBloc(sl())..add(GetUserInfoEvent(id: '1837834')),
            child: BlocBuilder<MainscreenblocBloc, MainscreenblocInitial>(
              builder: (context, state) {
                if (state.studentrequestState == RequestState.loaded) {
                  return Stack(children: [
                    SizedBox(
                      height: mediaQuerysize.height,
                      width: mediaQuerysize.width,
                    ),
                    buildBackGroundRedContainer(mediaQuerysize, context),
                    BuildUserInfoRow(
                        mediaQuerysize: mediaQuerysize,
                        student: state.studentModel),
                    buildAnnouncmentsContainer(mediaQuerysize),
                    buildButtonsGridView(state.studentModel!.studentId,
                        mediaQuerysize, mainScreenbuttonsTitles),
                    buildSocialButtonsRow(mediaQuerysize, context),
                  ]);
                } else if (state.studentrequestState == RequestState.loading) {
                  return const MainScreenShimmer();
                } else {
                  return const ErrorScreen();
                }
              },
            )));
  }

  Widget buildSocialButtonsRow(Size mediaQuerysize, BuildContext context) {
    return Positioned(
      bottom: mediaQuerysize.height * 0.03,
      left: 16,
      child: Row(
        children: [
          buildSocialIconButtons(() {}, FontAwesomeIcons.facebook, context),
          buildSocialIconButtons(() {}, FontAwesomeIcons.instagram, context),
          buildSocialIconButtons(() {}, FontAwesomeIcons.twitter, context),
        ],
      ),
    );
  }

  Widget buildSocialIconButtons(
          void Function()? onPressed, IconData icon, BuildContext context) =>
      IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ));

  Widget buildButtonsGridView(
      String id, Size mediaQuerysize, List<String> mainScreenbtns) {
    return Padding(
      padding: EdgeInsets.only(
          top: mediaQuerysize.height * 0.6, left: 16, right: 16),
      child: GridView.builder(
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 5,
            mainAxisExtent: 100),
        itemBuilder: (context, index) => MainScreenSectionsButtons(
          id: id,
          title: mainScreenbtns[index],
          buttonIcon: AppStrings.mainScreenbuttonsIcons[index],
        ),
      ),
    );
  }

  Widget buildAnnouncmentsContainer(Size mediaQuerysize) {
    return Container(
      margin: EdgeInsets.only(top: mediaQuerysize.height * 0.2),
      width: mediaQuerysize.width,
      child: CarouselSlider(
        items: [
          buildAnnouncmentSizedbox('images/Announcment1.jpg'),
          buildAnnouncmentSizedbox('images/Announcment2.jpg'),
        ],
        options: CarouselOptions(
            autoPlay: true,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            height: 272.0,
            autoPlayCurve: Curves.fastOutSlowIn,
            aspectRatio: 10 / 9,
            scrollDirection: Axis.horizontal),
      ),
    );
  }

  Widget buildAnnouncmentSizedbox(String image) {
    return Card(
      elevation: 4,
      child: SizedBox(
        height: 227,
        width: 601,
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildBackGroundRedContainer(
      Size mediaQuerysize, BuildContext context) {
    return Container(
      width: double.infinity,
      height: mediaQuerysize.height * 0.35,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      ),
    );
  }
}

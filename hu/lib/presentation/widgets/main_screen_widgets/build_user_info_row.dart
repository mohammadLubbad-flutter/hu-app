import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/bloc_enums.dart';
import '../../../data/model/student_model.dart';
import '../../controller/mainScreen/bloc/mainscreenbloc_bloc.dart';

class BuildUserInfoRow extends StatelessWidget {
  const BuildUserInfoRow({
    super.key,
    required this.mediaQuerysize,
    required this.student,
  });

  final Size mediaQuerysize;
  final StudentModel? student;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainscreenblocBloc, MainscreenblocInitial>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, left: 4),
          child: Row(
            children: [
              buildUserImageContainer(state),
              SizedBox(
                width: mediaQuerysize.width * 0.01,
              ),
              Text(
                state.studentrequestState == RequestState.loading
                    ? ''
                    : student!.name,
                style: Theme.of(context).textTheme.subtitle1,
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildUserImageContainer(MainscreenblocInitial state) {
    return Container(
      height: mediaQuerysize.width * 0.1,
      width: mediaQuerysize.width * 0.1,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(state.studentrequestState ==
                      RequestState.loading
                  ? 'https://www.clipartkey.com/mpngs/m/152-1520367_user-profile-default-image-png-clipart-png-download.png'
                  : state.studentrequestState == RequestState.loaded
                      ? student!.image.toString()
                      : ''))),
    );
  }
}

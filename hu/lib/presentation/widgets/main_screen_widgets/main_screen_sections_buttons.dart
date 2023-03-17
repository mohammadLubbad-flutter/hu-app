import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hu/presentation/controller/mainScreen/bloc/mainscreenbloc_bloc.dart';
import 'package:hu/presentation/screens/coursess_screen.dart';
import 'package:hu/presentation/screens/explore_screen.dart';
import 'package:hu/presentation/screens/grades_screen.dart';
import 'package:hu/presentation/screens/login_screen.dart';
import 'package:hu/presentation/screens/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreenSectionsButtons extends StatelessWidget {
  const MainScreenSectionsButtons({
    super.key,
    required this.title,
    required this.buttonIcon,
    required this.id,
  });
  final String title;
  final String buttonIcon;
  final String id;

  @override
  Widget build(BuildContext context) {
    print(id);
    return InkWell(
      onTap: () {
        switch (title) {
          case 'Coursess':
            Navigator.of(context).pushReplacementNamed(CoursessScreen.rotename,
                arguments:
                    BlocProvider.of<MainscreenblocBloc>(context).studentModel!);
            break;
          case 'المواد':
            Navigator.of(context).pushReplacementNamed(CoursessScreen.rotename,
                arguments:
                    BlocProvider.of<MainscreenblocBloc>(context).studentModel!);
            break;
          case 'Grades':
            Navigator.of(context)
                .pushReplacementNamed(GradesScreen.routename, arguments: id);
            break;
          case 'العلامات':
            Navigator.of(context)
                .pushReplacementNamed(GradesScreen.routename, arguments: id);
            break;
          case 'Explore':
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => ExploreScreen(),
            ));
            break;
          case 'اكتشف':
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => ExploreScreen(),
            ));
            break;
          case 'Settings':
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            ));
            break;
          case 'الاعدادات':
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            ));
            break;
          default:
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
        }
      },
      child: Card(
        elevation: 4,
        child: Container(
          height: 113,
          width: 128,
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(buttonIcon))),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ),
      ),
    );
  }
}

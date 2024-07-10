import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_app/app/pages/dashboard_page.dart';
import 'package:simple_app/app/pages/form_question_page.dart';
import 'package:simple_app/app/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: currentPage);
  }

  void setCurrentPage(page) {
    setState(() {
      currentPage = page;
    });
  }

  Color _getIconColor(int index) {
    return currentPage == index ? Theme.of(context).primaryColor : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setCurrentPage,
        children: const [DashboardPage(), FormQuestionPage(), ProfilePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/home.svg',
                width: 24,
                height: 24,
                colorFilter:
                    ColorFilter.mode(_getIconColor(0), BlendMode.srcIn),
              ),
              label: 'Início'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/edit.svg',
                width: 24,
                height: 24,
                colorFilter:
                    ColorFilter.mode(_getIconColor(1), BlendMode.srcIn),
              ),
              label: 'Criar'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'images/profile-circle.svg',
                width: 24,
                height: 24,
                colorFilter:
                    ColorFilter.mode(_getIconColor(2), BlendMode.srcIn),
              ),
              label: 'Perfil'),
        ],
        onTap: (page) {
          pc.animateToPage(page,
              duration: const Duration(microseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}

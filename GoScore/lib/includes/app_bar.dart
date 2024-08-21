import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goscore/notificationlisthomeshow.dart';
import 'package:goscore/stringfile.dart';
import 'package:goscore/theme/thememanager.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badge_alias;

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size(50, 50);
}

class _MainAppBarState extends State<MainAppBar> {
  late ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return AppBar(
      elevation: 0,
      backgroundColor: notifire.backgroundallscreencolor,
      leadingWidth: MediaQuery.of(context).size.width * 0.2,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Image.asset(
            'assets/Menu.png',
            color: notifire.textcolor,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: Text(
        Apptext.homeapp,
        style: TextStyle(
            color: notifire.textcolor,
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
      actions: [
        InkWell(
          onTap: () {
            Get.to(const notifications());
          },
          child: badge_alias.Badge(
            shape: badge_alias.BadgeShape.square,
            toAnimate: false,
            animationType: badge_alias.BadgeAnimationType.scale,
            badgeColor: const Color(0xff0038D9),
            position: badge_alias.BadgePosition.topEnd(top: 14, end: 7.9),
            borderRadius: BorderRadius.circular(12),
            badgeContent: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
            ),
            child: Image.asset(
              'assets/Notification.png',
              color: notifire.textcolor,
              scale: 2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset(
            'assets/Notification2.png',
            scale: 2,
            color: notifire.textcolor,
          ),
        ),
      ],
    );
  }
}

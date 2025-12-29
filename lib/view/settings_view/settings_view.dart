import 'dart:io';

import 'package:flutter/material.dart';

import '../../mixins/app_review_mixin.dart';
import '../../mixins/share_mixin.dart';
import '../../mixins/url_launcher_mixin.dart';
import '../../utils/exports.dart';
import '../../widgets/option_group_widget.dart';
import '../../widgets/option_widget.dart';
import '../about_view/about_view.dart';
import '../how_to_play_view/how_to_play_view.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with AppReviewMixin, ShareMixin, UrlLauncherMixin {
  @override
  void initState() {
    super.initState();
    shareOnStateChanged = () {
      setState(() {});
    };
    reviewOnStateChanged = () {
      setState(() {});
    };
    urlLauncherOnStateChanged = () {
      setState(() {});
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColors.background,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Settings'),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: GameSizes.getWidth(0.05),
        ),
      ),
      body: SingleChildScrollView(
        padding: GameSizes.getSymmetricPadding(0.05, 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // OptionGroup(
            //   options: [
            //     OptionWidget(
            //       title: 'English',
            //       iconData: Icons.language,
            //       iconColor: Colors.blue,
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => AlertDialog(
            //             title: Text('Select Language'),
            //             content: Column(
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 ListTile(
            //                   title: const Text('English'),
            //                   onTap: () {
            //                     LocalizationManager().changeLocale(
            //                       context,
            //                       const Locale('en', 'US'),
            //                     );
            //                     Navigator.pop(context);
            //                   },
            //                 ),
            //                 ListTile(
            //                   title: const Text('Türkçe'),
            //                   onTap: () {
            //                     LocalizationManager().changeLocale(
            //                       context,
            //                       const Locale('tr', 'TR'),
            //                     );
            //                     Navigator.pop(context);
            //                   },
            //                 ),
            //               ],
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ],
            // ),
            OptionGroup(options: [
              OptionWidget(
                title: 'How to play',
                iconData: Icons.play_arrow,
                iconColor: Colors.green,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HowToPlayView(),
                      ));
                },
              ),
            ]),
            OptionGroup(
              options: [
                OptionWidget(
                  title: 'About',
                  iconData: Icons.info,
                  iconColor: Colors.grey,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutView(),
                        ));
                  },
                ),
                if (Platform.isAndroid) ...[
                  OptionWidget(
                    title: 'Rate us',
                    iconData: Icons.star,
                    iconColor: Colors.yellow,
                    loading: reviewLoading,
                    onTap: () async {
                      await openStoreListing();
                    },
                  ),
                  OptionWidget(
                    title: 'Share',
                    iconData: Icons.share,
                    iconColor: Colors.orange,
                    loading: shareLoading,
                    onTap: () async {
                      await shareApp('https://play.google.com/store/apps/details?id=com.recepsenoglu.minesweeper');
                    },
                  ),
                ],
              ],
            ),
            OptionGroup(
              options: [
                OptionWidget(
                  title: 'Privacy Policy',
                  iconData: Icons.privacy_tip,
                  iconColor: Colors.blue,
                  loading: urlLauncherLoading,
                  onTap: () async {
                    await launchURL(
                        'https://www.freeprivacypolicy.com/live/30009f95-7d04-4c58-b126-9ebb2d2acac8');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

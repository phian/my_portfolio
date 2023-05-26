import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio_page/widgets/project_info_widget.dart';

import '../../../widgets/widgets.dart';

class WebPortfolioPage extends StatefulWidget {
  const WebPortfolioPage({Key? key}) : super(key: key);

  @override
  State<WebPortfolioPage> createState() => _WebPortfolioPageState();
}

class _WebPortfolioPageState extends State<WebPortfolioPage> {
  final List<String> titleMenuTexts = const [
    'About',
    'Experience',
    'Projects',
    'Contact',
  ];

  int _hoveringIndex = -1;
  final _scrollController = ScrollController();
  var offsetStream = StreamController<Offset>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MouseRegion(
        onHover: (event) {
          // offsetStream.add(event.localPosition);
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color(0xFF030D1C),
                    Color(0xFF10213E),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 104.0),
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/avatar.jpg',
                                    width: 250.0,
                                    height: 250.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                const Text(
                                  'Nguyễn Phi Ân',
                                  style: TextStyle(
                                    fontSize: 70,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  child: Text(
                                    'Software Engineer',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Flexible(
                                  child: Text(
                                    "\u275D   I'm not the best but I will do all my best\n to complete my work excellently   \u275E",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white60,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                scrollbarTheme: Theme.of(context).scrollbarTheme.copyWith(
                                      thumbColor: MaterialStateProperty.resolveWith((states) {
                                        return Colors.white;
                                      }),
                                      radius: const Radius.circular(8.0),
                                      trackBorderColor: MaterialStateProperty.resolveWith((states) {
                                        return Colors.transparent;
                                      }),
                                      trackColor: MaterialStateProperty.resolveWith((states) {
                                        return Colors.transparent;
                                      }),
                                    ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 104.0),
                                child: Scrollbar(
                                  controller: _scrollController,
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.only(bottom: 64.0, right: 8.0),
                                    controller: _scrollController,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        HeaderWidget(title: titleMenuTexts[0]),
                                        const Padding(
                                          padding: EdgeInsets.only(top: 24.0, bottom: 80.0, right: 8.0),
                                          child: Text(
                                            """My name is Nguyễn Phi Ân. I’m a software engineer and I usually work in mobile development field. I have been studying and working in this industry since 2020. I always want to challenge myself in various areas of mobile application to develop my knowledge and my skills. My dream is to become a Project Manager or a Product Manager in the future.""",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        HeaderWidget(title: titleMenuTexts[1]),
                                        ...List.generate(
                                          3,
                                          (index) => Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 32.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Expanded(
                                                  child: Text(
                                                    'Mar 2021 - Apr 2023',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white54,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 32.0),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        'Lecle Vietnam',
                                                        style: TextStyle(
                                                          fontSize: 20.0,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w900,
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                                                        child: Text(
                                                          'Mobile Developer',
                                                          style: TextStyle(
                                                            fontSize: 20.0,
                                                            color: Colors.white54,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Wrap(
                                                        spacing: 16.0,
                                                        runSpacing: 16.0,
                                                        children: List.generate(
                                                          5,
                                                          (index) => Container(
                                                            decoration: const BoxDecoration(
                                                              color: Color(0xFF183756),
                                                              borderRadius: BorderRadius.all(Radius.circular(16.0)),
                                                            ),
                                                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                                            child: const Text(
                                                              'Flutter',
                                                              style: TextStyle(color: Color(0xFF76EEDA)),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        HeaderWidget(title: titleMenuTexts[2]),
                                        const SizedBox(height: 16.0),
                                        ...List.generate(
                                          1,
                                          (index) => ProjectInfoWidget(
                                            projectImage: 'https://www.scdn.co/i/_global/open-graph-default.png',
                                            projectName: 'Build a Spotify connected app',
                                            projectDescription:
                                                'Video course that teaches how to build a web app with the Spotify Web API. Topics covered include the principles of REST APIs, user auth flows, Node, Express, React, Styled Components, and more.',
                                            projectSkills: const [],
                                            onTap: () {
                                              /// TODO: Handle project tap
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Color(0xFF030D1C),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 32.0, top: 24.0, bottom: 8.0),
                      child: Row(
                        children: [
                          const Stack(
                            alignment: Alignment.center,
                            children: [
                              HexagonWidget(
                                width: 50.0,
                                height: 50.0,
                                backgroundColor: Color(0xFF76EEDA),
                              ),
                              HexagonWidget(
                                width: 44.0,
                                height: 44.0,
                                backgroundColor: Color(0xFF030D1C),
                                child: Text(
                                  'A',
                                  style: TextStyle(color: Color(0xFF76EEDA)),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: List.generate(
                                titleMenuTexts.length,
                                (index) => MouseRegion(
                                  onHover: (_) {
                                    if (_hoveringIndex != index) {
                                      setState(() {
                                        _hoveringIndex = index;
                                      });
                                    }
                                  },
                                  onExit: (_) {
                                    if (_hoveringIndex != -1) {
                                      setState(() {
                                        _hoveringIndex = -1;
                                      });
                                    }
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      /// TODO: Handle menu item tap
                                    },
                                    child: _TopMenuText(
                                      title: '${index + 1}. ${titleMenuTexts[index]}',
                                      hoveringColor: const Color(0xFF76EEDA),
                                      isMouseHovering: _hoveringIndex == index,
                                      margin: const EdgeInsets.only(right: 16.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // StreamBuilder<Offset>(
            //   stream: offsetStream.stream,
            //   builder: (context, snapshot) {
            //     return Container(
            //       width: 100,
            //       height: 100,
            //       transform: Matrix4.translationValues(snapshot.data?.dx ?? 0.0, snapshot.data?.dy ?? 0.0, 0.0),
            //       decoration: const BoxDecoration(
            //         color: Colors.red,
            //         shape: BoxShape.circle,
            //       ),
            //     );
            //   }
            // ),
          ],
        ),
      ),
    );
  }
}

class _TopMenuText extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry margin;
  final bool isMouseHovering;
  final Color? hoveringColor;

  const _TopMenuText({
    Key? key,
    required this.title,
    this.margin = EdgeInsets.zero,
    this.isMouseHovering = false,
    this.hoveringColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Text(
        title,
        style: TextStyle(color: isMouseHovering ? hoveringColor : Colors.white),
      ),
    );
  }
}

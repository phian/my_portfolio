import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ProjectInfoWidget extends StatefulWidget {
  final String projectImage;
  final String projectName;
  final String projectDescription;
  final List<String> projectSkills;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final ImageType imageType;
  final double imageWidth;
  final double imageHeight;
  final TextStyle? projectNameStyle;
  final TextStyle? projectDescriptionStyle;
  final TextStyle? projectNameMouseHoverStyle;
  final Color? hoverBoxColor;
  final BorderRadius? hoverBoxRadius;

  const ProjectInfoWidget({
    Key? key,
    this.imageType = ImageType.network,
    required this.projectImage,
    required this.projectName,
    required this.projectDescription,
    required this.projectSkills,
    this.onTap,
    this.contentPadding,
    this.margin,
    this.imageHeight = 100.0,
    this.imageWidth = 180.0,
    this.projectDescriptionStyle,
    this.projectNameStyle,
    this.projectNameMouseHoverStyle,
    this.hoverBoxColor,
    this.hoverBoxRadius,
  }) : super(key: key);

  @override
  State<ProjectInfoWidget> createState() => _ProjectInfoWidgetState();
}

class _ProjectInfoWidgetState extends State<ProjectInfoWidget> {
  var hoverColor = AppColors.lightGreen;
  var isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        if (!isHovering) {
          setState(() {
            isHovering = true;
          });
        }
      },
      onExit: (event) {
        if (isHovering) {
          setState(() {
            isHovering = false;
          });
        }
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: widget.contentPadding ?? const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          margin: widget.margin,
          decoration: BoxDecoration(
            color: isHovering ? widget.hoverBoxColor ?? Colors.white12 : Colors.transparent,
            borderRadius: widget.hoverBoxRadius ?? const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: switch (widget.imageType) {
                      ImageType.assets => Image.asset(
                          widget.projectImage,
                          width: widget.imageWidth,
                          height: widget.imageHeight,
                          fit: BoxFit.cover,
                        ),
                      ImageType.network => Image.network(
                          widget.projectImage,
                          width: widget.imageWidth,
                          height: widget.imageHeight,
                          fit: BoxFit.cover,
                          loadingBuilder: (_, child, event) {
                            if (event == null) return child;
                            return const CircularProgressIndicator();
                          },
                          errorBuilder: (_, error, stacktrace) {
                            return const Placeholder();
                          },
                        ),
                      ImageType.file => Image.file(
                          File(widget.projectImage),
                          width: widget.imageWidth,
                          height: widget.imageHeight,
                          fit: BoxFit.cover,
                          errorBuilder: (_, error, stacktrace) {
                            return const Placeholder();
                          },
                        ),
                    },
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.projectName,
                      style: (!isHovering ? widget.projectNameStyle : widget.projectNameMouseHoverStyle) ??
                          TextStyle(
                            fontSize: 22.0,
                            color: isHovering ? hoverColor : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      widget.projectDescription,
                      style: widget.projectDescriptionStyle ??
                          const TextStyle(
                            fontSize: 18.0,
                            color: Colors.white70,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

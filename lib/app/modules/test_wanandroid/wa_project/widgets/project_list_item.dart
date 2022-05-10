import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../data/models/project.dart';

/// 项目列表item widget
class ProjectListItem extends StatelessWidget {
  final Project project;

  ProjectListItem(
    this.project, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 0.5, color: Colors.black26))),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///标题
                  Text(
                    project.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 10),

                  ///部分内容
                  Text(
                    project.desc,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(color: Color(0xFF6A6969), fontSize: 14),
                  ),
                  SizedBox(height: 10),

                  ///作者
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/program.svg',
                        width: 16,
                      ),
                      SizedBox(height: 10),
                      Text(
                        project.author,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style:
                            TextStyle(color: Color(0xFF6A6969), fontSize: 14),
                      )
                    ],
                  ),
                  SizedBox(height: 10),

                  ///发布时间
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/date_time.svg',
                        width: 16,
                      ),
                      SizedBox(height: 10),
                      Text(project.niceDate,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style:
                              TextStyle(color: Color(0xFF6A6969), fontSize: 14))
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                project.envelopePic,
                fit: BoxFit.fill,
                width: 72,
                height: 128,
              ),
            )
          ],
        ),
      ),
    );
  }
}

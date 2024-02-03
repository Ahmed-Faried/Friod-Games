import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';




class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ConditionalBuilder(
      condition: true,
      builder: (BuildContext context) {
        return Container(color: Colors.blue,);
      },
      fallback: (BuildContext context) {
        return Center(child: ListView.builder(

          itemCount: 1,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(color: Colors.white),
              child: SkeletonItem(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                                shape: BoxShape.circle, width: 60, height: 60),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SkeletonParagraph(
                                style: SkeletonParagraphStyle(
                                    lines: 1,
                                    spacing: 6,
                                    lineStyle: SkeletonLineStyle(
                                      randomLength: false,
                                      height: 12,
                                      width: 150,
                                      borderRadius: BorderRadius.circular(8),

                                    )),
                              ),
                              SkeletonParagraph(
                                style: SkeletonParagraphStyle(
                                    lines: 1,
                                    spacing: 6,
                                    lineStyle: SkeletonLineStyle(
                                      randomLength: false,
                                      height: 12,
                                      width: 130,
                                      borderRadius: BorderRadius.circular(8),

                                    )),
                              ),
                            ],
                          ),
                          Spacer(),
                          SkeletonAvatar(
                              style: SkeletonAvatarStyle(width: 40, height: 40)),
                        ],
                      ),
                      SizedBox(height: 50),
                      SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 40,
                            width: double.infinity,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      SizedBox(height: 50),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,

                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                    shape: BoxShape.circle, width: 60, height: 60),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  children: [
                                    SkeletonParagraph(
                                      style: SkeletonParagraphStyle(
                                          lines: 1,
                                          spacing: 4,
                                          lineStyle: SkeletonLineStyle(
                                            randomLength: false,
                                            height: 12,
                                            width: 150,
                                            borderRadius: BorderRadius.circular(8),

                                          )),
                                    ),
                                    SkeletonParagraph(
                                      style: SkeletonParagraphStyle(
                                          lines: 1,
                                          spacing: 4,
                                          lineStyle: SkeletonLineStyle(
                                            randomLength: false,
                                            height: 2,
                                            width: double.infinity,
                                            borderRadius: BorderRadius.circular(8),

                                          )),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SkeletonParagraph(
                                              style: SkeletonParagraphStyle(
                                                  lines:2,
                                                  spacing: 6,
                                                  lineStyle: SkeletonLineStyle(
                                                    randomLength: false,
                                                    height: 12,
                                                    width: 120,
                                                    borderRadius: BorderRadius.circular(8),

                                                  )),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SkeletonParagraph(
                                              style: SkeletonParagraphStyle(
                                                  lines:2,
                                                  spacing: 6,
                                                  lineStyle: SkeletonLineStyle(
                                                    randomLength: false,
                                                    height: 12,
                                                    width: 70,
                                                    borderRadius: BorderRadius.circular(8),

                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,

                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                    shape: BoxShape.circle, width: 60, height: 60),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  children: [
                                    SkeletonParagraph(
                                      style: SkeletonParagraphStyle(
                                          lines: 1,
                                          spacing: 4,
                                          lineStyle: SkeletonLineStyle(
                                            randomLength: false,
                                            height: 12,
                                            width: 150,
                                            borderRadius: BorderRadius.circular(8),

                                          )),
                                    ),
                                    SkeletonParagraph(
                                      style: SkeletonParagraphStyle(
                                          lines: 1,
                                          spacing: 4,
                                          lineStyle: SkeletonLineStyle(
                                            randomLength: false,
                                            height: 2,
                                            width: double.infinity,
                                            borderRadius: BorderRadius.circular(8),

                                          )),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SkeletonParagraph(
                                              style: SkeletonParagraphStyle(
                                                  lines:2,
                                                  spacing: 6,
                                                  lineStyle: SkeletonLineStyle(
                                                    randomLength: false,
                                                    height: 12,
                                                    width: 120,
                                                    borderRadius: BorderRadius.circular(8),

                                                  )),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SkeletonParagraph(
                                              style: SkeletonParagraphStyle(
                                                  lines:2,
                                                  spacing: 6,
                                                  lineStyle: SkeletonLineStyle(
                                                    randomLength: false,
                                                    height: 12,
                                                    width: 70,
                                                    borderRadius: BorderRadius.circular(8),

                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,

                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                    shape: BoxShape.circle, width: 60, height: 60),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  children: [
                                    SkeletonParagraph(
                                      style: SkeletonParagraphStyle(
                                          lines: 1,
                                          spacing: 4,
                                          lineStyle: SkeletonLineStyle(
                                            randomLength: false,
                                            height: 12,
                                            width: 150,
                                            borderRadius: BorderRadius.circular(8),

                                          )),
                                    ),
                                    SkeletonParagraph(
                                      style: SkeletonParagraphStyle(
                                          lines: 1,
                                          spacing: 4,
                                          lineStyle: SkeletonLineStyle(
                                            randomLength: false,
                                            height: 2,
                                            width: double.infinity,
                                            borderRadius: BorderRadius.circular(8),

                                          )),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SkeletonParagraph(
                                              style: SkeletonParagraphStyle(
                                                  lines:2,
                                                  spacing: 6,
                                                  lineStyle: SkeletonLineStyle(
                                                    randomLength: false,
                                                    height: 12,
                                                    width: 120,
                                                    borderRadius: BorderRadius.circular(8),

                                                  )),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SkeletonParagraph(
                                              style: SkeletonParagraphStyle(
                                                  lines:2,
                                                  spacing: 6,
                                                  lineStyle: SkeletonLineStyle(
                                                    randomLength: false,
                                                    height: 12,
                                                    width: 70,
                                                    borderRadius: BorderRadius.circular(8),

                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white70,

                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                    shape: BoxShape.circle, width: 60, height: 60),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  children: [
                                    SkeletonParagraph(
                                      style: SkeletonParagraphStyle(
                                          lines: 1,
                                          spacing: 4,
                                          lineStyle: SkeletonLineStyle(
                                            randomLength: false,
                                            height: 12,
                                            width: 150,
                                            borderRadius: BorderRadius.circular(8),

                                          )),
                                    ),
                                    SkeletonParagraph(
                                      style: SkeletonParagraphStyle(
                                          lines: 1,
                                          spacing: 4,
                                          lineStyle: SkeletonLineStyle(
                                            randomLength: false,
                                            height: 2,
                                            width: double.infinity,
                                            borderRadius: BorderRadius.circular(8),

                                          )),
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SkeletonParagraph(
                                              style: SkeletonParagraphStyle(
                                                  lines:2,
                                                  spacing: 6,
                                                  lineStyle: SkeletonLineStyle(
                                                    randomLength: false,
                                                    height: 12,
                                                    width: 120,
                                                    borderRadius: BorderRadius.circular(8),

                                                  )),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            SkeletonParagraph(
                                              style: SkeletonParagraphStyle(
                                                  lines:2,
                                                  spacing: 6,
                                                  lineStyle: SkeletonLineStyle(
                                                    randomLength: false,
                                                    height: 12,
                                                    width: 70,
                                                    borderRadius: BorderRadius.circular(8),

                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ));
      },
    );
  }
}

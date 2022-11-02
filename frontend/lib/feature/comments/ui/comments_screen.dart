// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rewards_portal/feature/comments/domain/cubits/comment_cubit.dart';
import 'package:rewards_portal/feature/comments/domain/cubits/comment_state.dart';
import 'package:rewards_portal/feature/comments/domain/models/comment_model.dart';
import 'package:rewards_portal/feature/home/domain/cubits/home_cubit.dart';
import 'package:rewards_portal/feature/home/ui/widgets/comments_shimmer.dart';
import 'package:rewards_portal/feature/home/ui/widgets/custom_shimmer.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({
    Key? key,
    required this.postId,
  }) : super(key: key);

  final String postId;

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    context.read<CommentCubit>().getComments(widget.postId);
    super.initState();
  }

  showAlertDialog(BuildContext context, String commentId) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: TextStyle(color: Colors.green),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Delete", style: TextStyle(color: Colors.red)),
      onPressed: () {
        context.read<CommentCubit>().deleteComment(widget.postId, commentId);
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Would you like to delete this comment?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: true,
      child: BlocBuilder<CommentCubit, CommentState>(
        builder: (BuildContext context, CommentState state) {
          return Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 40,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Comments',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 00,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            context.read<HomeCubit>().getFeeds();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      state.isLoading == true
                          ? Container(
                              child: ListView.builder(
                                padding: EdgeInsets.only(
                                    bottom: 90, left: 12, right: 12),
                                itemCount: 10,
                                reverse: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return const CustomShimmer(
                                      child: CommentsShimmer());
                                },
                              ),
                            )
                          : state.commentsList.isEmpty
                              ? Center(
                                  child: Text('No comments at this moment'),
                                )
                              : ListView.builder(
                                  itemCount: state.commentsList.length,
                                  padding: EdgeInsets.only(
                                      bottom: 90, left: 12, right: 12),
                                  reverse: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final comment = state.commentsList[index];
                                    List? name = comment.authEmail.split('@');
                                    return comment.authEmail ==
                                            'julian.s@grootan.com'
                                        ? GestureDetector(
                                            onLongPress: () => showAlertDialog(
                                                context,
                                                state.commentsList[index].id),
                                            child: Container(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        '${name.first ?? ''}',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      CircleAvatar(
                                                        maxRadius: 20,
                                                        child: Text(
                                                            '${name.first[0].toString().toUpperCase()}'),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 50),
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Colors.lightBlue[50],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(15),
                                                        bottomRight:
                                                            Radius.circular(15),
                                                        topLeft:
                                                            Radius.circular(15),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10,
                                                          horizontal: 8),
                                                      child: Text(
                                                        comment.message,
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      maxRadius: 20,
                                                      child: Text(
                                                          '${name.first[0].toString().toUpperCase()}'),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      '${name.first ?? ''}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 50),
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(15),
                                                      bottomRight:
                                                          Radius.circular(15),
                                                      topRight:
                                                          Radius.circular(15),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10,
                                                        horizontal: 8),
                                                    child: Text(
                                                      comment.message,
                                                      style: TextStyle(
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                  }),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Card(
                          elevation: 0,
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(20),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, -7),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: TextField(
                                      maxLines: 3,
                                      controller: _controller,
                                      decoration: InputDecoration(
                                          hintText: 'Enter comments here',
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    // state.commentsList.add(CommentModel(
                                    //   id: 'id',
                                    //   authEmail: 'antony.rejimal@grootan.com',
                                    //   message: '${_controller.text}',
                                    //   postId: 'postId',
                                    // ));

                                    context.read<CommentCubit>().createComments(
                                        widget.postId, _controller.text);
                                    _controller.clear();
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.send),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

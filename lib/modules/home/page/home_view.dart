import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptinformatikamediapratama/lib.dart';
import 'package:ptinformatikamediapratama/modules/home/bottom_sheet/bottom_sheet.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ListFAQCubit _listFAQCubit = ListFAQCubit();
  final DeleteFAQCubit _deleteFAQCubit = DeleteFAQCubit();
  final LogoutCubit _logoutCubit = LogoutCubit();
  final scrollController = ScrollController();

  List<ListFAQDatum> dataListFAQ = [];
  LoginModel userProfile = LoginModel();

  int currentPage = 1;
  int rowPage = 15;
  int maxPage = 1;
  int selectedIndex = 1;
  bool isLoading = false;

  Future getUserProfile() async {
    userProfile = LoginModel.fromJson(jsonDecode("${await SharedPrefsStorage.getUserProfile()}"));
    setState(() {});
  }

  @override
  void initState() {
    _listFAQCubit.get(
      data: ListFAQParram(
        page: "$currentPage",
        row: "$rowPage",
      ),
    );
    getUserProfile();
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (isTop) {
        } else {
          if (currentPage < maxPage) {
            setState(() {
              isLoading = true;
              currentPage += 1;
              _listFAQCubit.get(
                data: ListFAQParram(
                  page: "$currentPage",
                  row: "$rowPage",
                ),
              );
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _logoutCubit,
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (cLogout, sLogout) {
          if (sLogout is OnLoadingLogout) {}
          if (sLogout is OnSuccessLogout) {
            Navigator.pushReplacementNamed(context, routeLogin);
          }
          if (sLogout is OnErrorLogout) {}
        },
        builder: (cLogout, sLogout) {
          return Scaffold(
            backgroundColor: fullBackground,
            appBar: AppBarTextTitleNoElevation(
              context,
              text: "FAQ",
              canBack: false,
              isCenter: true,
              backgroundColor: primary,
              textColor: Colors.white,
              action: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      builder: (context) => AddFAQBottomSheet(
                        callback: (value) {
                          setState(() {
                            dataListFAQ.insert(0, value);
                          });
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Alert(
                          callback: (bool value) {
                            if (value) {
                              _logoutCubit.post();
                            }
                          },
                          content: 'Are u sure want to logout ?',
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                  ),
                ),
              ],
            ),
            body: BlocProvider(
              create: (context) => _deleteFAQCubit,
              child: BlocProvider(
                create: (context) => _listFAQCubit,
                child: BlocConsumer<DeleteFAQCubit, DeleteFAQState>(
                  listener: (cDelete, sDelete) {
                    if (sDelete is OnLoadingDeleteFAQ) {}
                    if (sDelete is OnSuccessDeleteFAQ) {
                      dataListFAQ.removeAt(selectedIndex);
                      showSnackBar(context, "${sDelete.data?.message}");
                    }
                    if (sDelete is OnErrorDeleteFAQ) {}
                  },
                  builder: (cDelete, sDelete) {
                    return BlocConsumer<ListFAQCubit, ListFAQState>(
                      listener: (cList, sList) async {
                        if (sList is OnSuccessListFAQ) {
                          setState(() {
                            sList.data?.data?.forEach((data) {
                              dataListFAQ.add(data);
                            });

                            getMaxPage(
                              totalRow: sList.data?.pagination?.totalRows ?? 0,
                              rowPage: rowPage,
                              setValue: (value) {
                                setState(() {
                                  maxPage = value;
                                });
                              },
                            );

                            isLoading = false;

                            for (int i = 0; i < dataListFAQ.length; i++) {
                              dataListFAQ[i].controller?.addListener(() {
                                if (dataListFAQ[i].controller!.value) {
                                  final notSelected = dataListFAQ.where((element) => dataListFAQ.indexOf(element) != i).toList();

                                  for (var item in notSelected) {
                                    item.controller!.value = false;
                                  }
                                  dataListFAQ[i].controller!.value = true;
                                }
                              });
                            }
                          });
                        }
                      },
                      builder: (cList, sList) {
                        if (sList is OnLoadingListFAQ && dataListFAQ.isEmpty) {
                          return skeletonListFAQWidget();
                        }
                        if (sList is OnErrorListFAQ) {
                          return const Center(
                            child: Text("Terjadi kesalahan"),
                          );
                        }
                        return SingleChildScrollView(
                          controller: scrollController,
                          physics: const ClampingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ExpandableCardWidget(
                                    key: ValueKey(dataListFAQ[index].id),
                                    id: dataListFAQ[index].id ?? 0,
                                    expandableController: dataListFAQ[index].controller,
                                    jawaban: '${dataListFAQ[index].jawaban}',
                                    pertanyaan: '${dataListFAQ[index].pertanyaan}',
                                    isEnableSlidable: userProfile.data?.level != "superadmin" ? false : true,
                                    onPressedDelete: (context) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Alert(
                                            callback: (bool value) {
                                              if (value) {
                                                _deleteFAQCubit.delete(
                                                  data: DeleteFAQParram(id: dataListFAQ[index].id ?? 0),
                                                );
                                                setState(() {
                                                  selectedIndex = index;
                                                });
                                              }
                                            },
                                            content: 'Are you sure want to delete this FAQ ?',
                                          );
                                        },
                                      );
                                    },
                                    onPressedEdit: (context) {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                        ),
                                        builder: (context) => EditFAQBottomSheet(
                                          data: dataListFAQ[index],
                                          callback: (value) {
                                            setState(() {
                                              dataListFAQ[index] = value;
                                            });
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                                itemCount: dataListFAQ.length,
                              ),
                              if (isLoading && dataListFAQ.isNotEmpty) ...[
                                loadMoreIndicatorWidget(),
                              ],
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

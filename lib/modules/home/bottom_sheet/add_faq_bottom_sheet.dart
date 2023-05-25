import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class AddFAQBottomSheet extends StatefulWidget {
  final ValueSetter<ListFAQDatum> callback;

  const AddFAQBottomSheet({Key? key, required this.callback}) : super(key: key);

  @override
  State<AddFAQBottomSheet> createState() => _AddFAQBottomSheetState();
}

class _AddFAQBottomSheetState extends State<AddFAQBottomSheet> {
  final AddFAQCubit _addFAQCubit = AddFAQCubit();

  TextEditingController pertanyaanTextEditingController = TextEditingController();
  TextEditingController jawabanTextEditingController = TextEditingController();

  bool statusPublish = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _addFAQCubit,
      child: BlocConsumer<AddFAQCubit, AddFAQState>(
        listener: (cAddFAQ, sAddFAQ) {
          if (sAddFAQ is OnLoadingAddFAQ) {
            setState(() {
              isLoading = true;
            });
          }
          if (sAddFAQ is OnSuccessAddFAQ) {
            showSnackBar(context, sAddFAQ.data?.message ?? "");
            widget.callback(
              ListFAQDatum(
                id: sAddFAQ.data?.data?.id,
                pertanyaan: sAddFAQ.data?.data?.pertanyaan,
                jawaban: sAddFAQ.data?.data?.jawaban,
                statusPublish: sAddFAQ.data?.data?.statusPublish == true ? 1 : 0,
                createdAt: sAddFAQ.data?.data?.createdAt,
                updatedAt: sAddFAQ.data?.data?.updatedAt,
              ),
            );
            Navigator.pop(context);
            setState(() {
              isLoading = false;
            });
          }
          if (sAddFAQ is OnErrorAddFAQ) {
            setState(() {
              isLoading = false;
            });
          }
        },
        builder: (cAddFAQ, sAddFAQ) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Tambah FAQ",
                    style: textExtraLarge(color: neutral90),
                  ),
                  AppDimens.verticalSpace24,
                  TittleAndTextField(
                    tittle: "Pertanyaan",
                    maxLines: 2,
                    controller: pertanyaanTextEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Silahkan isi kolom ini !";
                      }
                    },
                  ),
                  TittleAndTextField(
                    tittle: "Jawaban",
                    maxLines: 10,
                    controller: jawabanTextEditingController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Silahkan isi kolom ini !";
                      }
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: statusPublish,
                        onChanged: (value) {
                          setState(() {
                            statusPublish = !statusPublish;
                          });
                        },
                      ),
                      Text(
                        "FAQ For Public ?",
                        style: textNormal(color: neutral90),
                      ),
                    ],
                  ),
                  AppDimens.verticalSpace12,
                  BigButton(
                    text: "Tambah FAQ",
                    textStyle: textMedium(color: neutral30, isBold: true),
                    isLoading: isLoading,
                    onTap: () {
                      if (!isLoading) {
                        _addFAQCubit.post(
                          data: AddFAQParram(
                            pertanyaan: pertanyaanTextEditingController.text,
                            jawaban: jawabanTextEditingController.text,
                            status_publish: statusPublish,
                          ),
                        );
                      }
                    },
                  ),
                  Container(
                    height: MediaQuery.of(context).padding.bottom,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

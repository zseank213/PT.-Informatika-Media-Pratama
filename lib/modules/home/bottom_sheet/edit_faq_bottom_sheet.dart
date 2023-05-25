import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class EditFAQBottomSheet extends StatefulWidget {
  final ListFAQDatum data;
  final ValueSetter<ListFAQDatum> callback;

  const EditFAQBottomSheet({Key? key, required this.callback, required this.data}) : super(key: key);

  @override
  State<EditFAQBottomSheet> createState() => _EditFAQBottomSheetState();
}

class _EditFAQBottomSheetState extends State<EditFAQBottomSheet> {
  final EditFAQCubit _editFAQCubit = EditFAQCubit();

  TextEditingController pertanyaanTextEditingController = TextEditingController();
  TextEditingController jawabanTextEditingController = TextEditingController();

  bool statusPublish = true;
  bool isLoading = false;

  @override
  void initState() {
    pertanyaanTextEditingController.text = "${widget.data.pertanyaan}";
    jawabanTextEditingController.text = "${widget.data.jawaban}";
    statusPublish = widget.data.statusPublish == 1 ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _editFAQCubit,
      child: BlocConsumer<EditFAQCubit, EditFAQState>(
        listener: (cEdit, sEdit) {
          if (sEdit is OnLoadingEditFAQ) {
            setState(() {
              isLoading = true;
            });
          }
          if (sEdit is OnSuccessEditFAQ) {
            showSnackBar(context, sEdit.data?.message ?? "");
            widget.callback(
              ListFAQDatum(
                id: sEdit.data?.data?.id,
                pertanyaan: sEdit.data?.data?.pertanyaan,
                jawaban: sEdit.data?.data?.jawaban,
                statusPublish: sEdit.data?.data?.statusPublish == true ? 1 : 0,
                createdAt: sEdit.data?.data?.createdAt,
                updatedAt: sEdit.data?.data?.updatedAt,
              ),
            );
            Navigator.pop(context);
            setState(() {
              isLoading = false;
            });
          }
          if (sEdit is OnErrorEditFAQ) {
            setState(() {
              isLoading = false;
            });
          }
        },
        builder: (cEdit, sEdit) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Edit FAQ",
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
                    text: "Simpan",
                    textStyle: textMedium(color: neutral30, isBold: true),
                    isLoading: isLoading,
                    onTap: () {
                      if (!isLoading) {
                        _editFAQCubit.post(
                          data: EditFAQParram(
                            id: widget.data.id ?? 0,
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

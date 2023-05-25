import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ptinformatikamediapratama/lib.dart';

class DetailFAQView extends StatefulWidget {
  final DetailFAQParram faqId;

  const DetailFAQView({
    Key? key,
    required this.faqId,
  }) : super(key: key);

  @override
  State<DetailFAQView> createState() => _DetailFAQViewState();
}

class _DetailFAQViewState extends State<DetailFAQView> {
  final DetailFAQCubit _detailFAQCubit = DetailFAQCubit();

  bool isLoading = false;

  @override
  void initState() {
    _detailFAQCubit.get(data: widget.faqId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTextTitleNoElevation(
        context,
        text: "Detail FAQ",
        canBack: true,
        isCenter: true,
        backgroundColor: primary,
        textColor: Colors.white,
        iconColor: Colors.white,
      ),
      body: BlocProvider(
        create: (context) => _detailFAQCubit,
        child: BlocConsumer<DetailFAQCubit, DetailFAQState>(
          listener: (cDetail, sDetail) {
            if (sDetail is OnLoadingDetailFAQ) {
              setState(() {
                isLoading = true;
              });
            }
            if (sDetail is OnSuccessDetailFAQ) {
              setState(() {
                isLoading = false;
              });
            }
            if (sDetail is OnErrorDetailFAQ) {
              setState(() {
                isLoading = false;
              });
            }
          },
          builder: (cDetail, sDetail) {
            if (sDetail is OnLoadingDetailFAQ) {
              return skeletonDetailFAQWidget(context);
            }
            if (sDetail is OnSuccessDetailFAQ) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${sDetail.data?.data?.pertanyaan}",
                      style: textLarge(color: neutral90, isBold: true),
                    ),
                    AppDimens.verticalSpace24,
                    Html(
                      data: '''${sDetail.data?.data?.jawaban}''',
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

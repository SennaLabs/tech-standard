import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tooling/core/enum/network_status.dart';
import 'package:tooling/core/models/models.dart';
import 'package:tooling/core/theme/app_theme.dart';
import 'package:tooling/core/widgets/example/example_card.dart';
import 'package:tooling/features/home/cubit/home_cubit.dart';

part "../widgets/photo_list.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          if (state.status.isSuccess) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Photo list',
                      style: GoogleFonts.alike(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const HomePhotoList(),
                ],
              ),
            );
          }
          return Center(
            child: Text(state.statusMessage),
          );
        },
      ),
    );
  }
}

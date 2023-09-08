import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tooling/core/enum/network_status.dart';
import 'package:tooling/core/models/models.dart';
import 'package:tooling/core/widgets/example/example_card.dart';
import 'package:tooling/features/example/cubit/example_cubit.dart';
import 'package:google_fonts/google_fonts.dart';

class ExampleLayout extends StatelessWidget {
  const ExampleLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ExampleCubit, ExampleState>(
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
                    GridView.builder(
                      padding: const EdgeInsets.all(16.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.photos.length,
                      itemBuilder: (context, index) {
                        Photo photo = state.photos[index];
                        return ExampleCard(
                          child: Column(
                            children: [
                              SizedBox.square(
                                dimension: 50.0,
                                child: Container(
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: ClipOval(
                                    child: Image.network(photo.thumbnailUrl),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Expanded(
                                child: Text(
                                  photo.title,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.alike(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Text(state.statusMessage),
            );
          },
        ),
      ),
    );
  }
}

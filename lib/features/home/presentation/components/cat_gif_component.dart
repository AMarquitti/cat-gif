import 'package:app/features/home/domain/entities/cat_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/res/color_palette.dart';
import '../cubits/cat_cubit/cat_cubit.dart';

class CatGifComponent extends StatelessWidget {
  const CatGifComponent({
    Key? key,
    required this.baseUrl,
    required this.catCubit,
  }) : super(key: key);

  final CatCubit catCubit;
  final String baseUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatCubit>(
        create: (_) => catCubit..fetchCatData(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _buildCatGif(),
            ),
          ],
        ));
  }

  Widget _buildCatGif() {
    return Builder(builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CatCubit, CatState>(
            builder: _buildCatGifByState,
          ),
          const SizedBox(height: 30),
          _buildButton(),
        ],
      );
    });
  }

  Widget _buildButton() {
    return ElevatedButton(
        onPressed: () => catCubit.fetchCatData(),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(20),
          backgroundColor:
              MaterialStateProperty.all<Color>(ColorPalette.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            // ignore: avoid_redundant_argument_values
          )),
        ),
        child: const Text('Generate'));
  }

  Widget _buildCatGifByState(
    BuildContext context,
    CatState state,
  ) {
    return state.maybeWhen(
      initial: () => _buildProgressIndicator(),
      loading: () => _buildProgressIndicator(),
      dataLoaded: (CatEntity catEntity) => _buildGifContainer(catEntity),
      orElse: () => _buildError(context),
    );
  }

  Widget _buildProgressIndicator() {
    return Center(
      child: Container(
        height: 20,
        width: 20,
        margin: const EdgeInsets.all(5),
        child: const CircularProgressIndicator(
          strokeWidth: 2.0,
          valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primaryColor),
        ),
      ),
    );
  }

  Widget _buildError(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Icon(
          Icons.not_interested,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildGifContainer(CatEntity catEntity) {
    final String url = '$baseUrl${catEntity.url}';
    return Image.network(url, width: 200, height: 200,);
  }
}

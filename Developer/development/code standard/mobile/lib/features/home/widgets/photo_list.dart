part of "../screen/home_screen.dart";

class HomePhotoList extends StatelessWidget {
  const HomePhotoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, List<Photo>>(
      selector: (state) => state.photos,
      builder: (_, photos) => GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          Photo photo = photos[index];
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
                    style: AppTheme.font.mitrS14.copyWith(fontWeight: FontWeight.w300),
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

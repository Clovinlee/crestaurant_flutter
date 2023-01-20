import 'package:cflutter4/constants.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

void open(BuildContext context, final int index, final String tag,
    List<String> listThumbnail) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => GalleryPhotoViewWrapper(
        listThumbnail: listThumbnail,
        tag: tag,
        backgroundDecoration: BoxDecoration(
          color: AppConstant.black3,
        ),
        initialIndex: index,
        scrollDirection: Axis.horizontal,
      ),
    ),
  );
}

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    Key? key,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.tag,
    required this.listThumbnail,
    this.scrollDirection = Axis.horizontal,
  })  : pageController = PageController(initialPage: initialIndex),
        super(key: key);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<String> listThumbnail;
  final Axis scrollDirection;
  final String tag;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.listThumbnail.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Image ${currentIndex + 1}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  decoration: null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final String img = widget.listThumbnail[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: AssetImage("assets/images/$img"),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: widget.tag),
    );
  }
}

class GalleryExampleItem {
  GalleryExampleItem({
    required this.id,
    required this.resource,
    this.isSvg = false,
  });

  final String id;
  final String resource;
  final bool isSvg;
}

class GalleryExampleItemThumbnail extends StatelessWidget {
  const GalleryExampleItemThumbnail({
    Key? key,
    required this.onTap,
    required this.tag,
    required this.image,
    this.imgHeight = 80.0,
  }) : super(key: key);

  final GestureTapCallback onTap;
  final String tag;
  final String image;
  final double imgHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: tag,
          child: Image.asset("assets/images/$image", height: imgHeight),
        ),
      ),
    );
  }
}

List<GalleryExampleItem> galleryItems = <GalleryExampleItem>[
  GalleryExampleItem(
    id: "tag1",
    resource: "assets/gallery1.jpg",
  ),
  GalleryExampleItem(id: "tag2", resource: "assets/firefox.svg", isSvg: true),
  GalleryExampleItem(
    id: "tag3",
    resource: "assets/gallery2.jpg",
  ),
  GalleryExampleItem(
    id: "tag4",
    resource: "assets/gallery3.jpg",
  ),
];

class ModifierButton extends StatelessWidget {
  const ModifierButton({
    Key? key,
    required this.txt,
    required this.func,
    required this.bgColor,
    required this.txtColor,
    required this.btnSize,
  }) : super(
          key: key,
        );

  final Color bgColor;
  final Color txtColor;
  final String txt;
  final double btnSize;
  final void Function() func;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: func,
      style: TextButton.styleFrom(
          backgroundColor: bgColor,
          padding: EdgeInsets.zero,
          minimumSize: Size(btnSize, btnSize),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          alignment: Alignment.center),
      child: Text(
        txt,
        style: TextStyle(
            color: txtColor, fontWeight: FontWeight.w500, fontSize: 25),
      ),
    );
  }
}

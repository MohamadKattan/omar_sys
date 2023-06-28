import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:omar_system/services/databasehelper.dart';
import '../services/api_links.dart';

class GetImagesWidget extends StatefulWidget {
  final String id;
  final double width;
  const GetImagesWidget({Key? key, required this.id, required this.width})
      : super(key: key);

  @override
  State<GetImagesWidget> createState() => _GetImagesWidgetState();
}

class _GetImagesWidgetState extends State<GetImagesWidget> {
  String? image;
  bool noImage = false;

  getImage() {
    databaseHelper.getData("$getMedia${widget.id}").then((data) {
      // image=  (data.data as dynamic)?.data['data']['media_info']['url'];
      if (kDebugMode) {
        print('getImage');
      }
      image = data.data['data']['media_info']['url'];
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.id != '') {
      getImage();
    } else {
      noImage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return noImage
        ? Image.asset(
            'assets/images/no-image-found.png',
            fit: BoxFit.cover,
          )
        : CachedNetworkImage(
            width: widget.width,
            fit: BoxFit.cover,
            imageUrl: image ?? '',
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) =>
                const Center(child: CircularProgressIndicator()),
          );
  }
}
//
// width: 500,
// fit: BoxFit.cover,

import 'package:fabrics_design/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../home_screen/widgets/shimmer_effect.dart';
import 'circular_image.dart';

// class ZohUserProfileTile extends StatelessWidget {
//   const ZohUserProfileTile({
//     super.key,
//     required this.onPressed,
//   });
//
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = UserController.instance;
//     return ListTile(
//       leading: Obx(() {
//         final networkImage = controller.user.value.profilePicture;
//         final image =
//         networkImage.isNotEmpty ? networkImage : ZohImageStrings.location;
//         return controller.imageUploading.value
//             ? const ZohShimmerEffect(
//           width: 80,
//           height: 80,
//           radius: 80,
//         )
//             : ZohCircularImage(
//           image: image,
//           width: 56,
//           isNetworkImage: networkImage.isNotEmpty,
//           height: 56,
//         );
//       }),
//       title: Text(
//         controller.user.value.fullName,
//         style: Theme.of(context)
//             .textTheme
//             .headlineSmall!
//             .apply(color: ZohColors.white),
//       ),
//       subtitle: Text(
//         controller.user.value.email,
//         style:
//         Theme.of(context).textTheme.bodyMedium!.apply(color: ZohColors.white),
//       ),
//       trailing: IconButton(
//         onPressed: onPressed,
//         icon: const Icon(
//           Iconsax.edit,
//           color: ZohColors.white,
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/styles.dart';
// import '../../domain/entities/quote.dart';
//
// class AuthorTitleAndFavouriteButton extends StatelessWidget {
//   const AuthorTitleAndFavouriteButton({super.key, required this.quote});
//   final Quote quote;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       clipBehavior: Clip.none,
//       children: [
//         Center(
//           child: Text(
//             "“${quote.author}”",
//             style: TextStyles.font22WhiteMedium,
//             textAlign: TextAlign.center,
//           ),
//         ),
//         Positioned(
//           right: 0,
//           child: IconButton(
//             onPressed: () {},
//             icon: CircleAvatar(
//               backgroundColor: Colors.white,
//               child: Icon(
//                 FontAwesomeIcons.heart,
//                 color: AppColors.primaryColor,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';


// class Shimmer extends StatefulWidget {
//   final Widget child;
//   final Duration baseDuration;

//   const Shimmer({
//     super.key,
//     required this.child,
//     this.baseDuration = const Duration(milliseconds: 1500),
//   });

//   @override
//   State<Shimmer> createState() => _ShimmerState();
// }

// class _ShimmerState extends State<Shimmer> with TickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _shimmerAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: widget.baseDuration)
//       ..repeat(reverse: true);
//     _shimmerAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ShimmerPaint(
//           child: widget.child,
//           gradient: LinearGradient(
//             colors: [
//               Colors.grey[300]!.withOpacity(_shimmerAnimation.value),
//               Colors.grey[100]!.withOpacity(_shimmerAnimation.value),
//             ],
//             stops: const [0.4, 0.8],
//           ),
//         ),
//         widget.child,
//       ],
//     );
//   }
// }

// class ShimmerPaint extends StatelessWidget {
//   final Widget child;
//   final Gradient gradient;

//   const ShimmerPaint({
//     super.key,
//     required this.child,
//     required this.gradient,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//       shaderCallback: gradient.createShader(Rect.fromLTRB(0, 0, context.size!.width, context.size!.height)),
//       child: child,
//     );
//   }
// }



          

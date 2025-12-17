import 'package:booknoke/core/assets/assets.dart';
import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

class Intro2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
    color: ColorsManager.darkSecondary,
       child: Center(
      child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
      
        children: [ 
      // Image.asset(
      //             Assets.into2,
      //             // width: 20,
      //             // height: 20,
      //           ),
      //            const SizedBox(height: 20),
              Text(
                'Connect through Stories',
                style: Theme.of(context).textTheme.bodyLarge,
                
              ),
               const SizedBox(height: 20),
             Text(
  'Discover what your friends are reading and share your own favorites.\n'
  'Build a vibrant reading community together.',
  style: Theme.of(context).textTheme.bodyMedium,
  textAlign: TextAlign.center,
),

              ],
      ),
    ),
    );
  }
}
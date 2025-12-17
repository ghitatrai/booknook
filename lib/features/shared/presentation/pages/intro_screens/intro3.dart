import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

class Intro3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Container(
    color: ColorsManager.darkSurface,
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
                'Your Personal Library Anywhere',
                style: Theme.of(context).textTheme.bodyLarge,
                
              ),
               const SizedBox(height: 20),
             Text(
  'Access your personal library from any device.\n'
  'Keep your favorite books and notes with you wherever you go.',
  style: Theme.of(context).textTheme.bodyMedium,
  textAlign: TextAlign.center,
),

              ],
      ),
    ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/routing/routers.dart';
import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../../../../core/common_widgets/item_of_lists.dart';
import '../../../../controller/home_controller/home_provider.dart';

class HighPriorityList extends StatelessWidget {
  const HighPriorityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider value, Widget? child) {
        final controller= context.read<HomeProvider>().highPriorityTasks;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'High Priority Tasks',
                  style: AppTextStyle.regular(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      //flex: 4,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.length>4 ?4:controller.length,
                        itemBuilder: (context, index) {
                          return ItemOfLists(

                            isTrailing: false,
                            onChanged: (bool value) {
                              context.read<HomeProvider>().toggleMyTask(
                                  controller[index], value);
                            }, taskEntities: controller[index],
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        context.pushNamed(Routers.highPriorityScreen );
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: context.textBorder),
                          shape: BoxShape.circle,
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SvgPicture.asset(
                            'assets/svgs/arrow_icon.svg',
                            colorFilter: ColorFilter.mode(
                              context.textSecondary,
                              BlendMode.srcIn,
                            ),
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },);

  }
}

part of 'home_widgets_imports.dart';

class BuildTabItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;

  const BuildTabItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 75,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? MyColors.primary : MyColors.grey,
            size: 27,
          ),
          const SizedBox(height: 5),
          MyText(
            title: title,
            size: 10,
            color: isSelected ? MyColors.primary : MyColors.grey,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

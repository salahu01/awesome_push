import 'package:awesome_push/imports.dart';

class BlurryFAB extends StatelessWidget {
  const BlurryFAB({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: IconTheme.of(context).color!, width: 2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: const BlurryEffect(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}

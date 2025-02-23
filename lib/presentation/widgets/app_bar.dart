import 'package:awesome_push/imports.dart';

class AwsomePushAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AwsomePushAppBar({
    this.title,
    super.key,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                FontAwesomeIcons.solidPaperPlane,
              ),
            ),
            Expanded(
              child: Text(
                title ?? 'Awesome Push',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.5,
          child: Divider(
            height: 0,
            thickness: 1.5,
            color: IconTheme.of(context).color?.withOpacity(.1),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}

import 'package:awesome_push/imports.dart';
import 'package:awesome_push/presentation/pages/create_notification_page.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({
    required this.projectIndex,
    super.key,
  });

  final int projectIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AwsomePushAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final project = state.projects[projectIndex];
          if (project.notifications.isEmpty) {
            return const Center(
              child: Text(
                'Couldn\'t Find Notifications!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 80,
              right: 16,
              left: 16,
            ),
            itemCount: project.notifications.length,
            itemBuilder: (context, index) {
              final notification = project.notifications[index];
              if (notification.data == null && notification.title == '' && notification.body == '') {
                return const SizedBox();
              }
              return ListTile(
                title: notification.title != null || notification.data != null ? Text(notification.title ?? '${notification.data}') : null,
                subtitle: notification.body != null ? Text(notification.body ?? '') : null,
                trailing: PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: 'update',
                        child: Text('Update'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 'delete') {
                      context.read<HomeCubit>().removeProject(project);
                    } else if (value == 'update') {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNotificationPage(projectIndex: projectIndex, notification: notification)));
                    }
                  },
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SendNotificationPage(project: project)));
                },
              );
            },
          );
        },
      ),
      floatingActionButton: BlurryFAB(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNotificationPage(projectIndex: projectIndex)));
        },
      ),
    );
  }
}

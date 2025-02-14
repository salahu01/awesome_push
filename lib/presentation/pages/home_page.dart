import 'package:awesome_push/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const AwsomePushAppBar(),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.projects.isEmpty) {
              return const Center(
                child: Text(
                  'Couldn\'t Find Projects!',
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
              itemCount: state.projects.length,
              itemBuilder: (context, index) {
                final project = state.projects[index];
                return ListTile(
                  title: Text(project.name),
                  subtitle: Text(project.projectId),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProjectPage(project: project)));
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateProjectPage()));
          },
        ),
      ),
    );
  }
}

import 'package:awesome_push/imports.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({
    super.key,
    this.project,
  });

  final ProjetModel? project;

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  late final TextEditingController _projectNameCtrl;
  late final TextEditingController _projectIdCtrl;
  late final TextEditingController _serviceAccountJsonCtrl;
  late final TextEditingController _tokensCtrl;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _projectNameCtrl = TextEditingController(text: widget.project?.name);
    _projectIdCtrl = TextEditingController(text: widget.project?.projectId);
    _serviceAccountJsonCtrl = TextEditingController(text: widget.project?.serviceAccountJson);
    _tokensCtrl = TextEditingController(text: widget.project?.tokens.join(','));
  }

  @override
  void dispose() {
    super.dispose();
    _formKey.currentState?.dispose();
    _projectNameCtrl.dispose();
    _projectIdCtrl.dispose();
    _serviceAccountJsonCtrl.dispose();
    _tokensCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBody: true,
        appBar: const AwsomePushAppBar(),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 80,
              right: 16,
              left: 16,
            ),
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: _projectNameCtrl,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the project name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Project Name',
                  hintText: 'Enter the project name',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _projectIdCtrl,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter the firebase project id';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Project Id',
                  hintText: 'Enter the firebase project id',
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _serviceAccountJsonCtrl,
                maxLines: null,
                minLines: 5,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Service Account JSON',
                  hintText: 'Enter the service account JSON',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the service account JSON';
                  }
                  try {
                    final _ = jsonDecode(value);
                  } catch (e) {
                    return 'Please enter a valid JSON';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tokensCtrl,
                maxLines: null,
                minLines: 5,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter some tokens';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Tokens',
                  hintText: 'Enter the tokens separated by comma',
                ),
              ),
              const SizedBox(height: 16 + 16 + 48),
            ],
          ),
        ),
        bottomNavigationBar: BlurryEffect(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final model = ProjetModel(
                    projectId: _projectIdCtrl.text,
                    serviceAccountJson: _serviceAccountJsonCtrl.text,
                    tokens: _tokensCtrl.text.split(','),
                    name: _projectNameCtrl.text,
                  );
                  if (widget.project != null) {
                    context.read<HomeCubit>().updateProject(model);
                    Navigator.pop(context);
                  } else {
                    context.read<HomeCubit>().addProject(model);
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text('Create Project'),
            ),
          ),
        ),
      ),
    );
  }
}

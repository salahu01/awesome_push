import 'package:awesome_push/imports.dart';

class SendNotificationPage extends StatelessWidget {
  const SendNotificationPage({
    required this.project,
    super.key,
  });

  final ProjetModel project;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendNotificationCubit(),
      child: _SendNotificationPage(project: project),
    );
  }
}

class _SendNotificationPage extends StatefulWidget {
  const _SendNotificationPage({
    required this.project,
  });

  final ProjetModel project;

  @override
  State<_SendNotificationPage> createState() => _SendNotificationPageState();
}

class _SendNotificationPageState extends State<_SendNotificationPage> {
  late final TextEditingController _titleCtrl;
  late final TextEditingController _bodyCtrl;
  late final TextEditingController _imageCtrl;
  late final TextEditingController _dataCtrl;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _titleCtrl = TextEditingController();
    _bodyCtrl = TextEditingController();
    _imageCtrl = TextEditingController();
    _dataCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _titleCtrl.dispose();
    _bodyCtrl.dispose();
    _imageCtrl.dispose();
    _dataCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendNotificationCubit, SendNotificationState>(
      listenWhen: (previous, current) => previous.sendNotification != current.sendNotification,
      listener: (context, state) {
        state.sendNotification?.fold(
          () {},
          (t) => t.fold(
            (l) {
              showSnack(
                title: '${l.statusCode ?? 'Error'}',
                message: l.message,
              );
            },
            (r) {
              showSnack(
                title: 'Success',
                message: 'Notification sent successfully',
              );
            },
          ),
        );
      },
      child: GestureDetector(
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
                TextFormField(
                  controller: _titleCtrl,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (((value?.isEmpty ?? true) && _bodyCtrl.text.isNotEmpty) || ((value?.isEmpty ?? true) && _dataCtrl.text.isEmpty)) {
                      return 'Please enter the title';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    hintText: 'Enter the title of the notification',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _bodyCtrl,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (((value?.isEmpty ?? true) && _titleCtrl.text.isNotEmpty) || ((value?.isEmpty ?? true) && _dataCtrl.text.isEmpty)) {
                      return 'Please enter the body';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Body',
                    hintText: 'Enter the body of the notification',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _imageCtrl,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      const urlPattern = r'^(https?|ftp)://[^\s/$.?#].[^\s]*$';
                      final result = RegExp(urlPattern, caseSensitive: false).hasMatch(value);
                      if (!result) {
                        return 'Please enter a valid URL';
                      }
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Banner Image',
                    hintText: 'Enter the URL of the banner image',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _dataCtrl,
                  maxLines: null,
                  minLines: 5,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if ((value?.isEmpty ?? true) && (_titleCtrl.text.isEmpty && _bodyCtrl.text.isEmpty)) {
                      return 'Please enter the data';
                    } else if (value != null && value.isNotEmpty) {
                      try {
                        final _ = jsonDecode(value);
                      } catch (e) {
                        return 'Please enter a valid JSON';
                      }
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Data',
                    hintText: 'Enter the data of the notification',
                  ),
                ),
                const SizedBox(height: 16 + 16 + 48),
              ],
            ),
          ),
          bottomNavigationBar: BlurryEffect(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BlocBuilder<SendNotificationCubit, SendNotificationState>(
                buildWhen: (previous, current) => previous.sendNotification != current.sendNotification,
                builder: (context, state) {
                  var isLoading = state.sendNotification?.isNone() ?? false;
                  return ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SendNotificationCubit>().sendNotification(
                                      projectId: widget.project.projectId,
                                      title: _titleCtrl.text,
                                      body: _bodyCtrl.text,
                                      image: _imageCtrl.text,
                                      tokens: widget.project.tokens,
                                      serviceAccountJson: widget.project.serviceAccountJson,
                                      data: _dataCtrl.text,
                                    );
                              }
                            },
                      child: isLoading
                          ? SizedBox.square(
                              dimension: 24,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(Get.theme.scaffoldBackgroundColor),
                                strokeWidth: 2,
                              ))
                          : const Text('Send Notification'));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

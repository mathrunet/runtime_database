part of masamune.form;

class UIPageChangePassword extends PageHookWidget {
  const UIPageChangePassword();

  @override
  Widget build(BuildContext context) {
    final form = useForm();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password".localize(),
        ),
      ),
      body: ChangePasswordForm(key: form.key),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          if (!form.validate()) {
            return;
          }
          UIDialog.show(
            context,
            title: "Success".localize(),
            text: "%s is completed.".localize().format(["Editing".localize()]),
            submitText: "OK".localize(),
            onSubmit: () {
              context.navigator.pop();
            },
          );
        },
      ),
    );
  }
}

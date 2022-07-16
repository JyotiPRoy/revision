import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:revision/app_style.dart';
import 'package:revision/core/model/question/question.dart';
import 'package:revision/store/home_store.dart';
import 'package:revision/widgets/text_area.dart';

class EditQuestionPage extends StatefulWidget {
  final Question question;
  final void Function(Question) onUpdate;

  EditQuestionPage({
    Key? key,
    required this.question,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<EditQuestionPage> createState() => _EditQuestionPageState();
}

class _EditQuestionPageState extends State<EditQuestionPage> {
  bool isSaving = false;
  bool hasUpdates = false;
  late HomeStore homeStore;
  late TextEditingController _descriptionController;
  late TextEditingController _noteController;
  late TextEditingController _codeController;
  late TextEditingController _urlController;

  @override
  void initState() {
    super.initState();

    final getIt = GetIt.instance;
    homeStore = getIt<HomeStore>();

    _descriptionController =
        TextEditingController(text: widget.question.description);
    _noteController = TextEditingController(text: widget.question.note);
    _codeController = TextEditingController(text: widget.question.code);
    _urlController = TextEditingController(text: widget.question.url);
  }

  void _save(BuildContext context) async {
    if (hasUpdates) {
      setState(() {
        isSaving = true;
      });

      bool isSolved =
          _noteController.text.isNotEmpty || _codeController.text.isNotEmpty;

      final question = widget.question.copyWith(
        isSolved: isSolved,
        description: _descriptionController.text,
        note: _noteController.text,
        code: _codeController.text,
        url: _urlController.text,
      );

      final update = await homeStore.updateQuestion(question);
      widget.onUpdate.call(update);
      setState(() {
        isSaving = false;
      });
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppStyle.backgroundColor,
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: widget.question.title,
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => _save(context),
          child: isSaving
              ? CupertinoActivityIndicator()
              : Text(
                  'Save',
                  style: TextStyle(color: CupertinoColors.white),
                ),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.question.title,
                  style: AppStyle.headingSmallerStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 25,
                ),
                TextArea(
                  title: 'Url',
                  controller: _urlController,
                  onChanged: (val) {
                    hasUpdates = true;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextArea(
                  title: 'Description',
                  controller: _descriptionController,
                  onChanged: (val) {
                    hasUpdates = true;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextArea(
                  title: 'Note',
                  controller: _noteController,
                  onChanged: (val) {
                    hasUpdates = true;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextArea(
                  title: 'Code',
                  controller: _codeController,
                  onChanged: (val) {
                    hasUpdates = true;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

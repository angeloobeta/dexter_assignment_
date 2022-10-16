import 'package:dexter_assignment/model/imports/generalImport.dart';

import '../../reUsableWidgets/general/screenUi.dart';

class AllTask extends StatefulWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  State<AllTask> createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  @override
  Widget build(BuildContext context) {
    return screenUi(
      children: [
        AdaptivePositioned(
            Container(
              height: MediaQuery.of(context).size.width * 0.2,
              color: white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GeneralTextDisplay(
                      "dexter ", red!, 2, 40, FontWeight.w700, ""),
                  GeneralTextDisplay(
                      "All TodoTask", black, 2, 28, FontWeight.w700, ""),
                ],
              ),
            ),
            left: 0,
            top: 0),
      ],
      allowBackButton: false,
    );
  }
}

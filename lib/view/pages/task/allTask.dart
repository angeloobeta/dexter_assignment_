import 'package:dexter_assignment/bloc/task_bloc.dart';
import 'package:dexter_assignment/model/homeModel.dart';
import 'package:dexter_assignment/model/imports/generalImport.dart';
import 'package:dexter_assignment/view/uiElements/edit_todo.dart';

import '../../../Repository/task_repository.dart';
import '../../reUsableWidgets/general/screenUi.dart';

class AllTask extends StatefulWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  State<AllTask> createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  late TaskBloc taskBloc;
  final SlidableController _slidableController;
  final List<HomeModal> items = List.generate(
    11,
        (i) => HomeModal(
      i,
      _position(i),
      _subtitle(i),
      _avatarColor(i),
    ),
  )
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskBloc(repository: TaskRepository())..add(GetAllTasksEvent()),
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: red,
              ),
            );
          } else if (state is TaskLoadedState) {
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
                          GeneralTextDisplay("All TodoTask", black, 2, 28,
                              FontWeight.w700, ""),
                        ],
                      ),
                    ),
                    left: 0,
                    top: 0),
                Positioned(
                    child: SingleChildScrollView(
                      child: S(
                          w: 375,
                          h: 700,
                          child: ListView.builder(
                              itemCount: state.taskList.length != null
                                  ? state.taskList.length
                                  : 0,
                              itemBuilder: (BuildContext c, int index) {
                                return GestureDetector(
                                  onTap: () => editTask(context: context),
                                  child: Column(
                                    children: [
                                      GeneralTextDisplay(
                                          "${state.taskList[index].title == null ? "None" : state.taskList[index].title}",
                                          black,
                                          2,
                                          16,
                                          FontWeight.w700,
                                          ""),
                                      // GeneralTextDisplay(
                                      //     "${state.taskList[index].description == null ? "None" : state.taskList[index].description}",
                                      //     black,
                                      //     2,
                                      //     16,
                                      //     FontWeight.w700,
                                      //     "")
                                    ],
                                  ),
                                );
                              })),
                    ),
                    top: sS(context).cH(height: 100),
                    bottom: 15,
                    left: 10,
                    right: 0),
              ],
              allowBackButton: false,
            );
          }

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
              AdaptivePositioned(
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GeneralTextDisplay(
                            "No dexterTask", black, 2, 28, FontWeight.w700, ""),
                      ],
                    ),
                  ),
                  left: 0,
                  top: 250),
            ],
            allowBackButton: false,
          );
        },
      ),
    );
  }
}

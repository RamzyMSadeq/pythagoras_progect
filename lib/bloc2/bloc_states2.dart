

abstract class BlocStates2 {
  const BlocStates2();
}

class TasksLoadingState2 extends BlocStates2 {}


class TasksErrorState2 extends BlocStates2 {
  String error;
  TasksErrorState2(this.error);
}

class EmptyTasksState2 extends BlocStates2 {}

class SuccessState2 extends BlocStates2 {}


class SetVideoState2 extends BlocStates2 {
  String newVideo;
  SetVideoState2(this.newVideo);
}

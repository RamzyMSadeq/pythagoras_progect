import 'package:bloc/bloc.dart';


import 'bloc_events2.dart';
import 'bloc_states2.dart';

class UserBloc2 extends Bloc<BlocEvents2, BlocStates2> {
  UserBloc2(BlocStates2 initialState) : super(initialState);
  
  String videoIni;

  @override
  Stream<BlocStates2> mapEventToState(BlocEvents2 event) async* {

    //////////////////////////////////////
    if (event is SetVideoEvent2) {
      try {
        yield TasksLoadingState2();

        if (event.newVideo != null) {
          videoIni = event.newVideo;
          yield SetVideoState2(event.newVideo);
        } else {
          print("bbbbbbbbbbbbbbbbbbbbbbbnnnnnnnnnnnnnn");
        }
      } catch (e) {
        yield TasksErrorState2(e.toString());
      }
    }

    
  }

  
    

   
  }


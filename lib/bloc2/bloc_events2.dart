
abstract class BlocEvents2 {
  const BlocEvents2();
}



class SetVideoEvent2 extends BlocEvents2 {
  String newVideo;
  SetVideoEvent2(this.newVideo);
}

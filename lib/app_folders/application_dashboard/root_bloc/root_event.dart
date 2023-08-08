abstract class RootEvents{
  const RootEvents();
}

class TriggerRootEvent extends RootEvents{
  final int index;
  const TriggerRootEvent(this.index):super();
}
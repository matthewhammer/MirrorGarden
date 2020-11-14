import Array "mo:base/Array";
import Result "mo:base/Result";
import Render "mo:redraw/Render";
import Types "Types";
import State "State";
import Debug "mo:base/Debug";
import LangText "../lang/text";

actor {

  flexible var textEditor = LangText.Editor();
  flexible var state = State.initState();

  /// attempt to "commit" a block of local events to the state's commitLog
  public func update(events : [Types.EventInfo]) {
    textEditor.update(events);
    // commit to log
    for (ev in events.vals()) {
      state.commitLog.add(ev);
    };
  };

  public query func view(
    windowDim : Render.Dim,
    events : [Types.EventInfo])
    : async Types.Graphics
  {
    textEditor.view(windowDim, events)
  };

};

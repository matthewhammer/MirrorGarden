import Array "mo:base/Array";
import Result "mo:base/Result";
import Render "mo:redraw/Render";
import Debug "mo:base/Debug";

import Types "Types";
import State "State";
import Draw "Draw";

module {

public class Editor() {

  var state = State.initState();

  /// attempt to "commit" a block of local events to the state's commitLog
  public func update(
    events : [Types.EventInfo],
    gfxReq: Types.GraphicsRequest) : [Types.Graphics] 
  {
    let gfx = State.update(state, events, gfxReq);
    // commit to log
    for (ev in events.vals()) {
      state.commitLog.add(ev);
    };
    gfx
  };

  public func view(
    windowDim : Render.Dim,
    events : [Types.EventInfo])
    : Types.Graphics
  {
    let temp = State.clone(state);
    temp.viewEvents := events;
    ignore State.update(temp, events, #none);
    redrawScreen(windowDim, temp)
  };

  func redrawScreen(
    windowDim : Render.Dim,
    state : Types.State)
    : Types.Graphics
  {
    let elm = Draw.drawState(state, windowDim);
    #ok(#redraw([("screen", elm)]))
  }

};

};

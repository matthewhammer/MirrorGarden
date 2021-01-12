import Array "mo:base/Array";
import Result "mo:base/Result";
import Debug "mo:base/Debug";

import Render "mo:redraw/Render";

import DebugOff "mo:stand/DebugOff";

import Types "../src/service/Types";
import State "../src/service/State";

import LangText "../lang/text";

import Calc "mo:adapton/eval/Calc";

actor {

  flexible var textEditor = LangText.Editor();
  flexible var state = State.initState();

  /// attempt to "commit" a block of local events to the state's commitLog
  public func update(events : [Types.EventInfo], 
                     gfxReq: Types.GraphicsRequest) : async [Types.Graphics] 
  {
    let gfx = textEditor.update(events, gfxReq);
    // commit to log
    for (ev in events.vals()) {
      state.commitLog.add(ev);
    };
    gfx
  };

  public query func view(
    windowDim : Render.Dim,
    events : [Types.EventInfo])
    : async Types.Graphics
  {
    let v1 = textEditor.view(windowDim, events);
    let v2 = adaptonCalc();

    // TEMP -- need a real command/menu system soon
    if (windowDim.width < windowDim.height) { v2 } else { v1 };
  };


  func adaptonCalc() : Types.Graphics {
    DebugOff.print "Redraw begin";

    // test the Calc definition imported above:
    let calc = Calc.Calc();

    DebugOff.print "Calc() done.";

    let exp =
      #named("f",
             #add(
               #named("g", #div(#num(4), #mul(#num(6), #num(2)))),
               #named("a",
                      #div(#named("b", #mul(#num(3), #named("c", #add(#num(1), #num(2))))),
                           #named("d", #sub(#num(5), #named("e", #div(#num(4), #num(2)))))
                      ))));

    let res = calc.eval(exp);
    calc.engine.draw().logEventLast();
    calc.engine.draw().getResult()
  };
};

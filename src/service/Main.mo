import Array "mo:base/Array";
import Result "mo:base/Result";
import Render "mo:redraw/Render";
import Types "Types";
import State "State";
import Debug "mo:base/Debug";
import LangText "../lang/text";

import Calc "mo:adapton/eval/Calc";

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
    let v1 = textEditor.view(windowDim, events);

    // TEMP
    let v2 = adaptonCalc();
    if false { v1 } else { v2 };
  };


  func adaptonCalc() : Types.Graphics {
    Debug.print "Redraw begin";

    // test the Calc definition imported above:
    let calc = Calc.Calc();

    Debug.print "Calc() done.";

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

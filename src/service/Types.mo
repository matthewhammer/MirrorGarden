import List "mo:base/List";
import Buffer "mo:base/Buffer";
import Result "mo:base/Result";
import Render "mo:redraw/Render";

import TextSeq "mo:sequence/Text";
import Seq "mo:sequence/Sequence";
import Stream "mo:sequence/Stream";

import RedrawTypes "mo:redraw/Types";

module {

public type State = {
  commitLog : Buffer.Buffer<EventInfo>;
  var viewEvents : [EventInfo];
  var currentEvent : ?RedrawTypes.Event.EventInfo;
};

// input events (from local terminal to remote service)
public type EventInfo = RedrawTypes.Event.EventInfo;
public type KeyInfo = RedrawTypes.Event.KeyInfo;

// graphical output (from remote service to local terminal)
public type Graphics = RedrawTypes.Graphics.Result;

}

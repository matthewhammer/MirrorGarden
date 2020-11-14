import Types "Types";

import List "mo:base/List";
import Buffer "mo:base/Buffer";
import Result "mo:base/Result";

module {
  type State = Types.State;

  public func initState() : Types.State {
     {
       commitLog = Buffer.Buffer<Types.EventInfo>(0);
       var viewEvents = ([] : [Types.EventInfo]);
       var currentEvent = (null : ?Types.EventInfo);
     }
  };

  public func clone(st : State) : State {
    {
      commitLog = st.commitLog;
      var viewEvents = st.viewEvents;
      var currentEvent = st.currentEvent;
    }
  };
}

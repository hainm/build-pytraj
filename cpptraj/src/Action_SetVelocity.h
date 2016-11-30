#ifndef INC_ACTION_SETVELOCITY_H
#define INC_ACTION_SETVELOCITY_H
#include "Action.h"
#include "Random.h"
/// Calculate the temperature of parts of a system.
class Action_SetVelocity : public Action {
  public:
    Action_SetVelocity();
    DispatchObject* Alloc() const { return (DispatchObject*)new Action_SetVelocity(); }
    void Help() const;
  private:
    Action::RetType Init(ArgList&, ActionInit&, int);
    Action::RetType Setup(ActionSetup&);
    Action::RetType DoAction(int, ActionFrame&);
    void Print() {}

    AtomMask Mask_;
    std::vector<double> SD_;
    double tempi_;
    Random_Number RN_;
    CoordinateInfo cInfo_;
    Frame newFrame_;
};
#endif

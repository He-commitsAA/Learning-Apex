trigger WhenCreateCase on Case (before insert) {

    MaxedOut.check(Trigger.new);
}
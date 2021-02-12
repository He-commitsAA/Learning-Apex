trigger WhenContactGetsAccount on Contact (before insert, before update) {
        PrimaryContactChecker.check(Trigger.new);
}
global inherited sharing class MaxedOut {

    public static Integer m = Date.today().month();

    public static void check(List<Case> cases){

        for(Case c: cases){

            List<Case> otherCases = [select subject,createdbyid,createddate from case where createdbyid =: UserInfo.getUserId() AND CALENDAR_MONTH(createddate) =: m];
            if(otherCases.size() > = 99){
                c.addError('You have already created at least 99 cases this month!');
            }
        }
    }

}

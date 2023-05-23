// Apex Class

public class StudentUpdate {

    public static void updateMobile(List<Student__c> newStudents) {
        // Get the list of new Students
        List<Student__c> studentList = [SELECT Id, Phone, Mobile__c FROM Student__c WHERE Id IN :newStudents];

        // Iterate through each of the new Students
        for (Student__c s : studentList) {
            // If the Phone field is not blank, set the Mobile__c field to the same value
            if (!String.isBlank(s.Phone)) {
                s.Mobile__c = s.Phone;
            } else {
                // Otherwise, set the Mobile__c field to blank
                s.Mobile__c = '';
            }
        }
        // Update the new Students
        update studentList;
    }

}
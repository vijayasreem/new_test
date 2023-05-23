//Salesforce Unit Test
@isTest
public class StudentUpdateTest {

    @isTest
    static void testUpdateMobile() {
        // Setup data
        List<Student__c> newStudents = new List<Student__c>();

        // Create a new student with valid Phone
        Student__c validPhoneStudent = new Student__c(Phone='123456789');
        insert validPhoneStudent;

        // Create a new student without valid Phone
        Student__c blankPhoneStudent = new Student__c(Phone='');
        insert blankPhoneStudent;

        // Add the new Students to the list
        newStudents.add(validPhoneStudent);
        newStudents.add(blankPhoneStudent);

        // Test the updateMobile method
        Test.startTest();
        StudentUpdate.updateMobile(newStudents);
        Test.stopTest();

        // Verify that the Mobile__c field has been updated correctly
        Student__c updatedValidPhoneStudent = [SELECT Id, Phone, Mobile__c FROM Student__c WHERE Id = :validPhoneStudent.Id];
        System.assertEquals('123456789', updatedValidPhoneStudent.Mobile__c);

        Student__c updatedBlankPhoneStudent = [SELECT Id, Phone, Mobile__c FROM Student__c WHERE Id = :blankPhoneStudent.Id];
        System.assertEquals('', updatedBlankPhoneStudent.Mobile__c);
    }

}
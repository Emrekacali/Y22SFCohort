public class EmployeeInfo {
    public static void show() {
   
        list <Employee__c> listEmp = [SELECT Id, First_Name__c, Last_Name__c, JoinDate__c FROM Employee__c order by 
        JoinDate__c desc];
   
    }  

    }
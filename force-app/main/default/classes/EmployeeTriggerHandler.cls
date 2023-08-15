public class EmployeeTriggerHandler {
    public static void updateDepartmentPhone(List<employee__c> empTriggerNew, Map<id, employee__c> empTriggerMap, List<employee__c> empTriggerOld, Map<id, employee__c> empTriggerOldMap) {
           //get department ids
           map<id, string> deptIdsPhone = new map <id, string>();
           for (Employee__c newEmp : empTriggerNew) {
            if (newEmp.Department__c != null) {
                //deptIds.add(newEmp.Department__c);
                //adding dept id and phone which we want to update in that department
                deptIdsPhone.put(newEmp.Department__c, newEmp.department_phone__c);
            }
        }

            List<department__c> allDepts = [select id, department_phone__c from Department__c where id in :deptIdsPhone.keySet()];
                  
            for (Department__c eachDep : allDepts) {
            eachDep.department_phone__c = deptIdsPhone.get(eachDep.Id);
            }
            update allDepts;
    }
}
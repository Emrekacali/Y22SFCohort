try {
    StudentMarks sm = new StudentMarks();
    sm.validateMarks(-55);
} catch(StudentMarks.MarksException sme){
    system.debug('marks exception: '+ sme);
}
 catch (Exception ex) {
    system.debug('general exception: ' + ex);
 }
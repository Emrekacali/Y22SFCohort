StudentDemo s = new StudentDemo();
s.show();

system.debug('-----');

try { 
    studentDemo s1 = new StudentDemo(18, '');
    s1.show();
} catch (StudentException se) {
    system.debug('student exception: ');
    system.debug(se);
}

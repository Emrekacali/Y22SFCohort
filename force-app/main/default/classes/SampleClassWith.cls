public with sharing class SampleClassWith {
    public SampleClassWith() {
    //respect sharing rules
    }
    public void methodWithA(){
        SampleClassWithout s = new SampleClassWithout();
        s.methodWithout2();
    }
}
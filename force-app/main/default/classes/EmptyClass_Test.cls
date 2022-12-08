@isTest
private without sharing class EmptyClass_Test {
    @isTest
    private static void emptyClassInitialiserTest(){
        Test.startTest();
        EmptyClass empty = new EmptyClass();
        Test.stopTest();

        Assert.areEqual('Diego', empty.getTestString());
        Assert.isInstanceOfType(empty, EmptyClass.class);
    }
}

@IsTest
private class OpportunitySelectorTest {
    @TestSetup
    static void setup() {
        Account testAccount = TestDataFactory.createTestAccount();
        TestDataFactory.createTestOpportunity(testAccount.Id);
    }

    @IsTest
    static void testGetOpportunitiesByAccountId() {
        // Récupérer le compte de test
        Account testAccount = [SELECT Id FROM Account LIMIT 1];
        Test.startTest();
        List<Opportunity> results = OpportunitySelector.getOpportunitiesByAccountId(testAccount.Id);
        Test.stopTest();
        Assert.areNotEqual(0, results.size(), 'Should return at least one opportunity');
    }
}
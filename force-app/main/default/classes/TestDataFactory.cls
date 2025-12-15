@IsTest
public class TestDataFactory {

    // Méthode pour créer un compte de test
    public static Account createTestAccount() {
        Account acc = new Account(Name='Test Account');
        insert acc;
        return acc;
    }
// Méthode pour créer une opportunité de test lié à un compte spécifique
    public static Opportunity createTestOpportunity(Id accountId) {
        Opportunity opp = new Opportunity(
                Name='Test Opportunity',
                StageName='Prospecting',
                CloseDate=System.today().addDays(30),
                Amount=10000,
                AccountId=accountId
        );
        insert opp;
        return opp;
    }

    // Méthode pour créer un cas de test lié à un compte spécifique
    public static Case createTestCase(Id accountId) {

        Case caseTest = new Case(
            AccountId = accountId,
            Subject = 'Login Issue',
            Status = 'New',
            Priority = 'High'
        );
        insert caseTest;
        return caseTest;
    }
}
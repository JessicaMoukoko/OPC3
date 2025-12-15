@isTest
public class AccountCasesControllerTest {

    @testSetup
    static void setup() {
        // Créer un compte de test
        Account testAccount = TestDataFactory.createTestAccount();

        // Créer des cas de test
        List<Case> casesToInsert = new List<Case>();
        
        Case testCase = TestDataFactory.createTestCase(testAccount.Id);
        casesToInsert.add(testCase);
    }

    @isTest
    static void testFindCasesBySubject_WithValidSearchTerm() {
        // Récupérer le compte de test
        Account testAccount = [SELECT Id FROM Account WHERE Name = 'Test Account' LIMIT 1];

        // Appeler la méthode avec un terme de recherche valide
        List<Case> result = AccountCasesController.findCasesBySubject(testAccount.Id, 'Login');

        // Vérifications
        Assert.areEqual(1, result.size(), 'Doit retourner 1 cas avec le terme "Login"');
        Assert.areEqual('Login Issue', result[0].Subject, 'Le sujet doit être "Login Issue"');
    }


    @isTest
    static void testFindCasesBySubject_WithEmptySearchTerm() {
        // Récupérer le compte de test
        Account testAccount = [SELECT Id FROM Account WHERE Name = 'Test Account' LIMIT 1];

        // Appeler la méthode avec un terme vide
        List<Case> result = AccountCasesController.findCasesBySubject(testAccount.Id, '');

        // Vérifications
        Assert.areEqual(0, result.size(), 'Doit retourner une liste vide pour un terme vide');
    }


    @isTest
    static void testFindCasesBySubject_WithNoMatches() {
        // Récupérer le compte de test
        Account testAccount = [SELECT Id FROM Account WHERE Name = 'Test Account' LIMIT 1];

        // Appeler la méthode avec un terme qui ne correspond à aucun cas
        List<Case> result = AccountCasesController.findCasesBySubject(testAccount.Id, 'XYZ123NoMatch');

        // Vérifications
        Assert.areEqual(0, result.size(), 'Doit retourner une liste vide pour un terme sans correspondance');
    }

}

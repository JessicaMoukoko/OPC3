public with sharing class AccountCasesController {

    // Methode qui permet de rechercher des cas liés à un compte spécifique en fonction d'un terme de recherche dans le sujet.
    @AuraEnabled(cacheable=true)
    public static List<Case> findCasesBySubject(Id accountId, String subjectSearchTerm) {
        // Vérifie si le terme de recherche est vide ou nul
        if (String.isBlank(subjectSearchTerm)) {
            return new List<Case>();
        }

        // Requête SOQL pour récupérer les cas liés au compte avec le sujet correspondant
        List<Case> cases = [
            SELECT Id, CaseNumber, Subject, Status, Priority
            FROM Case
            WHERE AccountId = :accountId
            // Recherche partielle dans le sujet
              AND Subject LIKE :('%' + subjectSearchTerm + '%')
               // Application des règles de sécurité
                WITH SECURITY_ENFORCED
            ORDER BY CreatedDate DESC
           
        ];

        return cases;
    }
}

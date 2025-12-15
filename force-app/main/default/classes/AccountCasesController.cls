public with sharing class AccountCasesController {

    @AuraEnabled(cacheable=true)
    public static List<Case> findCasesBySubject(Id accountId, String subjectSearchTerm) {
        if (String.isBlank(subjectSearchTerm)) {
            return new List<Case>();
        }

        List<Case> cases = [
            SELECT Id, CaseNumber, Subject, Status, Priority
            FROM Case
            WHERE AccountId = :accountId
              AND Subject LIKE :('%' + subjectSearchTerm + '%')
            ORDER BY CreatedDate DESC
        ];

        return cases;
    }
}

public with sharing class OpportunitySelector {

    // Méthode pour récupérer les opportunités liées à un compte spécifique.
    public static List<Opportunity> getOpportunitiesByAccountId(Id accountId) {
        return [SELECT Id, Name, Amount, CloseDate, StageName FROM Opportunity WHERE AccountId = :accountId];
    }
}
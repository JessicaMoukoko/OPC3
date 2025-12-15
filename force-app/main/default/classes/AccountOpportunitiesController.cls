public with sharing class AccountOpportunitiesController {

    // Méthode qui permet de récupérer les opportunités liées à un compte spécifique.
    @AuraEnabled(Cacheable=true)
    public static List<Opportunity> getOpportunities(Id accountId) {
        return OpportunitySelector.getOpportunitiesByAccountId(accountId);
    }
}
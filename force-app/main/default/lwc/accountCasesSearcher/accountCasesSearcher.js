import { LightningElement, track, api } from 'lwc';
import findCasesBySubject from '@salesforce/apex/AccountCasesController.findCasesBySubject';
import { reduceErrors } from 'c/ldsUtils';

const COLUMNS = [
    { label: 'Sujet', fieldName: 'Subject', type: 'text' },
    { label: 'Statut', fieldName: 'Status', type: 'text' },
    { label: 'Priorité', fieldName: 'Priority', type: 'text' },
];

export default class AccountCaseSearchComponent extends LightningElement {
    @api recordId;
    @track cases;
    @track error;
    searchTerm = '';
    columns = COLUMNS;

    updateSearchTerm(event) {
        this.searchTerm = event.target.value;
    }

    handleSearch() {
        if (!this.searchTerm) {
            this.error = 'Veuillez entrer un mot clé pour la recherche.';
            this.cases = undefined;
            return;
        }

        findCasesBySubject({ accountId: this.recordId, subjectSearchTerm: this.searchTerm })
            .then(result => {
                this.cases = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = reduceErrors(error);
                this.cases = undefined;
            });
    }
}

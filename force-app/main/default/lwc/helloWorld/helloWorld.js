import { LightningElement, track } from 'lwc';

export default class HelloWorld extends LightningElement {
    @track person = 'Person';

    personChangeHandler(event){
        this.person = event.target.value;
    }

}
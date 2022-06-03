export default class PagyData {

    table_classes= [
        "table",
        "table-striped",
        "table-row-bordered"
    ]
    
    constructor(element_selector){
        this.element = document.querySelector(element_selector)
        console.log(this.element);
        if(!!this.element){
            this.element.className+=this.table_classes.join(" ")
            console.log(this.element.className);
        }
    }
}
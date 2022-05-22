export default class PagyData {

    table_classes= [
        "table",
        "table-striped",
        "table-row-bordered"
    ]
    
    constructor(element_selector){
        this.element = document.querySelector(element_selector)
        if(!!this.element){
            this.element.className+=this.table_classes.join(" ")
            this.data_url  = this.element.data('url')
            this.fetch_data().then((response) => {
                
            })
        }
    }

    fetch_data = async () => {
        response = await fetch(
            this.data_url,
        )
    }

    data_pagination = ()=> {

    }
}
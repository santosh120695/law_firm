select_tag = document.getElementById("title-status-select")
if(select_tag){
    select_tag.addEventListener('change', function(event){
        updateStatus(event)
    })
}

const updateStatus = async (event) => {
    const selected_status = event.target.value
    const title = event.target.dataset.title
    let response = await fetch("/titles/"+title+"/status_update",{
        method: "POST",
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({status: selected_status}),
    })
}


let costs = document.querySelectorAll(".cost")

calculate_total_amount = () => {
    let total_amount = 0
    costs.forEach(element => {
        if(element.value){
            console.log(typeof(element.value));
            total_amount+=parseFloat(element.value)
        }
    })
    document.getElementsByClassName('total_amount')[0].value = total_amount
}

if(costs){
    costs.forEach(element => {
        element.addEventListener('change', function(){
            calculate_total_amount()
        })
    });
}
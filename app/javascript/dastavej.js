dastavej_status_tag = document.getElementById('dastavej-status-select')
console.log("dastavej");
if (dastavej_status_tag) {
    dastavej_status_tag.addEventListener('change', function(event){
        console.log("change");
        updateDastavejStatus(event)
    })
}

updateDastavejStatus = async (event) => {
    const selected_status = event.target.value 
    console.log(selected_status);
    const dastavej = event.target.dataset.dastavej 
    let response = await fetch("/dastavejs/"+ dastavej +"/dastavej_status_update/", {
        method: "POST",
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({status: selected_status})
    })


}
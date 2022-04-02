select_tag = document.getElementById("title-status-select")
if(select_tag){
    select_tag.addEventListener('change', function(event){
        updateStatus(event)
    })
}


const updateStatus = async (event) => {
    const selected_status = event.target.value
    console.log(selected_status);
    const title = event.target.dataset.title
    let response = await fetch("/titles/"+title+"/status_update",{
        method: "POST",
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({status: selected_status}),
    })
}
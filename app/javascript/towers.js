import { get_projects } from "./apis";

const tower_client = document.getElementsByClassName('clients_towers')[0]
const tower_project  = document.getElementsByClassName('projects_towers')[0]
if(tower_client){
    tower_client.addEventListener("change", function(){
        get_projects(tower_client.value).then(response => {
            let options = "<option></option>"
            response.data.forEach(data => {
                console.log(data);
                options+="<option value="+ data.uuid + ">"+data.name + "</option>" 
            });
            console.log(options);
            tower_project.innerHTML = options
        })
    })
}
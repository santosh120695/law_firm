const get_towers = async (project_id) => {
    response = await fetch('/projects/' + project_id + '/get_towers')
    return response.json()
}

const get_floors = async (tower_id) => {
    response = await fetch('/projects/get_floors?tower_id='+ tower_id)
    return response.json()
}

const get_projects = async (client_id) => {
    response  = await fetch('/projects.json?id='+client_id)
    return response.json()
}

const get_units = async (floor_id) => {
    response = await fetch('/units.json?floor_id='+floor_id)
    return response.json()
}

document.addEventListener("DOMContentLoaded", function () {
    const unit_project_dropdown = document.getElementById("unit_project_id")
    const unit_tower_dropdown = document.getElementById("unit_tower_id")
    const dastavej_client_dropdown = document.getElementById("dastavej_client_id")
    const dastavej_tower_dropdown = document.getElementById('dastavej_tower_id')
    const dastavej_project_dropdown = document.getElementById('dastavej_project_id')
    const dastavej_floor_dropdown = document.getElementById('dastavej_floor_id')

    if (unit_project_dropdown){
        unit_project_dropdown.addEventListener('change', function(){
            get_towers(unit_project_dropdown.value).then(response => {
                options = "<option></option>"
                response.data.forEach(data => {
                    options+="<option value="+ data[1] + ">"+ data[0] + "</option>"
                })
                document.getElementById("unit_tower_id").innerHTML = options
            })
        })
    }

    if (unit_tower_dropdown){
        unit_tower_dropdown.addEventListener('change', function(){
            get_floors(unit_tower_dropdown.value).then(response => {
                options = ""
                response.data.forEach(data => {
                    options+="<option value="+data[1] + ">" + data[0] + "</option>"
                })
                console.log(options);
                document.getElementById("unit_floor_id").innerHTML = options
            })
        })
    }

    if (dastavej_client_dropdown){
        dastavej_client_dropdown.addEventListener('change', function(){
            get_projects(dastavej_client_dropdown.value).then(response => {
                options = "<option></option>"
                response.data.forEach(data => {
                    options += "<option value="+data.id+">"+data.name+ "</option>"
                })
                document.getElementById("dastavej_project_id").innerHTML = options
            })
        })
    }

    if(dastavej_project_dropdown){
        dastavej_project_dropdown.addEventListener('change', function(){
            get_towers(dastavej_project_dropdown.value).then(response => {
                options = "<option></option>"
                response.data.forEach(data => {
                    options += "<option value=" + data[1] + ">" + data[0] + "</option>"
                })
                document.getElementById("dastavej_tower_id").innerHTML = options
            })
        })
    }

    if (dastavej_tower_dropdown){
        dastavej_tower_dropdown.addEventListener('change', function(){
            get_floors(dastavej_tower_dropdown.value).then(response => {
                console.log(response.data);
                options = "<option></option>"
                response.data.forEach(data => {
                    options+="<option value="+ data[1] + ">" + data[0] + "</option>"
                })
                document.getElementById("dastavej_floor_id").innerHTML = options
            })
        })
    }

    if(dastavej_floor_dropdown){
        dastavej_floor_dropdown.addEventListener('change', function(){
            console.log(dastavej_floor_dropdown.value);
            get_units(dastavej_floor_dropdown.value).then(response => {
                console.log(response);
                options = "<option></option>"
                response.data.forEach(data => {
                    options += "<option value=" + data.id + ">" + data.name + "</option>"
                })
                console.log(options);
                document.getElementById("dastavej_unit_id").innerHTML = options
            })
        })
    }


})
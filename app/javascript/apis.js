export const get_towers = async (project_id) => {
    response = await fetch('/projects/' + project_id + '/get_towers')
    return response.json()
}

export const get_floors = async (tower_id) => {
    response = await fetch('/projects/get_floors?tower_id=' + tower_id)
    return response.json()
}

export const get_projects = async (client_id) => {
    response = await fetch('/projects.json?id=' + client_id)
    return response.json()
}

export const get_units = async (floor_id) => {
    response = await fetch('/units.json?floor_id=' + floor_id)
    return response.json()
}

export const submit_stage = async(stage_params) => {
    response = await fetch(`/stages/${stage_params['id']}.json`,{
        method: "PUT",
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ stage: stage_params }),
    })
}
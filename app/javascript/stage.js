import { submit_stage } from "./apis";

document.querySelectorAll('.stage-field').forEach((element) => {
    element.addEventListener('change', function(event){
        event.preventDefault()
        let stage_params = {}
        stage_params[element.name] = element.value 
        stage_params['id'] = document.getElementById('stage_id').value
        submit_stage(stage_params)
    })
})
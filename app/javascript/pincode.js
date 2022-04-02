const call_api = async (pincode) => {
    response = await fetch("https://api.postalpincode.in/pincode/"+pincode)
    return response.json()
}

document.addEventListener("DOMContentLoaded", function(){
    title_pincode = document.getElementById("title_pincode")
    if(title_pincode){
        title_pincode.addEventListener('change', function(){
            call_api(title_pincode.value).then(response=>{
                console.log(response[0]["PostOffice"]);
                let village_options = ""
                let taluka_options = ""
                const data = response[0]["PostOffice"]
                for(var i=0; i< data.length; i++){
                    village_options += "<option value='" + data[i]['Name'] + "'>" + data[i]["Name"] + "</option>"
                    taluka_options += "<option value='" + data[i]["Block"] + "'>" + data[i]["Block"] + "</option>"
                }
                document.getElementById("title_village").innerHTML = village_options
                document.getElementById("title_taluka").innerHTML = taluka_options
            })
        })
    }
})



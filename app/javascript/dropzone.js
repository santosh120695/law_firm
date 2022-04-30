import Dropzone from "dropzone";

console.log("dropzone");

Dropzone.autoDiscover = false

if (document.getElementById("titles_upload")){
    title_id = window.location.href.split("/").pop()
    let dropzone = new  Dropzone("#titles_upload", {
        url: "/titles/"+title_id+"/add_files",
        addedfile: file => {
            console.log(file);
        }
    })

}
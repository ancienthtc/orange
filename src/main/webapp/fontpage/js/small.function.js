/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function loadingShow() {
    var loadingContainer = $("div.loading");
    if (loadingContainer.length <= 0) {
        loadingContainer = $("<div>", {Class: "loadingWhenSave", id: "loadingWhenSave"});
        var img = $("<img >", {src: "../assets/front/images/loading.gif", width: "50px"});
        loadingContainer.html("");
        loadingContainer.append(img).css({
            position: "absolute",
            zIndex: "9999",
            textAlign: "center",            
            opacity: 1.0,
            paddingTop: "18px",
            fontSize: "14px",
            top: "45%",
            left:"45%"
        });
        

        loadingContainer.appendTo('body');
        
    }

}




function loadingHide() {
    $("#loadingWhenSave").remove();
}

                           
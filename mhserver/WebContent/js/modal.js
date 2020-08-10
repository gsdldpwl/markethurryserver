// modal function
function openModal(modalname){
    document.get
    $("#modal").fadeIn(300);
    $("."+modalname).fadeIn(300);
}

$("#modal, .close, .yes").on('click',function(){
    $("#modal").fadeOut(300);
    $(".modal_common").fadeOut(300);
});
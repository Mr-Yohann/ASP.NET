
/*form1-1*/
function work(target) {
    $("#view1").attr("style", "display:none;");//隐藏div
    $(".view-img").attr("style", "display:block;");//显示div
    $(".view-img").html("<div class='view-title'>设备图片</div><br> <img src = '../images/" + $(target).text() + "' /> ");
};
function hiddenView1Img() {
    $("#view1").attr("style", "display:block;");//隐藏div
    $(".view-img").attr("style", "display:none;");//显示div
};

/*form1-2*/
function work2(target) {
    $('#search').attr('style', 'display:none;');
    $(".view-table").attr("style", "display:none;");//隐藏div
    $(".view-img").attr("style", "display:block;");//显示div
    $(".view-img").html("<div class='view-title'>设备图片</div><br> <img src = '../images/" + $(target).text() + "' /> ");
};
function hiddenView1Img2() {
    $('#search').attr('style', 'display:block;');
    $(".view-table").attr("style", "display:block;");//隐藏div
    $(".view-img").attr("style", "display:none;");//显示div
};